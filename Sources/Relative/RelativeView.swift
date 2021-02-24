import UIKit

public protocol RelativeView: UIView {
    var data: Any? { get set }
    init(_ type: RelativeViewType)
}
