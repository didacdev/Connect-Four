//
//  BoardView.swift
//  Connect Four
//
//  Created by Diego Sánchez on 24/10/23.
//

import SwiftUI

struct BoardView: View {
    var body: some View {
        HStack {
            BoardColumView()
            BoardColumView()
            BoardColumView()
            BoardColumView()
            BoardColumView()
            BoardColumView()
            BoardColumView()
        }
    }
}

#Preview {
    BoardView()
}
