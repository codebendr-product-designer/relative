//
//  ScrollView.swift
//  Maestro
//
//  Created by Evans Domina Attafuah on 13/11/2020.
//  Copyright © 2020 Lucid Array. All rights reserved.
//

import UIKit

class ScrollView: UIScrollView {
    
    public let view = UIView()
    public var indicators: Bool = false {
        didSet {
            showsVerticalScrollIndicator = indicators
            showsHorizontalScrollIndicator = indicators
        }
    }
    
    init() {
        super.init(frame: .zero)
      //  view.backgroundColor = .systemPink
        addSubview(view)
        showsVerticalScrollIndicator = indicators
        showsHorizontalScrollIndicator = indicators
        layout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public func layout(in parent: UIView) {
        layout(using: [
            x(in: parent),
            width(in: parent),
            top(in: parent),
            bottom(in: parent)
        ])
    }
    
    private func layout() {
        view.layout(using: [
            view.x(in: self),
            view.width(in: self),
            view.top(in: self),
            view.bottom(in: self)
        ])
    }
    
}


