//
//  BoardViewModelTest.swift
//  ConnectFourTests
//
//  Created by Diego Sánchez on 21/2/24.
//

import XCTest
@testable import Connect_Four

final class BoardViewModelTest: XCTestCase {
    var viewModel: BoardViewModel!

    override func setUpWithError() throws {
        viewModel = BoardViewModel()
    }

    override func tearDownWithError() throws {}
    
    func testIncrementYellow() {
        // Given
        let score = 1
        // When
        viewModel.incrementYellow()
        // Then
        XCTAssertEqual(viewModel.yellowScore, score)
    }
    
    func testIncrementRed() {
        // Given
        let score = 1
        // When
        viewModel.incrementRed()
        // Then
        XCTAssertEqual(viewModel.redScore, score)
    }
    
    func testRestart() {
        // Given
        viewModel.incrementRed()
        viewModel.incrementYellow()
        viewModel.addChip(column: 0)
        
        // When
        viewModel.restart()
        
        // Then
        XCTAssertEqual(viewModel.redScore, 0)
        XCTAssertEqual(viewModel.yellowScore, 0)
        XCTAssertEqual(viewModel.board.count, 7)
        XCTAssertEqual(viewModel.board.first?.last?.square.color, ChipModel.ChipColor.gray)
        XCTAssertEqual(viewModel.turn, "red")
        
    }
    
    func testAddChip() {
        // Given
        let col = 0
        let turn = "yellow"
        
        // When
        viewModel.addChip(column: col)
        
        // Then
        XCTAssertEqual(viewModel.board.first?.last?.square.color, ChipModel.ChipColor.red)
        XCTAssertEqual(viewModel.turn, turn)
    }
    
    func testCleanBoard() {
        // Given
        viewModel.addChip(column: 0)
        
        // When
        viewModel.cleanBoard()
        
        // Then
        XCTAssertEqual(viewModel.board.first?.last?.square.color, ChipModel.ChipColor.gray)
        XCTAssertTrue(!viewModel.board[0].isEmpty)
    }
    
    func testChangeTurn() {
        // Given
        let turn = "yellow"
        // When
        viewModel.changeTurn()
        // Then
        XCTAssertEqual(viewModel.turn, turn)
    }
    
    func testCheckDiagonalForWinRed() {
        // Given
        viewModel.board[3][2] = SquareView(square: ChipModel(color: ChipModel.ChipColor.red))
        viewModel.board[4][3] = SquareView(square: ChipModel(color: ChipModel.ChipColor.red))
        viewModel.board[5][4] = SquareView(square: ChipModel(color: ChipModel.ChipColor.red))
        viewModel.board[6][5] = SquareView(square: ChipModel(color: ChipModel.ChipColor.red))
        // When
        viewModel.checkDiagonalForWin()
        
        // Then
        XCTAssertEqual(viewModel.redScore, 1)
        XCTAssertEqual(viewModel.board[6][5].square.color, ChipModel.ChipColor.gray)
        XCTAssertEqual(viewModel.game, 2)
        XCTAssertEqual(viewModel.turn, "yellow")
        XCTAssertEqual(viewModel.win, "Red")
        XCTAssertTrue(viewModel.shouldShowWinView)
    }
    
    func testCheckDiagonalForWinYellow() {
        // Given
        viewModel.board[3][2] = SquareView(square: ChipModel(color: ChipModel.ChipColor.yellow))
        viewModel.board[4][3] = SquareView(square: ChipModel(color: ChipModel.ChipColor.yellow))
        viewModel.board[5][4] = SquareView(square: ChipModel(color: ChipModel.ChipColor.yellow))
        viewModel.board[6][5] = SquareView(square: ChipModel(color: ChipModel.ChipColor.yellow))
        // When
        viewModel.checkDiagonalForWin()
        
        // Then
        XCTAssertEqual(viewModel.yellowScore, 1)
        XCTAssertEqual(viewModel.board[6][5].square.color, ChipModel.ChipColor.gray)
        XCTAssertEqual(viewModel.game, 2)
        XCTAssertEqual(viewModel.turn, "yellow")
        XCTAssertEqual(viewModel.win, "Yellow")
        XCTAssertTrue(viewModel.shouldShowWinView)
    }
    
    func testCheckBoardVerticallyForWinRed() {
        // Given
        viewModel.board[0][5] = SquareView(square: ChipModel(color: ChipModel.ChipColor.red))
        viewModel.board[0][4] = SquareView(square: ChipModel(color: ChipModel.ChipColor.red))
        viewModel.board[0][3] = SquareView(square: ChipModel(color: ChipModel.ChipColor.red))
        viewModel.board[0][2] = SquareView(square: ChipModel(color: ChipModel.ChipColor.red))
        
        // When
        viewModel.checkBoardVertically()
        
        // Then
        XCTAssertEqual(viewModel.redScore, 1)
        XCTAssertEqual(viewModel.board[0][2].square.color, ChipModel.ChipColor.gray)
        XCTAssertEqual(viewModel.game, 2)
        XCTAssertEqual(viewModel.turn, "yellow")
        XCTAssertEqual(viewModel.win, "Red")
        XCTAssertTrue(viewModel.shouldShowWinView)
    }
    
    func testCheckBoardVerticallyForWinYellow() {
        // Given
        viewModel.board[0][5] = SquareView(square: ChipModel(color: ChipModel.ChipColor.yellow))
        viewModel.board[0][4] = SquareView(square: ChipModel(color: ChipModel.ChipColor.yellow))
        viewModel.board[0][3] = SquareView(square: ChipModel(color: ChipModel.ChipColor.yellow))
        viewModel.board[0][2] = SquareView(square: ChipModel(color: ChipModel.ChipColor.yellow))
        
        // When
        viewModel.checkBoardVertically()
        
        // Then
        XCTAssertEqual(viewModel.yellowScore, 1)
        XCTAssertEqual(viewModel.board[0][5].square.color, ChipModel.ChipColor.gray)
        XCTAssertEqual(viewModel.game, 2)
        XCTAssertEqual(viewModel.turn, "yellow")
        XCTAssertEqual(viewModel.win, "Yellow")
        XCTAssertTrue(viewModel.shouldShowWinView)
    }
    
    func testCheckBoardHorizontallyForWinRed() {
        // Given
        viewModel.board[0][5] = SquareView(square: ChipModel(color: ChipModel.ChipColor.red))
        viewModel.board[1][5] = SquareView(square: ChipModel(color: ChipModel.ChipColor.red))
        viewModel.board[2][5] = SquareView(square: ChipModel(color: ChipModel.ChipColor.red))
        viewModel.board[3][5] = SquareView(square: ChipModel(color: ChipModel.ChipColor.red))
        
        // When
        viewModel.checkBoardHorizontally()
        
        // Then
        XCTAssertEqual(viewModel.redScore, 1)
        XCTAssertEqual(viewModel.board[0][5].square.color, ChipModel.ChipColor.gray)
        XCTAssertEqual(viewModel.game, 2)
        XCTAssertEqual(viewModel.turn, "yellow")
        XCTAssertEqual(viewModel.win, "Red")
        XCTAssertTrue(viewModel.shouldShowWinView)
    }
    
    func testIsBoardFull() {
        // Given
        for col in 0...6 {
            for row in 0...5 {
                viewModel.board[col][row] = SquareView(square: ChipModel(color: ChipModel.ChipColor.red))
            }
        }
        
        // When
        let isFull = viewModel.isBoardFull()
        
        // Then
        XCTAssertTrue(isFull)
    }

}
