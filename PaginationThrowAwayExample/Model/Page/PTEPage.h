//
//  PTEPage.h
//  PaginationThrowAwayExample
//
//  Created by Home on 11/02/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PTEQuestion;

@interface PTEPage : NSObject

@property (nonatomic, strong) NSDate *createdDate;

@property (nonatomic, strong, readonly) NSArray *questions;

@property (nonatomic, strong, readonly) NSArray *orderedQuestions;

- (void)addQuestion:(PTEQuestion *)question;

@end
