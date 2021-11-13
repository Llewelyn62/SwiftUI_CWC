//
//  ContentView.swift
//  Recipe List App
//
//  Created by Llewelyn Ward on 7/09/21.
//

import SwiftUI

struct RecipeListView: View {
    //Adding an environment object to replace the model object. This exists
    //at a higher level (TabView) and is referenced to all sub views.
    @EnvironmentObject var model: RecipeModel
    //Listens to the REcipeModel object for any published changes.
    //By implication, the recipeModel needs to publish changes.
    //@ObservedObject var model = RecipeModel()
    var body: some View {
        NavigationView {
            
            VStack(alignment: .leading) {
                Text("All Recipes")
                    .bold()
                    .padding(.leading)
                    .padding(.top, 40)
                    .font(.largeTitle)
                ScrollView {
                    LazyVStack (alignment: .leading){
                        ForEach(model.recipes) {r in
                            NavigationLink(
                                destination: RecipeDetailView(recipe:r),
                                label: {
                                    HStack {
                                        Image(r.image)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 100, height: 50, alignment: .center)
                                            .clipped()
                                            .cornerRadius(5)
                                        VStack(alignment: .leading) {
                                            Text(r.name)
                                            .foregroundColor(.black)
                                            .bold()
                                            RecipeHighlights(highlights : r.highlights)
                                                .foregroundColor(.black)
                                        }
                                        
                                    }
                                })
                        }
                        .navigationBarHidden(true)
                        .padding(.leading)
                    }
                }
            }
            //.navigationTitle("Recipe List")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(RecipeModel())
    }
}
