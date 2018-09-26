import ReSwift

func appReducer(action: Action, state: AppState?) -> AppState {
    return AppState(counter: counterReducer(action: action, state: state?.counter))
}
