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
    @Published var win = ""
    @Published var shouldShowWinView = false
    
    var turn = "red"
    var game = 1
    
    // Constructor
    
    init() {
        
        cleanBoard()
        
    }
    
    //------------ Scoreboard ---------------
    
    func incrementYellow() {
        
        yellowScore += 1
    }
    
    func incrementRed() {
        
        redScore += 1
    }
    
    func restart() {
        yellowScore = 0
        redScore = 0
        game = 1
        cleanBoard()
        checkGame()
    }
    
    //----------- Board ---------------
    
    func addChip(column: Int) {
        
        for value in stride(from:5, through: 0, by: -1) {
            if board[column][value].square.color == ChipModel.ChipColor.gray {
                
                switch turn {
                case "red":
                    board[column][value] = SquareView(square: ChipModel(color: ChipModel.ChipColor.red))
                case "yellow":
                    board[column][value] = SquareView(square: ChipModel(color: ChipModel.ChipColor.yellow))
                default:
                    board[column][value] = SquareView(square: ChipModel(color: ChipModel.ChipColor.gray))
                }
               
                break
            }
        }
        
        changeTurn()
        checkBoard()
        
    }
    
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
        checkBoardHorizontally()
        checkBoardDiagonallyToLeft()
        checkBoardDiagonallyToRight()
        
    }
    
    func checkBoardVertically() {
        
        var red: Int = 0
        var yellow: Int = 0
        
        // Check vertically
        
        for col in 0...6 {
            for row in stride(from: 5, to: 0, by: -1) {
                if board[col][row].square.color == ChipModel.ChipColor.red {
                    
                    red += 1
                    yellow = 0
                    
                } else if board[col][row].square.color == ChipModel.ChipColor.yellow {
                    
                    yellow += 1
                    red = 0
                    
                } else {
                    break
                }
            }
            
            win(red: red, yellow: yellow)
            red = 0
            yellow = 0
        }
    }
    
    func checkBoardHorizontally() {
        
        var red: Int = 0
        var yellow: Int = 0
        
        // Check horizontally
        
        for row in stride(from: 5, to: 0, by: -1) {
            for col in 0...6 {
                
                if board[col][row].square.color == ChipModel.ChipColor.red {
                    
                    red += 1
                    yellow = 0
                    win(red: red, yellow: yellow)
                    
                } else if board[col][row].square.color == ChipModel.ChipColor.yellow {
                    
                    yellow += 1
                    red = 0
                    win(red: red, yellow: yellow)
                    
                } else {
                    
                    yellow = 0
                    red = 0
                }
            }
        }
    }
    
    func checkBoardDiagonallyToRight() {
        
        var red: Int = 0
        var yellow: Int = 0
        
        let col: Int = board.count
        let row: Int = board[0].count
        
        // Check the right top half of the matrix diagonally
        for r in 0..<col {
            // Start from each cell of first row
            var i = r
            var j = 0
            
            while j < row && i >= 0 {
                
                if board[i][j].square.color == ChipModel.ChipColor.red {
                    
                    red += 1
                    yellow = 0
                    win(red: red, yellow: yellow)
                    
                } else if board[i][j].square.color == ChipModel.ChipColor.yellow {
                    
                    yellow += 1
                    red = 0
                    win(red: red, yellow: yellow)
                    
                } else {
                    
                    yellow = 0
                    red = 0
                    
                }
                
                i -= 1
                j += 1
            }
            
        }
            // Check the right bottom half of the matrix diagonally
        for c in 1..<row {
            // Start from each cell of last column
            var i = col - 1
            var j = c
            
            while j < row && i >= 0 {
                
                if board[i][j].square.color == ChipModel.ChipColor.red {
                    
                    red += 1
                    yellow = 0
                    win(red: red, yellow: yellow)
                    
                } else if board[i][j].square.color == ChipModel.ChipColor.yellow {
                    
                    yellow += 1
                    red = 0
                    win(red: red, yellow: yellow)
                    
                } else {
                    
                    yellow = 0
                    red = 0
                    
                }
                
                i -= 1
                j += 1
                
            }
        }
    }
    
    func checkBoardDiagonallyToLeft() {
        
        var red: Int = 0
        var yellow: Int = 0
        
        let col: Int = board.count
        let row: Int = board[0].count
        
        // Check the left top half of the matrix diagonally
        for r in stride(from: col - 1, to: 0, by: -1) {
            // Start from the last cell of first row
            var i = r
            var j = 0
            
            while j < row && i <= 6 {
                
                if board[i][j].square.color == ChipModel.ChipColor.red {
                    
                    red += 1
                    yellow = 0
                    win(red: red, yellow: yellow)
                    
                } else if board[i][j].square.color == ChipModel.ChipColor.yellow {
                    
                    yellow += 1
                    red = 0
                    win(red: red, yellow: yellow)
                    
                } else {
                    
                    yellow = 0
                    red = 0
                    
                }
                
                i += 1
                j += 1
            }
            
        }
        
        // Check the left bottom half of the matrix diagonally
        for c in 1..<row {
            // Start from each cell of first column
            var i = 0
            var j = c
            
            while j < row && i <= 6 {
                
                if board[i][j].square.color == ChipModel.ChipColor.red {
                    
                    red += 1
                    yellow = 0
                    win(red: red, yellow: yellow)
                    
                } else if board[i][j].square.color == ChipModel.ChipColor.yellow {
                    
                    yellow += 1
                    red = 0
                    win(red: red, yellow: yellow)
                    
                } else {
                    
                    yellow = 0
                    red = 0
                    
                }
                
                i += 1
                j += 1
            }
            
        }
        
    }
    
    
    //-------- Win ------------
    
    func win(red: Int, yellow: Int) {
        
        if red == 4 {
            
            incrementRed()
            win = "Red"
            shouldShowWinView = true
            cleanBoard()
            game += 1
            checkGame()
            
        } else if yellow == 4 {
            
            incrementYellow()
            win = "Yellow"
            shouldShowWinView = true
            cleanBoard()
            game += 1
            checkGame()
        }
    }
    
    func checkGame() {
        
        if game % 2 == 0 {
            turn = "yellow"
        } else {
            turn = "red"
        }
    }
}
