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

    func testCallback() {
        var optionSelector: MultiOptionSelector<Int>
        var selected = [Int]()
        var didCall = false

        optionSelector = MultiOptionSelector(options) {
            selected = $0
            didCall = true
        }

        optionSelector.select(option: 3)
        XCTAssertTrue(didCall)
        XCTAssertEqual(Set(selected), Set([3]))

        didCall = false
        optionSelector.select(option: 4)
        XCTAssertTrue(didCall)
        XCTAssertEqual(Set(selected), Set([3, 4]))

        didCall = false
        optionSelector.select(option: 0)
        XCTAssertFalse(didCall)
        XCTAssertEqual(Set(selected), Set([3, 4]))

        didCall = false
        optionSelector.select(option: 4)
        XCTAssertTrue(didCall)
        XCTAssertEqual(Set(selected), Set([3, 4]))

        didCall = false
        optionSelector.deselect(option: 3)
        XCTAssertTrue(didCall)
        XCTAssertEqual(Set(selected), Set([4]))

        didCall = false
        optionSelector.toggle(option: 2)
        XCTAssertTrue(didCall)
        XCTAssertEqual(Set(selected), Set([2, 4]))

        didCall = false
        optionSelector.toggle(option: 2)
        XCTAssertTrue(didCall)
        XCTAssertEqual(Set(selected), Set([4]))

        didCall = false
        optionSelector.toggle(option: 9)
        XCTAssertFalse(didCall)
        XCTAssertEqual(Set(selected), Set([4]))
    }
}
