//
//  UIViewController.swift
//  Relative
//
//  Created by codebendr on 15/09/2020.
//

import UIKit

@nonobjc extension UIViewController {
    
    public func add(_ child: UIViewController, frame: CGRect? = nil) {
        addChild(child)
        
        if let frame = frame {
            child.view.frame = frame
        }
        
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }
    
    public func remove() {
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
}
