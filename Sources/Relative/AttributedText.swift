//
//  AttributedText.swift
//  Banbo
//
//  Created by codebendr on 18/11/2019.
//  Copyright © 2019 Nsano. All rights reserved.
//

import Foundation
import UIKit

public class AttributedText {
    
    private var attribute: NSMutableAttributedString
    private var range: NSRange
    
    public init(text: String, textHighlight: String) {
        self.attribute = NSMutableAttributedString(string: text)
        self.range = (text as NSString).range(of: textHighlight)
    }
    
    public func range(text: String, textHighlight: String) -> AttributedText {
        range = (text as NSString).range(of: textHighlight)
        return self
    }
    
    public func font(font: UIFont) {
        attribute.addAttribute(.font, value: font , range: range)
    }
    
    public func change(color: UIColor, build: Bool = true) -> AttributedText {
        self.attribute.addAttribute(.foregroundColor, value: color , range: range)
        return self
    }

//    func font(_ name: FontName, font size:CGFloat = 16.0) -> AttributedText {
//        font(size,font: UIFont(name: name.rawValue, size: size)!)
//        return self
//    }
    
//    func regular(font size:CGFloat = 16.0) -> AttributedText {
//        font(size,font: UIFont(name: .OpenSansRegularFont, size: size)!)
//        return self
//    }
//
//    func bold(font size:CGFloat = 16.0) -> AttributedText {
//        font(size,font: UIFont(name: .OpenSansBoldFont, size: size)!)
//        return self
//    }
//
//    func semiBold(font size:CGFloat = 16.0) -> AttributedText {
//        font(size,font: UIFont(name: .OpenSansSemiBoldFont, size: size)!)
//        return self
//    }
    
    public func build() -> NSMutableAttributedString {
        return attribute
    }
}
