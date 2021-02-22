import XCTest
import UIKit
import Relative

class EmptyView: UIView, RelativeView {
    var data: Any?
    
    let label =  UILabel().style { name in
        name.textAlignment = .center
        name.text = String(describing: self)
        name.numberOfLines = 0
    }
    
    required convenience init(type: RelativeViewType = .none) {
        self.init()
        
        //create an empty view 
    }
    
    
}

final class RelativeViewControllerTests: XCTestCase {
    
    func test_init_doesNotCallLifeCycleMethods() {
        let loader = RelativeViewControllerSpy()
        let  relativeViewController = RelativeViewController<EmptyView>()
        
        relativeViewController.didLoad = { _ in
            loader.load()
        }
        
        relativeViewController.willAppear = {
            loader.load()
        }
        
        XCTAssertEqual(relativeViewController.isViewLoaded, false)
        XCTAssertEqual(loader.count, 0)
    }

    class RelativeViewControllerSpy {
        private(set) var count: Int = 0
        
        func load() {
            count += 1
        }
    }
  
}
