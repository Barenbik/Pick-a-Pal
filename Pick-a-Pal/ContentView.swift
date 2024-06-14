//
//  ContentView.swift
//  Pick-a-Pal
//
//  Created by Tony Sharples on 26/04/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query private var pals: [Pal] = []
    
    @Environment(\.modelContext) private var context
    
    @State private var nameToAdd = ""
    @State private var pickedName = ""
    @State private var shouldRemovePickedName = false
    
    var body: some View {
        VStack {
            VStack(spacing: 8) {
                Image(systemName: "person.2.crop.square.stack.fill")
                    .foregroundStyle(.tint)
                    .symbolRenderingMode(.hierarchical)
                
                Text("Pick-a-Pal")
            }
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .bold()
            
            Text(pickedName.isEmpty ? " " : pickedName)
                .font(.title2)
                .bold()
                .foregroundStyle(.tint)
            
            List {
                ForEach(pals) { pal in
                    Text(pal.name)
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 8))
            
            TextField("Add Name", text: $nameToAdd)
                .autocorrectionDisabled()
                .onSubmit {
                    if !nameToAdd.isEmpty {
                        context.insert(Pal(name: nameToAdd))
                        nameToAdd = ""
                    }
                }
            
            Toggle("Remove picked names", isOn: $shouldRemovePickedName)
            
            Button() {
                if let randomPal = pals.randomElement() {
                    pickedName = randomPal.name
                    
                    if shouldRemovePickedName {
                        context.delete(randomPal)
                    }
                } else {
                    pickedName = ""
                }
            } label: {
                Text("Pick Random Name")
                    .padding(.vertical, 8)
                    .padding(.horizontal, 16)
            }
            
            .buttonStyle(.borderedProminent)
            .font(.title2)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
