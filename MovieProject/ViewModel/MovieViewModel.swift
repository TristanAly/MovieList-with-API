//
//  MovieViewModel.swift
//  MovieProject
//
//  Created by apprenant1 on 03/10/2022.
//

import Foundation
import Combine

class MovieViewModel: ObservableObject {
    
  //  @Published var allMovie = [Item]() //= [Item(id: 4, rank: "1", rankUpDown: "dde", title: "Burst", image: "dde")]
    @Published var result: MovieModel?
    
    func getMovie() async throws {
        // adresse
        guard let url = URL(string: "https://imdb-api.com/en/API/MostPopularMovies")
        else { fatalError("Couldn't not find URL")}
        // faire une requete
        //stipuler action
        // urlsession
        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        //gerer l'erreur
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
        // décoder l' URL
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let decodedMovie = try decoder.decode(MovieModel.self, from: data)
        print("Async decodedMovie", decodedMovie)
        
        // return le code
        DispatchQueue.main.async {
            self.result = decodedMovie
        }
    }
}
