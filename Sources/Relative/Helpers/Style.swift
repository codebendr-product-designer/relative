import Foundation
import UIKit
//#if !os(Linux)
//  import CoreGraphics
//#endif
//#if os(iOS) || os(tvOS)
//  import UIKit.UIGeometry
//#endif

public protocol Style {}



extension Style where Self: AnyObject {

  /// Makes it available to set properties with closures just after initializing.
  ///
  ///     let label = UILabel().then {
  ///       $0.textAlignment = .center
  ///       $0.textColor = UIColor.black
  ///       $0.text = "Hello, World!"
  ///     }
  @inlinable
  public func style(_ block: (Self) throws -> Void) rethrows -> Self {
    try block(self)
    return self
  }

}

extension NSObject: Style {}

//#if !os(Linux)
//  extension CGPoint: Then {}
//  extension CGRect: Then {}
//  extension CGSize: Then {}
//  extension CGVector: Then {}
//#endif
//
//extension Array: Then {}
//extension Dictionary: Then {}
//extension Set: Then {}
//
//#if os(iOS) || os(tvOS)
//  extension UIEdgeInsets: Then {}
//  extension UIOffset: Then {}
//  extension UIRectEdge: Then {}
//#endif
