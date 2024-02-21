//
//  ChipTest.swift
//  Connect FourTests
//
//  Created by Diego Sánchez on 21/2/24.
//

import XCTest
@testable import Connect_Four

final class ChipTest: XCTestCase {

    func testChipInitialization() {
        // Given
        let color = ChipModel.ChipColor.red
        
        // When
        let chip = ChipModel(color: color)
        
        // Then
        XCTAssertEqual(chip.color, color)
    }

}
