//
//  FavouriteModel.swift
//  favourite-book-swiftui
//
//  Created by Athanasios Canko on 15.7.20.
//  Copyright © 2020 Athanasios Canko. All rights reserved.
//

import Foundation
import SwiftUI

struct FavouriteModel: Identifiable {
    var id = UUID()
    var title: String
    var elements: [FavouriteElements]
}

struct FavouriteElements: Identifiable {
    var id = UUID()
    var name: String
    var imageName: String
    var description: String
}

// BANDS
let metallica = FavouriteElements(name: "Metallica", imageName: "metallica", description: "No 1 Music Band")
let megadeth = FavouriteElements(name: "Megadeth", imageName: "megadeth", description: "No 2 Music Band")
let ironmaiden = FavouriteElements(name: "Iron Maiden", imageName: "ironmaiden", description: "No 3 Music Band")

let favouriteBands = FavouriteModel(title: "Favourite Bands", elements: [metallica, megadeth, ironmaiden])

// MOVIES
let pulpfiction = FavouriteElements(name: "Pulp Fiction", imageName: "pulpfiction", description: "No 1 Movie")
let thedarkknight = FavouriteElements(name: "The Dark Knight", imageName: "thedarkknight", description: "No 2 Movie")
let killbill = FavouriteElements(name: "Kill Bill", imageName: "killbill", description: "No 3 Movie")

let favouriteMovies = FavouriteModel(title: "Favourite Movies", elements: [pulpfiction, thedarkknight, killbill])

let myFavourites = [favouriteBands, favouriteMovies]
