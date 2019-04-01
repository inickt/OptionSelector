//: A UIKit based Playground for presenting user interface
import UIKit
import PlaygroundSupport
import OptionSelector

let selector = MultiOptionSelector<Int>([1, 2, 3, 4, 5, 6]) { selected in
    print(selected)
}

// Present the view controller in the Live View window
let optionViewController = OptionViewController<Int>()
optionViewController.selector = AnyOptionSelector<Int>(selector)
PlaygroundPage.current.liveView = optionViewController
