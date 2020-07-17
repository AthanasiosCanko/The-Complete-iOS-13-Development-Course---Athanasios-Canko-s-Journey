//
//  ContentView.swift
//  favourite-book-swiftui
//
//  Created by Athanasios Canko on 15.7.20.
//  Copyright © 2020 Athanasios Canko. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(myFavourites) {
                    favourite in
                    Section(header: Text(favourite.title)) {
                        ForEach(favourite.elements) {
                            element in
                            NavigationLink(destination: DetailsView(favouriteElement: element)) {
                                Text(element.name)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
