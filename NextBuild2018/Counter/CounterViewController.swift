import UIKit
import ReSwift
import ReRxSwift

class CounterViewController: UIViewController {
    @IBOutlet weak var counterLabel: UILabel!
    
    let connection = Connection(
        store: appStore,
        mapStateToProps: mapStateToProps,
        mapDispatchToActions: mapDispatchToActions
    )

    override func viewDidLoad() {
        super.viewDidLoad()
        connection.bind(\Props.counterValue, to: counterLabel.rx.text) { String($0) }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        connection.connect()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        connection.disconnect()
    }
    
    @IBAction func incrementTapped() {
        actions.increment()
    }
}

extension CounterViewController: Connectable {
    struct Props {
        let counterValue: Int
    }
    struct Actions {
        let increment: () -> Void
    }
}

private let mapStateToProps = { (appState: AppState) in
    return CounterViewController.Props(
        counterValue: appState.counter.value
    )
}

private let mapDispatchToActions = { (dispatch: @escaping DispatchFunction) in
    return CounterViewController.Actions(
        increment: { dispatch(IncrementCounter()) }
    )
}

