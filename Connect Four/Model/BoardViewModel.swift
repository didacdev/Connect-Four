//
//  BoardViewModel.swift
//  Connect Four
//
//  Created by Diego Sánchez on 26/10/23.
//

import Foundation
import SwiftUI

final class BoardViewModel: ObservableObject {
    
    // Properties
    
    @Published var board = [[SquareView]]()
    
    
    // Constructor
    
    init() {
        
        for _ in 1...7 {
            
            var column = [SquareView]()
            
            for _ in 1...6 {
                column.append(SquareView(square: ChipModel(color: ChipModel.ChipColor.gray)))
            }
            
            board.append(column)
            
        }
    }
}
