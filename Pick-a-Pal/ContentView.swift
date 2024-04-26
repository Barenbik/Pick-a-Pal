//
//  ContentView.swift
//  Pick-a-Pal
//
//  Created by Tony Sharples on 26/04/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var names: [String] = ["Tony", "Raimy", "Lewis", "Tali", "Mabel"]
    
    var body: some View {
        VStack {
            List {
                ForEach(names, id: \.self) { name in
                    Text(name)
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
