//
//  PTEFeed.h
//  PaginationThrowAwayExample
//
//  Created by Boles on 11/02/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PTEPage;

extern NSString * kPTEBaseURLString;

@interface PTEFeed : NSObject

@property (nonatomic, strong, readonly) NSArray *pages;

@property (nonatomic, strong, readonly) NSArray *orderedPages;

@property (nonatomic, strong, readonly) NSArray *orderedQuestions;

- (void)addPage:(PTEPage *)page;

@end
