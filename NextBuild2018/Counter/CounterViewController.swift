import UIKit
import ReSwift
import ReRxSwift

class CounterViewController: UIViewController {
    let connection = Connection(
        store: appStore,
        mapStateToProps: mapStateToProps,
        mapDispatchToActions: mapDispatchToActions
    )

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        connection.connect()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        connection.disconnect()
    }
}

extension CounterViewController: Connectable {
    struct Props {}
    struct Actions {}
}

private let mapStateToProps = { (appState: AppState) in
    return CounterViewController.Props()
}

private let mapDispatchToActions = { (dispatch: @escaping DispatchFunction) in
    return CounterViewController.Actions()
}

