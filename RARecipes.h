//
//  RARecipes.h
//  Recipe App
//
//  Created by User on 4/2/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString * const RecipeTitleKey = @"recipeTitle";
static NSString * const RecipeDescriptionKey = @"recipeDescription";
static NSString * const RecipeIngredientsKey = @"recipeIngredients";
static NSString * const IngredientVolumeKey = @"ingredientVolume";
static NSString * const IngredientTypeKey = @"ingredientType";
static NSString * const DirectionsKey = @"directions";

@interface RARecipes : NSObject


+ (NSInteger)count;

+ (NSDictionary *)recipeAtIndex:(NSInteger)index;

+ (NSString *)titleAtIndex:(NSInteger)index;

+ (NSString *)descriptionAtIndex:(NSInteger)index;

+ (NSInteger)ingredientCountAtIndex:(NSInteger)index;

+ (NSString *)ingredientTypeAtIndex:(NSInteger)ingIndex inRecipeAtIndex:(NSInteger)recIndex;

+ (NSString *)ingredientVolumeAtIndex:(NSInteger)ingIndex inRecipeAtIndex:(NSInteger)recIndex;

+ (NSArray *)directionsAtIndex:(NSInteger)index;

@end
