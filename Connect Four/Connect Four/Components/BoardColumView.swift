//
//  BoardColumView.swift
//  Connect Four
//
//  Created by Diego Sánchez on 24/10/23.
//

import SwiftUI

struct BoardColumView: View {
    
    @State var color = ChipModel.ChipColor.red
    @State var column: Int
    @EnvironmentObject var board: BoardViewModel
    
    var body: some View {
        
        Button {
            
            board.addChip(column: column)
            
        } label: {
            
            VStack {
                
                ForEach(board.board[column]) { square in
                
                    square
                    
                }
            }
        }
        .sheet(isPresented: $board.shouldShowWinView) {
            WinView(showingWin: $board.shouldShowWinView)
                .presentationDetents([.medium])
        }
    }
}

#Preview {
    BoardColumView(column: 0).environmentObject(BoardViewModel())
}
