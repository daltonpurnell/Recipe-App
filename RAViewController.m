//
//  RAViewController.m
//  Recipe App
//
//  Created by User on 4/2/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "RAViewController.h"

#import "RecipesTableViewDataSource.h"
#import "RADetailViewController.h"

@interface RAViewController () <UITableViewDelegate>

// Add a UITableView as a property on the viewController class
@property (nonatomic, strong) UITableView *tableView;

// Add the RecipesTableViewDataSource as a property (since it's an external class)
@property (nonatomic, strong) RecipesTableViewDataSource *dataSource;

@end

@implementation RAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Set title
     self.title = @"Awesome Recipes";
    
   // Instantiate the data source
    
    self.dataSource = [RecipesTableViewDataSource new];
    
    
    // Initialize the tableView
    self.tableView = [UITableView new];
    self.tableView.frame = self.view.bounds;
    
    // the tableview on this view controller can use this view controller to find methods
    self.tableView.delegate = self;
    
    // add the tableView as a subview of the main view
    [self.view addSubview:self.tableView];
    
    
    // set the table view's datasource to the data source property we created (since the datasource methods are in an external class (RecipesTableViewDataSource))
    self.tableView.dataSource = self.dataSource;
    
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // set the row to deselect
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // instantiate a new instance of RADetailViewController
    RADetailViewController *detailViewController = [RADetailViewController new];
    
    detailViewController.index = indexPath.row;
    
    // push detail view controller
    [self.navigationController pushViewController:detailViewController animated:YES];
    
    
}

@end
