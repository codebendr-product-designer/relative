
public protocol RelativeView: UIView {
    var data: Any? { get set }
    init(type: RelativeViewType)
}
