import ReSwift

private let initialState = CounterState(value: 0)

func counterReducer(action: Action, state: CounterState?) -> CounterState {
    return state ?? initialState
}
