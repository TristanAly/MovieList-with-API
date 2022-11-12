//
//  MovieProjectApp.swift
//  MovieProject
//
//  Created by apprenant1 on 03/10/2022.
//

import SwiftUI

@main
struct MovieProjectApp: App {
    @StateObject private var vm = MovieViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(vm)
        }
    }
}
