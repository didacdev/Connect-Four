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
            .background(Color(red: 0.669, green: 0.158, blue: 0.531), in: RoundedRectangle(cornerRadius: 10))
            .shadow(color: Color(red: 0.669, green: 0.158, blue: 0.531), radius: 2)
            
            Button {
                
                board.cleanBoard()
                
            } label: {
                Text("Reset")
                    .fontWeight(.medium)
            }
            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
            .padding()
            .foregroundColor(.white)
            .background(Color(red: 0.404, green: 0.281, blue: 0.578), in: RoundedRectangle(cornerRadius: 10))
            .shadow(color: Color(red: 0.404, green: 0.281, blue: 0.578), radius: 2)
        }
    }
}

#Preview {
    BottonsView().environmentObject(BoardViewModel())
}
