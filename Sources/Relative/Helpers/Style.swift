import Foundation
import UIKit

//extracted from then lib
//extension CGPoint: Then {}

public protocol Style {}
extension NSObject: Style {}
public extension Style where Self: AnyObject {
  @inlinable
    func style(_ block: (Self) throws -> Void) rethrows -> Self {
    try block(self)
    return self
  }

}

