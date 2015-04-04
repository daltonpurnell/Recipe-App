//
//  RAViewController.m
//  Recipe App
//
//  Created by User on 4/2/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "RAViewController.h"

#import "RecipesTableViewDataSource.h"


@interface RAViewController ()

// Add a UITableView as a property on the viewController class
@property (nonatomic, strong) UITableView *tableView;

// Add the RecipesTableViewDataSource as a property
@property (nonatomic, strong) RecipesTableViewDataSource *dataSource;

@end

@implementation RAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Set title
     self.title = @"Awesome Recipes";
    
    self.dataSource = [RecipesTableViewDataSource new];
    
    
    // Initialize the tableView
    self.tableView = [UITableView new];
    self.tableView.frame = self.view.bounds;
    
    
    // add the tableView as a subview of the main view
    [self.view addSubview:self.tableView];
    
    
    // set the datasource to the table view
    self.tableView.dataSource = self.dataSource;
    
    
}


@end
