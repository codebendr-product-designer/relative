
//public class Relative {
//    
//}

protocol Relative {
    associatedtype ChildView: RelativeView
    var coordinator: MainCoordinator? { get set }
    var view: RelativeViewController<ChildView>? { get set }
    var childView: ChildView? { get set }
}




