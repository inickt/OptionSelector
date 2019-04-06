//
//  TestMultiOptionSelector.swift
//  OptionSelector Tests
//
//  Created by Nick Thompson on 3/31/19.
//  Copyright © 2019 Nick Thompson. All rights reserved.
//

import XCTest
@testable import OptionSelector

class TestMultiOptionSelector: XCTestCase {

    let options = [1, 2, 3, 4, 5, 6]

    func testInit() {
        var optionSelector: MultiOptionSelector<Int>

        optionSelector = MultiOptionSelector(options)
        XCTAssertTrue(optionSelector.selectedIndices.isEmpty)
        XCTAssertEqual(Set(optionSelector.selected), Set([]))
        XCTAssertEqual(optionSelector.options, options)

        optionSelector = MultiOptionSelector(options, selected: [])
        XCTAssertTrue(optionSelector.selectedIndices.isEmpty)
        XCTAssertEqual(Set(optionSelector.selected), Set([]))

        optionSelector = MultiOptionSelector(options, selected: [0, 10])
        XCTAssertTrue(optionSelector.selectedIndices.isEmpty)
        XCTAssertEqual(Set(optionSelector.selected), Set([]))

        optionSelector = MultiOptionSelector(options, selected: [1])
        XCTAssertFalse(optionSelector.selectedIndices.isEmpty)
        XCTAssertEqual(Set(optionSelector.selectedIndices), Set([0]))
        XCTAssertEqual(Set(optionSelector.selected), Set([1]))

        optionSelector = MultiOptionSelector(options, selected: [-1, 6, 1, 2, 0])
        XCTAssertFalse(optionSelector.selectedIndices.isEmpty)
        XCTAssertEqual(Set(optionSelector.selectedIndices), Set([0, 1, 5]))
        XCTAssertEqual(Set(optionSelector.selected), Set([1, 2, 6]))
    }
}
