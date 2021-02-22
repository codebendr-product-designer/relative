
public protocol RelativeViewModel: Relative {
    var view: RelativeViewController<ChildView>? { get set }
    var coordinator: MainCoordinator? { get set }
    var childView: ChildView? { get set }
    init(_ view: RelativeViewController<ChildView>, _ coordinator: MainCoordinator)
    func present()
}

extension RelativeViewModel {
    func present() {
        view?.coordinator?.present(view: view!)
    }
}
