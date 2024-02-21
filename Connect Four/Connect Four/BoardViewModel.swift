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
        
        guard let lastIndex = board[column].lastIndex(where: { $0.square.color == ChipModel.ChipColor.gray }) else {
            return
        }
        
        switch turn {
        case "red":
            board[column][lastIndex] = SquareView(square: ChipModel(color: ChipModel.ChipColor.red))
        case "yellow":
            board[column][lastIndex] = SquareView(square: ChipModel(color: ChipModel.ChipColor.yellow))
        default:
            board[column][lastIndex] = SquareView(square: ChipModel(color: ChipModel.ChipColor.gray))
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
        checkDiagonalForWin()
        
        if isBoardFull() && win.isEmpty {
            handleDraw()
        }
    }
    
    func checkDiagonalForWin() {
        let maxRow = board.count
        let maxCol = board[0].count
        let neededToWin = 4
        
        // Verificación diagonal hacia la derecha
        for row in 0..<(maxRow - neededToWin + 1) {
            for col in 0..<(maxCol - neededToWin + 1) {
                if checkSingleDiagonal(startRow: row, startCol: col, rowIncrement: 1, colIncrement: 1) {
                    handleWin()
                    return
                }
            }
        }
        
        // Verificación diagonal hacia la izquierda
        for row in 0..<(maxRow - neededToWin + 1) {
            for col in (neededToWin - 1)..<maxCol {
                if checkSingleDiagonal(startRow: row, startCol: col, rowIncrement: 1, colIncrement: -1) {
                    handleWin()
                    return
                }
            }
        }
    }
    
    func checkSingleDiagonal(startRow: Int, startCol: Int, rowIncrement: Int, colIncrement: Int) -> Bool {
        var red = 0
        var yellow = 0
        
        for i in 0..<4 {
            let currentRow = startRow + i * rowIncrement
            let currentCol = startCol + i * colIncrement
            let color = board[currentRow][currentCol].square.color
            
            if color == ChipModel.ChipColor.red {
                red += 1
                yellow = 0
            } else if color == ChipModel.ChipColor.yellow {
                yellow += 1
                red = 0
            } else {
                yellow = 0
                red = 0
            }
            
            if red == 4 || yellow == 4 {
                win = (red == 4) ? "Red" : "Yellow"
                return true
            }
        }
        
        return false
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
    
    func isBoardFull() -> Bool {
        for column in board {
            for square in column {
                if square.square.color == ChipModel.ChipColor.gray {
                    return false
                }
            }
        }
        return true
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
    
    func handleDraw() {
        win = "Draw"
        shouldShowWinView = true
        
        cleanBoard()
        game += 1
        checkGame()
    }
    
    func handleWin() {
        if win == "Red" {
            incrementRed()
        } else if win == "Yellow" {
            incrementYellow()
        }
        
        shouldShowWinView = true
        cleanBoard()
        game += 1
        checkGame()
    }
    
}
