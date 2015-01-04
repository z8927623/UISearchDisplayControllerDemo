//
//  ViewController.m
//  UISearchDisplayControllerDemo
//
//  Created by wildyao on 15/1/4.
//  Copyright (c) 2015年 Wild Yaoyao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UISearchBarDelegate, UISearchDisplayDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, strong) UISearchDisplayController *displayController;

@property (nonatomic, strong) NSMutableArray *tips;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self initTableView];
    
    [self initSearchBar];
    
    [self initSearchDisplay];
}

- (void)initTableView
{
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
}

- (void)initSearchBar
{
    self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 64, CGRectGetWidth(self.view.bounds), 44)];
    self.searchBar.barStyle     = UIBarStyleBlack;
    self.searchBar.translucent  = YES;
    self.searchBar.delegate     = self;
    self.searchBar.placeholder  = @"hehe";
    self.searchBar.keyboardType = UIKeyboardTypeDefault;
    
//    [self.view addSubview:self.searchBar];
    
    self.tableView.tableHeaderView = self.searchBar;
}

- (void)initSearchDisplay
{
    self.displayController = [[UISearchDisplayController alloc] initWithSearchBar:self.searchBar contentsController:self];
    self.displayController.delegate                = self;
    self.displayController.searchResultsDataSource = self;
    self.displayController.searchResultsDelegate   = self;
}

#pragma mark - UISearchBarDelegate

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSString *key = searchBar.text;
    
    
    [self.displayController setActive:NO animated:NO];
    
    self.searchBar.placeholder = key;
}

#pragma mark - UISearchDisplayDelegate

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    return YES;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tips.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *tipCellIdentifier = @"tipCellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tipCellIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:tipCellIdentifier];
    }
    
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [self.displayController setActive:NO animated:NO];
    
}

@end
