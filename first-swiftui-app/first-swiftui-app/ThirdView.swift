//
//  ThirdView.swift
//  first-swiftui-app
//
//  Created by Athanasios Canko on 13.7.20.
//  Copyright © 2020 Athanasios Canko. All rights reserved.
//

import SwiftUI

struct ThirdView: View {
    let myArray = ["James", "Lars", "Kirk", "Rob"]
    var body: some View {
//        List (myArray, id: \.self) {
//            element in
//            Image("metallica").resizable().aspectRatio(contentMode: ContentMode.fit).frame(width: 30, height: 30)
//            Text(element).font(.largeTitle)
//        }
        
        List {
            ForEach(myArray, id: \.self) {
                element in
                Text(element)
            }
        }
    }
}

struct ThirdView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdView()
    }
}
