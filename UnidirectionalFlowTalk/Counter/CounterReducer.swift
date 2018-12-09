import ReSwift

private let initialState = CounterState()

func counterReducer(action: Action, state: CounterState?) -> CounterState {
    return state ?? initialState
}
