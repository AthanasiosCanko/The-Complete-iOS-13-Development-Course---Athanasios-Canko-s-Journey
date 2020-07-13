//
//  SecondView.swift
//  first-swiftui-app
//
//  Created by Athanasios Canko on 13.7.20.
//  Copyright © 2020 Athanasios Canko. All rights reserved.
//

import SwiftUI

struct SecondView: View {
    var body: some View {
        Image("metallica").resizable().aspectRatio(contentMode: ContentMode.fit).frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
