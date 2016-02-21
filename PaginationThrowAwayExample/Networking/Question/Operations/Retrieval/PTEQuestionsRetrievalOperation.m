//
//  PTEQuestionsRetrievalOperation.m
//  PaginationThrowAwayExample
//
//  Created by William Boles on 15/02/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

#import "PTEQuestionsRetrievalOperation.h"

#import "PTEFeed.h"

@interface PTEQuestionsRetrievalOperation ()

@property (nonatomic, strong) PTEFeed *feed;
@property (nonatomic, strong) NSDictionary *response;

@end

@implementation PTEQuestionsRetrievalOperation

#pragma mark - Init

- (instancetype)initWithFeed:(PTEFeed *)feed
                    response:(NSDictionary *)response
{
    self = [super init];
    
    if (self)
    {
        self.feed = feed;
        self.response = response;
    }
    
    return self;
}

@end
