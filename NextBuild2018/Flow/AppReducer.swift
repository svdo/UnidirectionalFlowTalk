import ReSwift

func appReducer(action: Action, state: AppState?) -> AppState {
    return state ?? AppState()
}
