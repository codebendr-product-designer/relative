//
//  Coordinator.swift
//  Relative
//
//  Created by codebendr on 20/10/2020.
//

import UIKit

protocol Coordinator {
    var data: Any? { get set }
    var navigationController: UINavigationController? { get set }
    func start(_ mainViewController: DefaultViewController, finished: (UINavigationController?) -> ())
}

public protocol DefaultViewController: UIViewController {
    var coordinator: MainCoordinator? { get set }
}

public class MainCoordinator: Coordinator {
    
    public weak var navigationController: UINavigationController?
    public var data: Any?
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    public init() {}
    
    func reset(animated: Bool = true) {
        navigationController?.popToRootViewController(animated: animated)
    }
    
    public func back(animated: Bool = true) {
        navigationController?.popViewController(animated: animated)
    }
    
    public func start(_ mainViewController: DefaultViewController, finished: (UINavigationController?) -> ()) {
        mainViewController.coordinator = MainCoordinator(navigationController: UINavigationController())
        navigationController?.pushViewController(mainViewController, animated: false)
        finished(navigationController)
    }
    
    public func present(view: DefaultViewController, animated: Bool = true) {
        navigationController?.pushViewController(view, animated: animated)
    }
    
    public func sheet(view: DefaultViewController, animated: Bool = true) {
        navigationController?.present(view, animated: animated)
    }
    
}
