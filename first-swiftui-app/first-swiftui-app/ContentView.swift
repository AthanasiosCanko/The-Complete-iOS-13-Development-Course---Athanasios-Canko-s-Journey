//
//  ContentView.swift
//  first-swiftui-app
//
//  Created by Athanasios Canko on 11.7.20.
//  Copyright © 2020 Athanasios Canko. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, SwiftUI").bold().font(.footnote).background(Color.blue).padding()
            Text("Hello, SwiftUI").bold().font(.footnote).background(Color.blue).padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
