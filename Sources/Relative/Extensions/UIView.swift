//
//  UIView.swift
//  Relative
//
//  Created by codebendr on 13/09/2020.
//

import UIKit

public extension UIView {
    
    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
    
    func border(color: UIColor, width:CGFloat = 1, cornerRadius:CGFloat = 10){
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
        self.layer.cornerRadius = cornerRadius
        
    }
    
    func dropShadow(color: UIColor = .gray, shadowOffset: CGSize = CGSize(width: 0, height: 4), shadowRadius: CGFloat = 10, shadowOpacity: Float = 0.1) {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = shadowOffset
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowOpacity = shadowOpacity
    }
    
    func bottomBorder(color: UIColor = UIColor.gray, weight:CGFloat = 1, offset: CGFloat = 0){
        self.layer.borderColor = color.cgColor
        let bottomBorder = CALayer()
        bottomBorder.frame = CGRect(x: 0, y: self.frame.height + offset, width: self.frame.width, height: weight)
        bottomBorder.backgroundColor = color.cgColor
        self.layer.addSublayer(bottomBorder)
        layoutIfNeeded()
    }
    
    
    /// helper function for setting translatesAutoresizingMaskIntoConstraints to false
    /// - Parameter constraints: list of view constraints
    func layout(using constraints: [NSLayoutConstraint]) {
          translatesAutoresizingMaskIntoConstraints = false
          NSLayoutConstraint.activate(constraints)
      }
      
//    public func fitted(with parentView: UIView) {
//          layout(using: [
//              centerXAnchor.constraint(equalTo: parentView.centerXAnchor),
//              centerYAnchor.constraint(equalTo: parentView.centerYAnchor),
//              widthAnchor.constraint(equalTo: parentView.widthAnchor, multiplier: 0.8),
//          ])
//      }
    
    class func fromNib<T: UIView>() -> T {
        return Bundle(for: T.self).loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
    
}
