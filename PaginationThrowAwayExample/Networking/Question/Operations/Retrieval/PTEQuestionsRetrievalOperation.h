//
//  PTEQuestionsRetrievalOperation.h
//  PaginationThrowAwayExample
//
//  Created by William Boles on 15/02/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PTEFeed;

@interface PTEQuestionsRetrievalOperation : NSOperation

- (instancetype)initWithFeed:(PTEFeed *)feed
                    response:(NSDictionary *)response;

@end
