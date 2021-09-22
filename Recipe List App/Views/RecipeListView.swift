//
//  ContentView.swift
//  Recipe List App
//
//  Created by Llewelyn Ward on 7/09/21.
//

import SwiftUI

struct RecipeListView: View {
    
    //Listens to the REcipeModel object for any published changes.
    //By implication, the recipeModel needs to publish changes.
    @ObservedObject var model = RecipeModel()
    var body: some View {
        NavigationView {
            List(model.recipes) {r in
                NavigationLink(
                    destination: RecipeDetailView(recipe:r),
                    label: {
                        HStack {
                            Image(r.image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .clipped()
                                .cornerRadius(5)
                            Text(r.name)
                                .font(.title2)
                                
                        }
                    })
            }
            .navigationTitle("All Recipes")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}