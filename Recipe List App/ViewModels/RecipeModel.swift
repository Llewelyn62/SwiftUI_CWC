//
//  RecipeModel.swift
//  Recipe List App
//
//  Created by Llewelyn Ward on 7/09/21.
//

import Foundation
// This points to any instances of the RecipeModel created.
//They need to be be an observed object.
class RecipeModel: ObservableObject {
    //This property publishes changes, a list of empty recipe items.
    @Published var recipes = [Recipe]()
    //Under services, will have a class that collects data. 
    init() {
        //Create an instance of a data service, which now is a static func, allowing one to avoid an instance...
        self.recipes = DataService.getLocalData()
        
    }
    static func getPortion(ingredient: Ingredient, recipeServings: Int, targetServings: Int) -> String {
        //Get single serving size.
        
        //Get target portion
        
        //Reduce fraction by GCD
        
        //Get whole portions
        
        //Express remainder as fraction
        
        return String(targetServings)
    }
}
