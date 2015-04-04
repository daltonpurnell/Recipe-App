//
//  RecipesTableViewDataSource.m
//  Recipe App
//
//  Created by User on 4/2/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "RecipesTableViewDataSource.h"
#import "RARecipes.h"


@implementation RecipesTableViewDataSource
// This method is only used if you don't check for a nil cell
//-(void)registerTableView:(UITableView *)tableView
//{
//    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
//    
//}

// Add the required UITableViewDataSource methods to the implementation file

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // return RARecipes class method count
    
    return [RARecipes count];
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    // If there is not a cell yet, alloc init (create one)
    if (!cell) {
        // when cell goes off screen, reuse it for another cell that is coming onto the screen
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    // return a cell with the textLabel.text set to the string RARecipes class titleAtIndex for indexPath.row
    cell.textLabel.text = [RARecipes titleAtIndex:indexPath.row];
    
    return cell;
    
}

@end
