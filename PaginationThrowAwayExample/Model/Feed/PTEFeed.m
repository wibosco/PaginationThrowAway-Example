//
//  PTEFeed.m
//  PaginationThrowAwayExample
//
//  Created by Boles on 11/02/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

#import "PTEFeed.h"

#import "PTEPage.h"

@interface PTEFeed ()

@property (nonatomic, strong, readwrite) NSArray *pages;

@property (nonatomic, strong, readwrite) NSArray *orderedQuestions;

@property (nonatomic, strong, readwrite) NSArray *orderedPages;

@end

@implementation PTEFeed

#pragma mark - Questions

- (NSArray *)orderedQuestions
{
    if (!_orderedQuestions)
    {
        NSMutableArray *mutableOrderedQuestions = [[NSMutableArray alloc] init];
        
        for (PTEPage *page in self.pages)
        {
            [mutableOrderedQuestions addObjectsFromArray:page.orderedQuestions];
        }
        
        _orderedQuestions = [mutableOrderedQuestions copy];
    }
    
    return _orderedQuestions;
}

#pragma mark - Pages

- (NSArray *)orderedPages
{
    if (!_orderedPages)
    {
        NSSortDescriptor *createdDateSort = [NSSortDescriptor sortDescriptorWithKey:@"createdDate"
                                                                          ascending:YES];
        
        _orderedPages = [self.pages sortedArrayUsingDescriptors:@[createdDateSort]];
    }
    
    return _orderedPages;
}

- (void)addPage:(PTEPage *)page
{
    NSMutableArray *mutabledPages = [[NSMutableArray alloc] initWithArray:self.pages];
    
    [mutabledPages addObject:page];
    
    self.pages = [mutabledPages copy];
    self.orderedPages = nil;
    self.orderedQuestions = nil;
}

@end
