//
//  PTEQuestionTableViewCell.m
//  PaginationThrowAwayExample
//
//  Created by Home on 11/02/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

#import "PTEQuestionTableViewCell.h"

@implementation PTEQuestionTableViewCell

#pragma mark - Identifier

+ (NSString *)reuseIdentifier
{
    return NSStringFromClass([self class]);
}

#pragma mark - Layout

- (void)layoutByApplyingConstraints
{
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

@end
