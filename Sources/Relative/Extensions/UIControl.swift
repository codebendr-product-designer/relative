//
//  UIControl.swift
//  Relative
//
//  Created by codebendr on 13/09/2020.
//

import UIKit


extension UIControl {
    
    @objc class ClosureSleeve: NSObject {
        let closure: ()->()
        
        init (_ closure: @escaping ()->()) {
            self.closure = closure
        }
        
        @objc func invoke () {
            closure()
        }
    }
    
    public func addAction(for controlEvents: UIControl.Event = .touchUpInside, _ closure: @escaping ()->()) {
        let sleeve = ClosureSleeve(closure)
        addTarget(sleeve, action: #selector(ClosureSleeve.invoke), for: controlEvents)
        objc_setAssociatedObject(self, "[\(arc4random())]", sleeve, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
    }
    
}
