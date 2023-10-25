//
//  SquareView.swift
//  Connect Four
//
//  Created by Diego Sánchez on 24/10/23.
//

import SwiftUI

struct SquareView: View {
    
    var square: Square
    
    var body: some View {
        ZStack {
            Text("")
                .frame(minWidth: 40, maxHeight: 40)
                .background(Color(red: 0.182, green: 0.281, blue: 0.343), in: RoundedRectangle(cornerRadius: 5))
            
            if square.color == Square.SquareColor.gray  {
                Text("")
                    .frame(minWidth: 30, maxHeight: 30)
                    .overlay(Circle().foregroundColor(Color(red: 0.182, green: 0.281, blue: 0.343)))
            } else if square.color == Square.SquareColor.red {
                Text("")
                    .frame(minWidth: 30, maxHeight: 30)
                    .overlay(Circle().foregroundColor(Color.red))
            } else if square.color == Square.SquareColor.yellow {
                Text("")
                    .frame(minWidth: 30, maxHeight: 30)
                    .overlay(Circle().foregroundColor(Color.yellow))
            }
                
            
        }
    }
}

#Preview {
    SquareView(square: Square(color: Square.SquareColor.gray))
}
