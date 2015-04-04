//
//  RADetailViewController.m
//  Recipe App
//
//  Created by User on 4/4/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "RADetailViewController.h"
#import "RecipesTableViewDataSource.h"
#import "RARecipes.h"

@interface RADetailViewController ()

@end

@implementation RADetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    self.title = [RARecipes titleAtIndex:self.index];
    
    
    
    UILabel *label = [UILabel new];
    label.frame = self.view.bounds;
    
    [self.view addSubview:label];
}



@end
