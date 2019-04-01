//
//  MultiOptionSelector.swift
//  OptionSelector
//
//  Created by Nick Thompson on 3/31/19.
//  Copyright © 2019 Nick Thompson. All rights reserved.
//

import Foundation

public class MultiOptionSelector<OptionType: Equatable>: OptionSelector {

    public var options: [OptionType]
    public var selectedIndices: Set<Int> {
        didSet {
            self.callback?(self.selected)
        }
    }
    public let callback: (([OptionType]) -> Void)?

    public init(_ options: [OptionType], selected: [OptionType] = [], callback: (([OptionType]) -> Void)? = nil) {
        self.options = options
        self.selectedIndices = Set<Int>(selected.compactMap { options.firstIndex(of: $0) })
        self.callback = callback
    }

    public func select(index: Int) {
        guard self.options.indices ~= index else { return }
        self.selectedIndices.insert(index)
    }

    public func deselect(index: Int) {
        guard self.options.indices ~= index else { return }
        self.selectedIndices.remove(index)
    }

    public func toggle(index: Int) {
        guard self.options.indices ~= index else { return }
        self.selectedIndices = self.selectedIndices.symmetricDifference([index])
    }
}
