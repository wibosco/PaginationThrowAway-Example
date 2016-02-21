//
//  PTEQuestionParse.m
//  PaginationThrowAwayExample
//
//  Created by William Boles on 15/02/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

#import "PTEQuestionParser.h"

#import "PTEQuestion.h"
#import "PTEPage.h"

@implementation PTEQuestionParser

#pragma mark - Parse

- (PTEPage *)parseQuestions:(NSDictionary *)questionsRetrievalReponse
{
    PTEPage *page = [[PTEPage alloc] init];
    page.createdDate = [NSDate date];
    
    NSArray *questionsReponse = questionsRetrievalReponse[@"items"];
    
    for (NSDictionary *questionResponse in questionsReponse)
    {
        PTEQuestion *question = [self parseQuestion:questionResponse];
        
        [page addQuestion:question];
    }
    
    return page;
}

- (PTEQuestion *)parseQuestion:(NSDictionary *)questionReponse
{
    PTEQuestion *question = [[PTEQuestion alloc] init];
    question.createdDate = [NSDate date];
    
    NSDictionary *ownerResponse = questionReponse[@"owner"];
    
    question.author = ownerResponse[@"display_name"];
    question.title = questionReponse[@"title"];
    
    return question;
}

@end
