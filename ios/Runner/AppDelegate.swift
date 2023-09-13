import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate:UIResponder,UIApplicationDelegate{
func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      GeneratedPluginRegistrant.register(withRegistry:self);
      FirebaseApp.configure()
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
