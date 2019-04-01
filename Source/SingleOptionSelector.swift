//
//  SingleOptionSelector.swift
//  OptionSelector
//
//  Created by Nick Thompson on 3/31/19.
//  Copyright © 2019 Nick Thompson. All rights reserved.
//

import Foundation

public class SingleOptionSelector<OptionType: Equatable>: OptionSelector {

    public var options: [OptionType]
    public var selectedIndices: Set<Int> {
        didSet {
            self.callback?(self.selected)
        }
    }
    public let callback: (([OptionType]) -> Void)?

    public init(_ options: [OptionType], selected: OptionType? = nil, callback: (([OptionType]) -> Void)? = nil) {
        self.options = options
        if let selected = selected, let index = options.firstIndex(of: selected) {
            self.selectedIndices = Set<Int>([index])
        } else {
            self.selectedIndices = Set<Int>()
        }
        self.callback = callback
    }

    public func select(index: Int) {
        guard self.options.indices ~= index else { return }
        self.selectedIndices = Set<Int>([index])
    }

    public func deselect(index: Int) {
        guard self.options.indices ~= index else { return }
        self.selectedIndices.remove(index)
    }

    public func toggle(index: Int) {
        guard self.options.indices ~= index else { return }
        if self.selectedIndices.contains(index) {
            self.deselect(index: index)
        } else {
            self.select(index: index)
        }
    }
}
