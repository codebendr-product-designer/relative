//
//  String.swift
//  Relative
//
//  Created by codebendr on 13/09/2020.
//

import Foundation

public extension String {
    
    static let empty = ""
    
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
    
}
