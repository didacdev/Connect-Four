//
//  ScoreboardView.swift
//  Connect Four
//
//  Created by Diego Sánchez on 24/10/23.
//

import SwiftUI

struct ScoreboardView: View {
    
    @EnvironmentObject var board: BoardViewModel
    
    var body: some View {
        HStack {
            VStack {
                Text("Red")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                Text("\(board.redScore)")
                    .fontWeight(.medium)
                    .foregroundColor(.white)
            }
            .padding()
            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
            .background(Color("RedTeamColor"), in: RoundedRectangle(cornerRadius: 10))
            
            VStack {
                Text("Yellow")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                Text("\(board.yellowScore)")
                    .fontWeight(.medium)
                    .foregroundColor(.white)
            }
            .padding()
            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
            .background(Color("YellowTeamColor"), in: RoundedRectangle(cornerRadius: 10))
        }
        .padding()
        .background(Color("ScoreBoardColor"), in: RoundedRectangle(cornerRadius: 10))
        .shadow(color: Color("ScoreBoardColor"), radius: 2)
        
    }
}

#Preview {
    ScoreboardView().environmentObject(BoardViewModel())
}
