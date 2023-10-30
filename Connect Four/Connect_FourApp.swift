//
//  Connect_FourApp.swift
//  Connect Four
//
//  Created by Diego Sánchez on 23/10/23.
//

import SwiftUI

@main
struct Connect_FourApp: App {
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(BoardViewModel())
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
