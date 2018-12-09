import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    // For this demo, I use this "hack" to force the appStore to be
    // instantiated on app launch, instead of lazy. This way the effect
    // of the ActionLogger middleware can be seen immediately.
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        let _ = appStore
        return true
    }
}
