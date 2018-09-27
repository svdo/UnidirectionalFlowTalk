import ReSwift

private let initialState = CounterState(value: 0)

func counterReducer(action: Action, state: CounterState?) -> CounterState {
    var state = state ?? initialState
    switch action {
    case is IncrementCounter:
        state.value += 1
    default:
        break
    }
    return state
}
