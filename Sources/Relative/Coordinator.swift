//
//  Coordinator.swift
//  Relative
//
//  Created by codebendr on 20/10/2020.
//

import UIKit

public protocol Coordinator {
    //  var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController? { get set }
    func start(finished: (UINavigationController) -> ())
}

public protocol DefaultViewController: UIViewController {
    var coordinator: Coordinator? { get set }
}

public class MainCoordinator<T: DefaultViewController>: Coordinator {
    
    public weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationController.setNavigationBarHidden(true, animated: false)
    }
    
    public init() {}
    
    func reset(animated: Bool = true) {
        navigationController?.popToRootViewController(animated: animated)
    }
    
    func back(animated: Bool = true) {
        navigationController?.popViewController(animated: animated)
    }
    
    public func start(finished: (UINavigationController) -> ()) {
        let _navigationController = UINavigationController()
        let coordinator = MainCoordinator(navigationController: _navigationController)
        let mainViewController = T.init()
        mainViewController.coordinator = coordinator
        _navigationController.pushViewController(mainViewController, animated: false)
        finished(_navigationController)
    }
    
    func present(view: UIViewController, animated: Bool = true) {
        navigationController?.pushViewController(view, animated: animated)
    }
    
}
