//
//  DataService.swift
//  Recipe List App
//
//  Created by Llewelyn Ward on 8/09/21.
//

import Foundation

class DataService {
    static func getLocalData() -> [Recipe] {
        //returns an array of recipes.
        
        //Parse local json object
        
        //Get url path.
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        //Check pathString is not nil.
        guard pathString != nil else {
            return [Recipe]()
        }
        
        //Create a url object
        let url = URL(fileURLWithPath: pathString!)
        do {
            //Create a data object or container from the url.
            let data = try Data(contentsOf: url)
            
            //Decode the data with a json decoder.
            let decoder = JSONDecoder()
            do {
                let recipeData = try decoder.decode([Recipe].self, from: data)
            //Add the uique ids.
                for r in recipeData {
                    r.id = UUID()
                    //To cpature the id of each ingredient class
                    for i in r.ingredients {
                        i.id = UUID()
                    }
                }
                //Return a recipe instance.
                return recipeData
            }
            catch {
                //error parsing json
                print(error)
            }
        }
        catch {
            //Error getting the data
            print(error)
        }
        return [Recipe]()
        
    }
}
