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
            
            for value in stride(from:5, through: 0, by: -1) {
                if board.board[column][value].square.color == ChipModel.ChipColor.gray {
                    board.board[column][value] = SquareView(square: ChipModel(color: color))
                    break
                }
            }
            
        } label: {
            
            VStack {
                
                ForEach(board.board[column]) { square in
                
                    square
                    
                }
            }
        }
    }
}

#Preview {
    BoardColumView(column: 0).environmentObject(BoardViewModel())
}
