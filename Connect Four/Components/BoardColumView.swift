//
//  BoardColumView.swift
//  Connect Four
//
//  Created by Diego Sánchez on 24/10/23.
//

import SwiftUI

struct BoardColumView: View {
    
    @State var color = Square.SquareColor.red
    @State var squares = [
        SquareView(square: Square(color: Square.SquareColor.gray)),
        SquareView(square: Square(color: Square.SquareColor.gray)),
        SquareView(square: Square(color: Square.SquareColor.gray)),
        SquareView(square: Square(color: Square.SquareColor.gray)),
        SquareView(square: Square(color: Square.SquareColor.gray)),
        SquareView(square: Square(color: Square.SquareColor.gray))
    ]

    
    var body: some View {

        Button {
            
            for value in stride(from:5, through: 0, by: -1) {
                if squares[value].square.color == Square.SquareColor.gray {
                    squares[value].square.color = Square.SquareColor.red
                    break
                }
            }
            
        } label: {
            VStack {
                ForEach(0 ..< squares.count, id: \.self) { value in
                    squares[value]
                }
            }
        }
    }
}

#Preview {
    BoardColumView()
}
