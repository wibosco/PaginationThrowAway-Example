//
//  PTEQuestionsAPIManager.m
//  PaginationThrowAwayExample
//
//  Created by Boles on 11/02/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

#import "PTEQuestionsAPIManager.h"

#import "PTEQueueManager.h"
#import "PTEFeed.h"
#import "PTEQuestionsRetrievalOperation.h"

@implementation PTEQuestionsAPIManager

#pragma mark - Retrieval

+ (void)retrievalQuestionsForFeed:(PTEFeed *)feed
                       completion:(void(^)(BOOL successful))completion
{
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSMutableString *mutableURLString = [[NSMutableString alloc] initWithString:@"https://api.stackexchange.com/2.2/questions?site=stackoverflow"];
    
    if (feed.pages.count > 0)
    {
        [mutableURLString appendFormat:@"&page=%@", @(feed.pages.count)];
    }
    
    NSURL *url = [NSURL URLWithString:[mutableURLString copy]];
    
    NSURLSessionDataTask *task = [session dataTaskWithURL:url
                                        completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
                                  {
                                      dispatch_async(dispatch_get_main_queue(), ^
                                                     {
                                                         PTEQuestionsRetrievalOperation *operation = [[PTEQuestionsRetrievalOperation alloc] initWithFeed:feed
                                                                                                                                                     data:data
                                                                                                                                               completion:completion];
                                                         
                                                         [[PTEQueueManager sharedInstance].queue addOperation:operation];
                                                     });
                                  }];
    
    [task resume];
}

@end
