import UIKit
import OptionSelector

extension Int: OptionSelectorCell {
    public var title: String {
        return "\(self)"
    }
    public var description: String? {
        return nil
    }
    public var image: UIImage? {
        return nil
    }
}
