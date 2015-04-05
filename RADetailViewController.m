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

// set global margin
static CGFloat margin = 15;

// set global height of RecipeDescription
static CGFloat heightForRecipeDescription = 100;

// set global height for directions
static CGFloat heightForDirections = 100;

// set global height for engredient type
static CGFloat heightForIngredientType = 40;

static CGFloat heightForIngredientVolume = 40;


@interface RADetailViewController ()

@end

@implementation RADetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Set a top margin
    CGFloat topMargin = 20;
    
    // set width of view minus the margins
    CGFloat widthMinusMargin = self.view.frame.size.width - 2 * margin;
    
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"food@2x.png"]];
    
    
    self.title = [RARecipes titleAtIndex:self.index];
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    [self.view addSubview:scrollView];
    
    
    UILabel *recipeDescription = [[UILabel alloc] initWithFrame:CGRectMake(margin, topMargin, widthMinusMargin, heightForRecipeDescription)];
    
    recipeDescription.textColor = [UIColor whiteColor];
    
    recipeDescription.numberOfLines = 0;
    
    
    recipeDescription.text = [RARecipes descriptionAtIndex:self.index];
    
    
    [scrollView addSubview:recipeDescription];
    

    
    
    // Create an ingredientType label and add it to the view
    UILabel *ingredientType = [[UILabel alloc] initWithFrame:CGRectMake(margin, topMargin + heightForRecipeDescription, widthMinusMargin, heightForIngredientType)];
    
    ingredientType.numberOfLines = 0;
    
    ingredientType.text = [RARecipes ingredientTypeAtIndex:self.index inRecipeAtIndex:self.index];
    
    // set label color to white
    ingredientType.textColor = [UIColor whiteColor];
    [scrollView addSubview:ingredientType];
    
    // Track the top of each label as you iterate through the ingredient types and add to it each time you want to move further down in the scrollView
    topMargin += (heightForIngredientType + margin);
    
    
    
    // Create an ingredientType label and add it to the view
    UILabel *ingredientVolume = [[UILabel alloc] initWithFrame:CGRectMake(margin, topMargin + heightForRecipeDescription, widthMinusMargin, heightForIngredientType)];
    
    ingredientVolume.numberOfLines = 0;
    
    ingredientVolume.text = [RARecipes ingredientVolumeAtIndex:self.index inRecipeAtIndex:self.index];
    
    // set label color to white
    ingredientType.textColor = [UIColor whiteColor];
    [scrollView addSubview:ingredientType];
    
    // Track the top of each label as you iterate through the ingredient types and add to it each time you want to move further down in the scrollView
    topMargin += (heightForIngredientType + margin);
    
    
    UILabel *directions = [[UILabel alloc] initWithFrame:CGRectMake(margin, topMargin + heightForRecipeDescription, widthMinusMargin, heightForDirections)];
    
    directions.textColor = [UIColor whiteColor];
    
    
    directions.numberOfLines = 0;
    
    directions.text = [RARecipes descriptionAtIndex:self.index];
    
    
    [scrollView addSubview:directions];
    
}



@end
