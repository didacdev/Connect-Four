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
            Text("\(board.win) player wins!")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(.white)
            
            Text("👑")
                .font(.title2)
            Spacer()
            Button {
                showingWin.toggle()
                board.win = ""
                board.shouldShowWinView = false
            } label: {
                
                Image(systemName: "xmark.circle")
                    .resizable(capInsets: EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0), resizingMode: .tile)
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.red)
            }
        }
        .frame(maxWidth: 200, maxHeight: 100)
        .padding()
        .background(Color("ScoreBoardColor"), in: RoundedRectangle(cornerRadius: 10))
        
    }
}

#Preview {
    WinView(showingWin: .constant(true)).environmentObject(BoardViewModel())
}
