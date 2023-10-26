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
    @Published var yellowScore = 0
    @Published var redScore = 0
    
    var turn = "red"
    var game = 1
    
    
    // Constructor
    
    init() {
        
        cleanBoard()
        
    }
    
    //------------ Scoreboard ---------------
    
    func restart() {
        yellowScore = 0
        redScore = 0
        game = 1
        cleanBoard()
    }
    
    //----------- Board ---------------
    
    func cleanBoard() {
        
        board.removeAll()
        
        for _ in 1...7 {
            
            var column = [SquareView]()
            
            for _ in 1...6 {
                column.append(SquareView(square: ChipModel(color: ChipModel.ChipColor.gray)))
            }
            
            board.append(column)
            
        }
    }
    
    func changeTurn() {
        if turn == "red" {
            turn = "yellow"
        } else {
            turn = "red"
        }
    }
    
    
    //---------- Check board --------------
    
    func checkBoard() {
        
        checkBoardVertically()
        checkBoardHorizontaly()
        checkBoardDiagonallyToLeft()
        checkBoardDiagonallyToRight()
        
    }
    
    func checkBoardVertically() {
        
    }
    
    func checkBoardHorizontaly() {
        
    }
    
    func checkBoardDiagonallyToRight() {
        
        
    }
    
    func checkBoardDiagonallyToLeft() {
        
        
    }
    
    
}
