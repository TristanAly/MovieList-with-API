//
//  ContentView.swift
//  MovieProject
//
//  Created by apprenant1 on 03/10/2022.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var vm : MovieViewModel
    
    
    var body: some View {
        NavigationView {
            VStack {
                if let items = vm.result?.items {
                    List{
                        ForEach(items, id: \.title) { movie in
                            HStack{
                                AsyncImage(url: URL(string: movie.image)) {
                                    image in
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 85, height: 85)
                                } placeholder: {
                                    ProgressView()
                                        .frame(width: 85, height: 85)
                                }
                                Text(movie.rank)
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                Text(movie.title)
                                    .font(.title2)
                            }
                        }
                        
                    }.listStyle(PlainListStyle())
                }else {
                   ProgressView()
                }
            }.onAppear{
                Task{
                    do {
                        try await vm.getMovie()
                        
                    } catch {
                        print("Error call Api")
                    }
                }
            }
                .navigationTitle("Popular Movies")
                
                }
            }
        }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
                .environmentObject(MovieViewModel())
        }
    }
