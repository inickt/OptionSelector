//
//  AnyOptionSelector.swift
//  OptionSelector
//
//  Created by Nick Thompson on 3/31/19.
//  Copyright © 2019 Nick Thompson. All rights reserved.
//

import Foundation

public struct AnyOptionSelector<OptionType: Equatable>: OptionSelector {

    private let _options: () -> ([OptionType])
    private let _selectedIndices: () -> (Set<Int>)
    private let _select: (Int) -> Void
    private let _deselect: (Int) -> Void
    private let _toggle: (Int) -> Void
    private let _callback: () -> ((([OptionType]) -> Void)?)

    public init<Selector: OptionSelector>(_ selector: Selector) where Selector.OptionType == OptionType {
        self._options = { selector.options }
        self._selectedIndices = { selector.selectedIndices }
        self._select = selector.select
        self._deselect = selector.deselect
        self._toggle = selector.toggle
        self._callback = { selector.callback }
    }

    public var callback: (([OptionType]) -> Void)? {
        return self._callback()
    }

    public var options: [OptionType] {
        return self._options()
    }

    public var selectedIndices: Set<Int> {
        return self._selectedIndices()
    }

    public func select(index: Int) {
        self._select(index)
    }

    public func deselect(index: Int) {
        self._deselect(index)
    }

    public func toggle(index: Int) {
        self._toggle(index)
    }
}
