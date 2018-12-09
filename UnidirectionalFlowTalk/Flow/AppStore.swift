import ReSwift

let appStore = Store<AppState>(
    reducer: appReducer,
    state: nil,
    middleware: [ActionLogger()]
)
