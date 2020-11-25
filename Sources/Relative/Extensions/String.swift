//
//  String.swift
//  Relative
//
//  Created by codebendr on 13/09/2020.
//

import Foundation

#warning("identify property wrapper conversion")
public extension String {
    
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
    
    func fullname(in: @escaping (String, String) -> Void) {
        var components = self.components(separatedBy: " ")
        if components.count > 0 {
            let fn = components.removeFirst()
            let ln = components.joined(separator: " ")
            completion(fn, ln)
        }
    }
    
    //    var isPassword: Bool {
    //        let regex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&._])[A-Za-z\\d$@$!%*?&._]{8,32}"
    //        let isMatched = NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: self)
    //        return isMatched
    //    }
        
    var password: Bool {
        let regularExpression = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&])[A-Za-z\\d$@$!%*?&]{8,}"
        let passwordValidation = NSPredicate.init(format: "SELF MATCHES %@", regularExpression)
        return passwordValidation.evaluate(with: self)
    }
    
    var digits: Bool {
        let notDigits = NSCharacterSet.decimalDigits.inverted
        return rangeOfCharacter(from: notDigits, options: .literal, range: nil) == nil
    }
    
    var letters: Bool {
        let notLetters = NSCharacterSet.letters.union(NSCharacterSet.whitespaces).inverted
        return rangeOfCharacter(from: notLetters, options: .literal, range: nil) == nil
    }
    
    var email: Bool {
        matches("[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
    }
    
    var number: Bool {
        let numberRegEx = ".*[0-9]+.*"
        let numberTest = NSPredicate(format: "SELF MATCHES %@", numberRegEx)
        let numberResult = numberTest.evaluate(with: self)
        return numberResult
    }

    var specialChars: Bool {
        let specialCharacterRegEx = ".*[._!&^%$#@()/]+.*"
        let specialCharacterTest = NSPredicate(format: "SELF MATCHES %@", specialCharacterRegEx)
        let specialCharacterResult = specialCharacterTest.evaluate(with: self)
        return specialCharacterResult
    }
    
}
