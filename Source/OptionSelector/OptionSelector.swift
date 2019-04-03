//
//  OptionSelector.swift
//  OptionSelector
//
//  Created by Nick Thompson on 3/31/19.
//  Copyright © 2019 Nick Thompson. All rights reserved.
//

import Foundation

public protocol OptionSelector {

    associatedtype OptionType: Equatable

    var options: [OptionType] { get }
    var selected: [OptionType] { get }
    var selectedIndices: Set<Int> { get }
    var callback: (([OptionType]) -> Void)? { get }
    subscript(index: Int) -> OptionType? { get }

    func select(index: Int)
    func select(option: OptionType)
    func deselect(index: Int)
    func deselect(option: OptionType)
    func toggle(index: Int)
    func toggle(option: OptionType)
}

public extension OptionSelector {

    var selected: [OptionType] {
        return self.selectedIndices.map { self.options[$0] }
    }

    subscript(index: Int) -> OptionType? {
        guard self.options.indices.contains(index) else {
            return nil
        }
        return self.options[index]
    }

    func select(option: OptionType) {
        if let index = self.options.firstIndex(of: option) {
            self.select(index: index)
        }
    }

    func deselect(option: OptionType) {
        if let index = self.options.firstIndex(of: option) {
            self.deselect(index: index)
        }
    }

    func toggle(option: OptionType) {
        if let index = self.options.firstIndex(of: option) {
            self.toggle(index: index)
        }
    }
}
