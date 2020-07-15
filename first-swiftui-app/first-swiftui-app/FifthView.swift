//
//  FifthView.swift
//  first-swiftui-app
//
//  Created by Athanasios Canko on 15.7.20.
//  Copyright © 2020 Athanasios Canko. All rights reserved.
//

import SwiftUI

struct FifthView: View {
    
    @State var myName = "James"
    
    var body: some View {
        VStack {
            Text(myName).padding().font(.largeTitle)
            TextField("Placeholder...", text: $myName)
        }
    }
}

struct FifthView_Previews: PreviewProvider {
    static var previews: some View {
        FifthView()
    }
}
