//
//  SquareView.swift
//  Connect Four
//
//  Created by Diego Sánchez on 24/10/23.
//

import SwiftUI

struct SquareView: View, Identifiable {
    
    var id: UUID = UUID()
    
    @State var square: ChipModel
    
    var body: some View {
        ZStack {
            Text("")
                .frame(minWidth: 40, maxHeight: 40)
                .background(Color(red: 0.182, green: 0.281, blue: 0.343), in: RoundedRectangle(cornerRadius: 5))
            
            if square.color == ChipModel.ChipColor.red {
                Text("")
                    .frame(minWidth: 30, maxHeight: 30)
                    .overlay(Circle().foregroundColor(Color.red))
            } else if square.color == ChipModel.ChipColor.yellow {
                Text("")
                    .frame(minWidth: 30, maxHeight: 30)
                    .overlay(Circle().foregroundColor(Color.yellow))
            }
                
            
        }
    }
}

#Preview {
    SquareView(square: ChipModel(color: ChipModel.ChipColor.gray))
}
