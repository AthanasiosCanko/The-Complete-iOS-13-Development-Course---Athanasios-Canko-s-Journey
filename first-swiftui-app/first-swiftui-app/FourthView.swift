//
//  FourthView.swift
//  first-swiftui-app
//
//  Created by Athanasios Canko on 15.7.20.
//  Copyright © 2020 Athanasios Canko. All rights reserved.
//

import SwiftUI

struct FourthView: View {
    
    // When @State, it renders the entire view again
    @State var myName = "Atil"
    
    var body: some View {
        VStack {
            Button(action: {
                self.myName = "James"
            }) {
                Text("MyButton")
            }.padding().font(.largeTitle)
            Text(myName).padding()
        }
    }
}

struct FourthView_Previews: PreviewProvider {
    static var previews: some View {
        FourthView()
    }
}
