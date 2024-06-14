//
//  Pick_a_PalApp.swift
//  Pick-a-Pal
//
//  Created by Tony Sharples on 26/04/2024.
//

import SwiftUI

@main
struct Pick_a_PalApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Pal.self)
        }
    }
}
