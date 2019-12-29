//
//  ContentView.swift
//  Drawing
//
//  Created by Davron on 12/27/19.
//  Copyright © 2019 Davron. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var spirographActive = false
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: SpirographView()) {
                    Text("Spirograph")
                }
            }
        .navigationBarTitle("Drawing")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
