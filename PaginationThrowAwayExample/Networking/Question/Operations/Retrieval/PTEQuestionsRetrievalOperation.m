//
//  PTEQuestionsRetrievalOperation.m
//  PaginationThrowAwayExample
//
//  Created by William Boles on 15/02/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

#import "PTEQuestionsRetrievalOperation.h"

#import "PTEFeed.h"
#import "PTEPage.h"
#import "PTEQuestionParser.h"

@interface PTEQuestionsRetrievalOperation ()

@property (nonatomic, strong) PTEFeed *feed;
@property (nonatomic, strong) NSData *data;
@property (nonatomic, copy) void (^completion)(BOOL successful);

@property (nonatomic, strong) NSOperationQueue *callBackQueue;

@end

@implementation PTEQuestionsRetrievalOperation

#pragma mark - Init

- (instancetype)initWithFeed:(PTEFeed *)feed
                        data:(NSData *)data
                  completion:(void(^)(BOOL successful))completion
{
    self = [super init];
    
    if (self)
    {
        self.feed = feed;
        self.data = data;
        self.completion = completion;
        self.callBackQueue = [NSOperationQueue currentQueue];
    }
    
    return self;
}

#pragma mark - Main

- (void)main
{
    [super main];
    
    NSError *serializationError = nil;
    
    NSDictionary *jsonResponse = [NSJSONSerialization JSONObjectWithData:self.data
                                                                 options:NSJSONReadingMutableContainers
                                                                   error:&serializationError];
    
    if (serializationError)
    {
        [self.callBackQueue addOperationWithBlock:^
         {
             if (self.completion)
             {
                 self.completion(NO);
             }
         }];
    }
    else
    {
        PTEQuestionParser *parser = [[PTEQuestionParser alloc] init];
        PTEPage *page = [parser parseQuestions:jsonResponse];
        
        page.nextHref = [NSString stringWithFormat:@"%@&page=%@", kPTEBaseURLString, @(self.feed.pages.count + 1)];
        
        [self.feed addPage:page];
        
        /*----------------*/
        
        [self.callBackQueue addOperationWithBlock:^
        {
            if (self.completion)
            {
                self.completion(YES);
            }
        }];
    }
}

@end
