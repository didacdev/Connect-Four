//
//  BoardColumView.swift
//  Connect Four
//
//  Created by Diego Sánchez on 24/10/23.
//

import SwiftUI

struct BoardColumView: View {
    var body: some View {
        Button {
            
        } label: {
            VStack {
                SquareView()
                SquareView()
                SquareView()
                SquareView()
                SquareView()
                SquareView()
            }
        }
    }
}

#Preview {
    BoardColumView()
}
