//
//  DetailsView.swift
//  favourite-book-swiftui
//
//  Created by Athanasios Canko on 16.7.20.
//  Copyright © 2020 Athanasios Canko. All rights reserved.
//

import SwiftUI

struct DetailsView: View {
    
    var favouriteElement: FavouriteElements
    var body: some View {
        VStack {
            Image(favouriteElement.imageName).resizable().aspectRatio(contentMode: ContentMode.fit)
            Text(favouriteElement.name).font(.largeTitle).padding()
            Text(favouriteElement.description).font(.footnote)
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(favouriteElement: thedarkknight)
    }
}
