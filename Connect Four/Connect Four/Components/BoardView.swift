//
//  BoardView.swift
//  Connect Four
//
//  Created by Diego Sánchez on 24/10/23.
//

import SwiftUI

struct BoardView: View {
    
    @EnvironmentObject var board: BoardViewModel
    
    var body: some View {
        HStack {
            BoardColumView(column: 0)
            BoardColumView(column: 1)
            BoardColumView(column: 2)
            BoardColumView(column: 3)
            BoardColumView(column: 4)
            BoardColumView(column: 5)
            BoardColumView(column: 6)
        }
    }
}

#Preview {
    BoardView().environmentObject(BoardViewModel())
}
