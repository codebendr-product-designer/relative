import XCTest
import UIKit
import Relative

extension XCTestCase {
    func trackForMemoryLeaks(_ instance: AnyObject, file: StaticString = #file, line: UInt = #line) {
        addTeardownBlock { [weak instance] in
            XCTAssertNil(instance, "Instance should have been deallocated. Potential memory leak.", file: file, line: line)
        }
    }
}

class EmptyView: UIView, RelativeView {
    var data: Any?
    
    let label =  UILabel().style { name in
        name.textAlignment = .center
        name.text = String(describing: self)
        name.numberOfLines = 0
    }
    
    required convenience init(_ type: RelativeViewType = .none) {
        self.init()
        addSubview(label)
        //create an empty view 
    }
    
    
}

final class RelativeViewControllerTests: XCTestCase {
    
    func test_init_doesNotCallLifeCycleMethods() {
        let (sut, loader) = makeSUT(with: EmptyView.self)
     
        sut.didLoad = { _ in
            loader.load()
        }

        XCTAssertEqual(sut.isViewLoaded, false)
        XCTAssertEqual(loader.count, 0)
    }
    
    func test_init_CallsViewDidLoad() {
        let (sut, loader) = makeSUT(with: EmptyView.self)
     
        sut.didLoad = { _ in
            loader.load()
        }
       
        sut.loadViewIfNeeded()
        XCTAssertEqual(sut.isViewLoaded, true)
        XCTAssertEqual(loader.count, 1)
    }
    
    //Helper
    private func makeSUT<T: RelativeView>(with view: T.Type, file: StaticString = #file, line: UInt = #line) -> (sut: RelativeViewController<T>, loader: RelativeViewControllerSpy) {
        let loader = RelativeViewControllerSpy()
        let sut = RelativeViewController<T>()
        trackForMemoryLeaks(loader, file: file, line: line)
        trackForMemoryLeaks(sut, file: file, line: line)
        return (sut, loader)
    }
    

    class RelativeViewControllerSpy {
        private(set) var count: Int = 0
        
        func load() {
            count += 1
        }
    }
  
}
