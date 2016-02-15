//
//  PTEPage.m
//  PaginationThrowAwayExample
//
//  Created by Home on 11/02/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

#import "PTEPage.h"

#import "PTEQuestion.h"

@interface PTEPage ()

@property (nonatomic, strong, readwrite) NSArray *questions;

@property (nonatomic, strong, readwrite) NSArray *orderedQuestions;

@end

@implementation PTEPage

#pragma mark - Question

- (NSArray *)orderedQuestions
{
    if (!_orderedQuestions)
    {
        NSSortDescriptor *createdDateSort = [NSSortDescriptor sortDescriptorWithKey:@"createdDate"
                                                                          ascending:YES];
        
        _orderedQuestions = [self.questions sortedArrayUsingDescriptors:@[createdDateSort]];
    }
    
    return _orderedQuestions;
}

- (void)addQuestion:(PTEQuestion *)question
{
    NSMutableArray *mutabledQuestions = [[NSMutableArray alloc] initWithArray:self.questions];
    
    [mutabledQuestions addObject:question];
    
    self.questions = [mutabledQuestions copy];
    self.orderedQuestions = nil;
}

@end
