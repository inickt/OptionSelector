//
//  SingularOptionSelector.swift
//  OptionSelector
//
//  Created by Nick Thompson on 3/31/19.
//  Copyright © 2019 Nick Thompson. All rights reserved.
//

import Foundation

public class SingularOptionSelector<OptionType: Equatable>: SingleOptionSelector<OptionType> {

    override public init(_ options: [OptionType],
                         selected: OptionType? = nil,
                         callback: (([OptionType]) -> Void)? = nil) {
        super.init(options, selected: selected ?? options.first, callback: callback)
    }

    override public func deselect(index: Int) { }

    override public func toggle(index: Int) {
        guard self.options.indices ~= index else { return }
        if !self.selectedIndices.contains(index) {
            self.select(index: index)
        }
    }
}
