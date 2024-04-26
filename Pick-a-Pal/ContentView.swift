//
//  ContentView.swift
//  Pick-a-Pal
//
//  Created by Tony Sharples on 26/04/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var names: [String] = ["Tony", "Raimy", "Lewis", "Tali", "Mabel"]
    @State private var nameToAdd = ""
    
    var body: some View {
        VStack {
            List {
                ForEach(names, id: \.self) { name in
                    Text(name)
                }
            }
            
            TextField("Add Name", text: $nameToAdd)
                .autocorrectionDisabled()
                .onSubmit {
                    if !nameToAdd.isEmpty {
                        names.append(nameToAdd)
                        nameToAdd = ""
                    }
                }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
