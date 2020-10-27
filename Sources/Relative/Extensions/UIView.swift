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
    
    
    
    class func fromNib<T: UIView>() -> T {
        return Bundle(for: T.self).loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
    
}

// MARK: Layout

public extension UIView {
    
    /// helper function for setting translatesAutoresizingMaskIntoConstraints to false
    /// - Parameter constraints: list of view constraints
    func layout(using constraints: [NSLayoutConstraint]) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints)
    }
    
    func fitted(in view: UIView, edgeInsets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: view.topAnchor, constant: edgeInsets.top),
            bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: edgeInsets.bottom),
            leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: edgeInsets.left),
            trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: edgeInsets.right),
        ])
    }
    
    func x(in view: UIView, _ constant: CGFloat = 0) -> NSLayoutConstraint {
        return centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: constant)
    }
    
    func y(in view: UIView, _ constant: CGFloat = 0) -> NSLayoutConstraint {
        return centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant)
    }
    
    func left(in view: UIView, _ constant: CGFloat = 0) -> NSLayoutConstraint {
        return leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: constant)
    }
    
    func right(in view: UIView, _ constant: CGFloat = 0) -> NSLayoutConstraint {
        return trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: constant)
    }
    
    func top(in view: UIView, _ constant: CGFloat = 0) -> NSLayoutConstraint {
        return topAnchor.constraint(equalTo: view.topAnchor, constant: constant)
    }
    
    func bottom(in view: UIView, _ constant: CGFloat = 0) -> NSLayoutConstraint {
        return bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: constant)
    }
    
    func position(_ layoutPosition: LayoutPosition, in view: UIView, _ constant: CGFloat = 0) -> NSLayoutConstraint {
        switch layoutPosition {
        case .leading:
            return leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: constant)
        case .trailing:
            return trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: constant)
        case .top:
            return topAnchor.constraint(equalTo: view.bottomAnchor, constant: constant)
        case .bottom:
            return bottomAnchor.constraint(equalTo: view.topAnchor, constant: constant)
        }
    }
    
    func width(_ w: CGFloat) -> NSLayoutConstraint {
        return widthAnchor.constraint(equalToConstant: w)
    }
    
    func width(in view: UIView, ratio: CGFloat = 1) -> NSLayoutConstraint {
        return widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: ratio)
    }
    
    func height(_ h: CGFloat) -> NSLayoutConstraint {
        return heightAnchor.constraint(equalToConstant: h)
    }
    
    func height(in view: UIView, ratio: CGFloat = 1) -> NSLayoutConstraint {
        return heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: ratio)
    }
    
}
