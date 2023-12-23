//
//  WinView.swift
//  Connect Four
//
//  Created by Diego Sánchez on 27/10/23.
//

import SwiftUI

struct WinView: View {
    
    @EnvironmentObject var board: BoardViewModel
    @Binding var showingWin: Bool
    
    var body: some View {
        VStack {
            Spacer()
            
            if board.win == "Draw" {
                Text("Draw!")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                
                Text("🤨")
                    .font(.title2)
            } else {
                Text("\(board.win) player wins!")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                
                Text("👑")
                    .font(.title2)
            }
            
            Spacer()
        }
        .frame(maxWidth: 200, maxHeight: 100)
        .padding()
        .background(Color("ScoreBoardColor"), in: RoundedRectangle(cornerRadius: 10))
        
    }
}

#Preview {
    WinView(showingWin: .constant(true)).environmentObject(BoardViewModel())
}
