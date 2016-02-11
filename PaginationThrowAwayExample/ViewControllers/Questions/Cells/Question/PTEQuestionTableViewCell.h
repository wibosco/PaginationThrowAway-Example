//
//  PTEQuestionTableViewCell.h
//  PaginationThrowAwayExample
//
//  Created by Home on 11/02/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PTEQuestionTableViewCell : UITableViewCell

+ (NSString *)reuseIdentifier;

- (void)layoutByApplyingConstraints;

@end
