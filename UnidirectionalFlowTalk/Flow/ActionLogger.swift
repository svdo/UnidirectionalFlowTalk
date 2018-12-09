import ReSwift

public func ActionLogger<S: Codable>() -> Middleware<S> {
    return { dispatch, getState in
        return { next in
            return { action in
                print("-------------------------------------------------")
                print("State before:", getState: getState)
                print("Action:", action)
                next(action)
                print("State after:", getState: getState)
            }
        }
    }
}

func print<S: Codable>(_ message: String, getState: () -> S?) {
    if let state = getState() {
        let stateEncoder = JSONEncoder()
        if let data = try? stateEncoder.encode(state),
            let stateString = String(data: data, encoding: .utf8) {
            print(message, stateString)
        }
    }
}
