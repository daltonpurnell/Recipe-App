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

// set global height for engredient type
static CGFloat heightForIngredientType = 25;

static CGFloat heightForIngredientsTitle = 25;



@interface RADetailViewController ()

@property(nonatomic) BOOL alwaysBounceVertical;

@end

@implementation RADetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    

    
    // set width of view minus the margins
    CGFloat widthMinusMargin = self.view.frame.size.width - 2 * margin;
    
    // set background image
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"foodBackground.png"]];
    
    // set title of navigation controller
    self.title = [RARecipes titleAtIndex:self.index];
    

    
    
    // initialize a scroll view
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];

    
    // set content size of scroll view
    scrollView.contentSize = CGSizeMake(scrollView.frame.size.width, self.view.frame.size.height * 2.5);
    
    
    // set the property alwaysBounceVertical to yes
    scrollView.alwaysBounceVertical = YES;
    
    
    // add scrollView to view
    [self.view addSubview:scrollView];
    
    
    
    
    
    
    // Set a top margin
    CGFloat topMargin = 15;
    
    // Calculate the height of the description since it covers more than one line
    CGFloat heightForRecipeDescription = [self heightForDescriptionString:[RARecipes descriptionAtIndex:self.index]];
    
    // add label for recipe description
    UILabel *recipeDescription = [[UILabel alloc] initWithFrame:CGRectMake(margin, topMargin, widthMinusMargin, heightForRecipeDescription)];
    
    // set text color to white
    recipeDescription.textColor = [UIColor whiteColor];
    
    // set font to size 15
    recipeDescription.font = [UIFont systemFontOfSize:15];
    
    // make sure the number of lines is set to 0 so it will display all the text in the label
    recipeDescription.numberOfLines = 0;
    
    // set the label text to descriptionsAtIndex
    recipeDescription.text = [RARecipes descriptionAtIndex:self.index];
    
    // add label to scrollView
    [scrollView addSubview:recipeDescription];
    
    
    
    
    
    
    
    // Shift top margin with each label added to the scrollView
    CGFloat top = topMargin + heightForRecipeDescription + margin * 2;
    
    
    
    
    
    
    // create an ingredientsTitle label and add it to the view in bold font
    UILabel *ingredientsTitle = [[UILabel alloc] initWithFrame:CGRectMake(margin, top, widthMinusMargin, heightForIngredientsTitle)];
    
    // set title text to ingredients (just type a string since it will say "ingredients" for all the recipes
    ingredientsTitle.text =@"Ingredients";
    
    // set text color to white
    ingredientsTitle.textColor = [UIColor whiteColor];
    
    // set font to bold size 20
    ingredientsTitle.font = [UIFont boldSystemFontOfSize:20];
    
    // add label to scrollView
    [scrollView addSubview:ingredientsTitle];
    
    top += 20 + margin;
    
    
    
    
    
    
    
    // iterate through the arrays for ingredientType and ingredientVolume
    for (int i = 0; i < [RARecipes ingredientCountAtIndex:self.index]; i++) {
    
        
        
        
        // Create an ingredientVolume label and add it to the view
        UILabel *ingredientVolume = [[UILabel alloc] initWithFrame:CGRectMake(margin, top, widthMinusMargin / 4, heightForIngredientType)];
        
        ingredientVolume.numberOfLines = 0;
        
        // set font to bold size 20
        ingredientVolume.font = [UIFont boldSystemFontOfSize:15];
        
        // set text to pull from...
        ingredientVolume.text = [RARecipes ingredientVolumeAtIndex:self.index inRecipeAtIndex:self.index];
        
        // set label color to white
        ingredientVolume.textColor = [UIColor whiteColor];
        
        // add label to scrollView
        [scrollView addSubview:ingredientVolume];
        
        
        
        
    
        // Create an ingredientType label and add it to the view
        UILabel *ingredientType = [[UILabel alloc] initWithFrame:CGRectMake(margin + widthMinusMargin / 4, top, widthMinusMargin * 0.75, heightForIngredientType)];
    
        ingredientType.numberOfLines = 0;
    
        // set text to pull from...
        ingredientType.text = [RARecipes ingredientTypeAtIndex:i inRecipeAtIndex:self.index];
    
        // set label color to white
        ingredientType.textColor = [UIColor whiteColor];
    
        // set font to size 15
        ingredientType.font = [UIFont systemFontOfSize:15];
    
        // add label to scrollView
        [scrollView addSubview:ingredientType];
    
        // Track the top of each label as you iterate through the ingredient types and add to it each time you want to move further down in the scrollView
        
        top += (20 + margin);
    
        
    }
    
    
    
    
    
    
    // Track the top of each label as you iterate through the ingredient types and add to it each time you want to move further down in the scrollView
    
    topMargin += (20 + margin);
    

    
    
    
    
    // Create directionsTitle label and add it to the view
    UILabel *directionsTitle = [[UILabel alloc] initWithFrame:CGRectMake(margin, top, widthMinusMargin, heightForIngredientsTitle)];
    
    // set text to Directions
    directionsTitle.text = @"Directions";
    
    // set font to bold size 20
    directionsTitle.font = [UIFont boldSystemFontOfSize:20];
    
    // set text color to white
    directionsTitle.textColor = [UIColor whiteColor];
    
    // add label to scrollView
    [scrollView addSubview:directionsTitle];
    
    
    
    
    
    top += 20 + margin;
    
    
    
    
    
    
    // iterate through the arrays for directions
    for (int i = 0; i < [[RARecipes directionsAtIndex:self.index] count]; i++) {
    
        // set the height for the directions by using the heightForDirectionsString
        CGFloat heightForDirections = [self heightForDirectionsString:[RARecipes directionsAtIndex:self.index] [i]];
        
        
        
        
        
        UILabel *count = [[UILabel alloc] initWithFrame:CGRectMake(margin, top, 30, heightForIngredientsTitle)];
        
        count.font = [UIFont boldSystemFontOfSize:20];
        
        count.text = [NSString stringWithFormat:@"%d", i + 1];
        
        count.textColor = [UIColor whiteColor];
        
        [scrollView addSubview:count];
    
        
        
        
        
        
        // Create directions label and add it to the view
        UILabel *directions = [[UILabel alloc] initWithFrame:CGRectMake(margin + 25, top, widthMinusMargin - 35, heightForDirections)];
    
        // set font to size 15
        directions.font = [UIFont systemFontOfSize:15];
    
        // set text color to white
        directions.textColor = [UIColor whiteColor];
    
    
        directions.numberOfLines = 0;

         // set label text to pull from
        directions.text = [RARecipes directionsAtIndex:self.index][i];
    
        // add label to scrollView
        [scrollView addSubview:directions];
        
        
        
        top += (heightForDirections + margin);
        
        
    
    }

}


- (CGFloat)heightForDescriptionString:(NSString *)descriptionString {
    
    CGRect bounding = [descriptionString boundingRectWithSize:CGSizeMake(self.view.frame.size.width - 2 * margin, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil];
    
    
    return bounding.size.height;
    
    
}

- (CGFloat)heightForDirectionsString:(NSString *)directionsString {
    
    CGRect bounding = [directionsString boundingRectWithSize:CGSizeMake(self.view.frame.size.width - 2 * margin - 35, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil];
                                                                                                                                                                                              

    return bounding.size.height;
    
    
    
}


@end
