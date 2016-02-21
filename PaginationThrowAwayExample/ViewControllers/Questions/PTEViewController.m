//
//  PTEViewController.m
//  PaginationThrowAwayExample
//
//  Created by Home on 11/02/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

#import "PTEViewController.h"

#import "PTEQuestionTableViewCell.h"
#import "PTEQuestionsAPIManager.h"
#import "PTEFeed.h"
#import "PTEPage.h"
#import "PTEQuestion.h"
#import "PTEQuestionsAPIManager.h"

@interface PTEViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) PTEFeed *feed;

- (void)refresh;
- (void)paginate;

@end

@implementation PTEViewController

#pragma mark - ViewLifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    /*-------------------*/
    
    self.title = @"Questions";
    
    /*-------------------*/
    
    [self.view addSubview:self.tableView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self refresh];
    
    [self.tableView reloadData];
}

#pragma mark - DataRetrieval

- (void)refresh
{
    self.feed = nil;
    
    [PTEQuestionsAPIManager ]
}

- (void)paginate
{
    
}

#pragma mark - Questions

- (PTEFeed *)feed
{
    if (!_feed)
    {
        _feed = [[PTEFeed alloc] init];
    }
    
    return _feed;
}

#pragma mark - Subview

- (UITableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame
                                                  style:UITableViewStylePlain];
        
        _tableView.dataSource = self;
        _tableView.delegate = self;
        
        [_tableView registerClass:[PTEQuestionTableViewCell class]
           forCellReuseIdentifier:[PTEQuestionTableViewCell reuseIdentifier]];
    }
    
    return _tableView;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.feed.orderedQuestions.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PTEQuestionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[PTEQuestionTableViewCell reuseIdentifier]
                                                                  forIndexPath:indexPath];
    
    [cell layoutByApplyingConstraints];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath
                             animated:YES];
}

@end
