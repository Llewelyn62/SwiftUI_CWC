//
//  RecipeDetailView.swift
//  Recipe List App
//
//  Created by Llewelyn Ward on 10/09/21.
//

import SwiftUI

struct RecipeDetailView: View {
    
    //Relies on a sinlge recipe.
    var recipe:Recipe
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                //Mark: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                //MARK: Ingredients
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .padding([.bottom, .top],5 )
                    ForEach(recipe.ingredients) { item in
                        Text("* " + item.name)
                            .font(.headline)
                    }
                }
                .padding(.horizontal)
                //MARK: Divider
                Divider()
                
                //MARK: Directions
                VStack(alignment: .leading) {
                    Text("Directions")
                        .font(.headline)
                        .padding([.bottom, .top])
                        
                    ForEach(0..<recipe.directions.count, id:\.self) {index in
                        Text(String(index+1) + ": " + recipe.directions[index])
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(.vertical)
                            .multilineTextAlignment(.leading)
                            
                            
                        
                    }
                }
                .padding(.horizontal)
            }
            
        }
        .navigationBarTitle(recipe.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        //Create a dummy recipe view to pass into detail to see a preview.
        let model = RecipeModel()
        RecipeDetailView(recipe: model.recipes[0])
    }
}
