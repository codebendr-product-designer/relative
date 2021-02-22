import UIKit

#warning("add a closure if necessary")
//AccountViewController<AccountView>(accountType: .signup) { name, font, view in
//  name =  "Create your Account"
//}
public class RelativeViewController<ChildView: RelativeView>: UIViewController, DefaultViewController {
    
    public var didLoad: Finished = { _ in }
    public var willAppear: Action = {}
    public var hasBackButton: Bool = false {
        didSet {
            if hasBackButton {
//                coordinator?.navigationController?.barButton(.left(.blacknavi)).addAction { [weak coordinator] in
//                    coordinator?.back()
//                }
            }
        }
    }
    
    #warning("investigate weak referencing")
    public var coordinator: MainCoordinator?
    private var childView: ChildView?
    public var payload: Any?
    private let activityView = ActivityView().style { av in
        av.accessibilityLabel = "ActivityView"
    }
    public var activityIndicatorIsHidden: Bool = true {
        didSet {
            activityView.isHidden = activityIndicatorIsHidden
            self.view.endEditing(true)
          //  navigationController?.isHidden(!activityIndicatorIsHidden)
        }
    }
    
    public typealias Finished = (_ coordinator: MainCoordinator?) -> ()
    
    public convenience init(_ type: RelativeViewType = .none) {
        self.init()
        childView = .init(type: type)
    }

    public override func loadView() {
        view = childView
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.interactivePopGestureRecognizer!.delegate = nil
        view.backgroundColor = .white
        didLoad(coordinator)
        
        view.addSubview(activityView)
        activityView.isHidden = activityIndicatorIsHidden
        activityView.fitted(in: view)
        
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNeedsStatusBarAppearanceUpdate()
        willAppear()
    }
    
    public override var preferredStatusBarStyle: UIStatusBarStyle {
        if #available(iOS 13.0, *) {
            return .darkContent
        }
        return .lightContent
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}

