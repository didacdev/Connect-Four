//
//  ContentView.swift
//  Connect Four
//
//  Created by Diego Sánchez on 23/10/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            TitleView()
            Spacer()
            ScoreboardView()
            Spacer()
            BoardView()
            Spacer()
            BottonsView()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
