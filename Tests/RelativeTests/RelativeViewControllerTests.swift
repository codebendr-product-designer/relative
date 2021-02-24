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
        let (sut, loader) = makeSUT()
     
        sut.didLoad = { _ in
            loader.load()
        }

        XCTAssertEqual(sut.isViewLoaded, false)
        XCTAssertEqual(loader.count, 0)
    }
    
    func test_init_CallsViewDidLoad() {
        let (sut, loader) = makeSUT()
     
        sut.didLoad = { _ in
            loader.load()
        }
       
        sut.loadViewIfNeeded()
        XCTAssertEqual(sut.isViewLoaded, true)
        XCTAssertEqual(loader.count, 1)
    }
    
    func test_children_exist() {
        let (sut, loader) = makeSUT()
     
        sut.didLoad = { _ in
            loader.load()
        }
       
        sut.loadViewIfNeeded()
        
        XCTAssertEqual(sut.view.subviews.count, 1)
    }
    
    func test_adding_buttonView() {
        let (sut, loader) = makeSUT()

        
        let button = UIButton().style { name in
            name.setTitle("button", for: .normal)
        }

 
        sut.didLoad = { coordinator in
            loader.load()
            sut.view.addSubview(button)
         
           
            button.addAction {
                sut.activityIndicatorIsHidden = true
            }
            
        }
       
     
        sut.loadViewIfNeeded()
        XCTAssertEqual(sut.view.subviews.count, 2)
    }
    
    //Helper
    private func makeSUT(file: StaticString = #file, line: UInt = #line) -> (sut: RelativeViewController<EmptyView>, loader: RelativeViewControllerSpy) {
        let loader = RelativeViewControllerSpy()
        let sut = RelativeViewController<EmptyView>()
      //  trackForMemoryLeaks(loader, file: file, line: line)
       // trackForMemoryLeaks(sut, file: file, line: line)
        return (sut, loader)
    }
    
    private func anyView() -> RelativeView.Type {
        return EmptyView.self
    }
    

    class RelativeViewControllerSpy {
        private(set) var count: Int = 0
        
        func load() {
            count += 1
        }
    }
  
}
