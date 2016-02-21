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
                        data:(NSData *)data
                  completion:(void(^)(BOOL successful))completion;

@end
