//
//  BottonsView.swift
//  Connect Four
//
//  Created by Diego Sánchez on 24/10/23.
//

import SwiftUI

struct BottonsView: View {
    
    @EnvironmentObject var board: BoardViewModel
    
    var body: some View {
        HStack {
            Button {
                
                board.restart()
                
            } label: {
                Text("Restart")
                    .fontWeight(.medium)
            }
            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
            .padding()
            .foregroundColor(.white)
            .background(Color("RestartColor"), in: RoundedRectangle(cornerRadius: 10))
            .shadow(color: Color("RestartColor"), radius: 2)
            
            Button {
                
                board.cleanBoard()
                
            } label: {
                Text("Reset")
                    .fontWeight(.medium)
            }
            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
            .padding()
            .foregroundColor(.white)
            .background(Color("ResetColor"), in: RoundedRectangle(cornerRadius: 10))
            .shadow(color: Color("ResetColor"), radius: 2)
        }
    }
}

#Preview {
    BottonsView().environmentObject(BoardViewModel())
}
