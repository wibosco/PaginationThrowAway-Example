//
//  PTEQuestionParse.h
//  PaginationThrowAwayExample
//
//  Created by William Boles on 15/02/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PTEQuestion.h"

@interface PTEQuestionParse : NSObject

- (PTEQuestion *)parseQuestionResponse:(NSDictionary *)questionsReponse;

@end
