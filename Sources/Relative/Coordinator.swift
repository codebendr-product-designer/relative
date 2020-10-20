//
//  Coordinator.swift
//  Relative
//
//  Created by codebendr on 20/10/2020.
//

import UIKit

protocol Coordinator {
    //  var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController? { get set }
    func start(_ mainViewController: DefaultViewController, finished: (UINavigationController) -> ())
}

public protocol DefaultViewController: UIViewController {
    var coordinator: MainCoordinator? { get set }
}

public class MainCoordinator: Coordinator {
    
    public weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationController.setNavigationBarHidden(true, animated: false)
    }
    
    public init() {}
    
    func reset(animated: Bool = true) {
        navigationController?.popToRootViewController(animated: animated)
    }
    
    public func back(animated: Bool = true) {
        navigationController?.popViewController(animated: animated)
    }
    
    public func start(_ mainViewController: DefaultViewController, finished: (UINavigationController) -> ()) {
        let _navigationController = UINavigationController()
        let coordinator = MainCoordinator(navigationController: _navigationController)
        mainViewController.coordinator = coordinator
        _navigationController.pushViewController(mainViewController, animated: false)
        finished(_navigationController)
    }
    
    public func present(view: DefaultViewController, animated: Bool = true) {
        navigationController?.pushViewController(view, animated: animated)
    }
    
}
