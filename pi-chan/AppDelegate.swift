//
//  AppDelegate.swift
//  pi-chan
//
//  Created by Kensuke Hoshikawa on 2016/03/27.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import SVProgressHUD
import OAuthSwift
import Fabric
import Crashlytics

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  
  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    
    UpdateChecker.prompt()
    KeychainManager.initialSettings()
    IQKeyboardManager.sharedManager().enable = true
    SVProgressHUD.setMinimumDismissTimeInterval(0.5)
    Fabric.with([Crashlytics.self])

    // navigation bar settings
    UINavigationBar.appearance().tintColor = UIColor.whiteColor()
    UINavigationBar.appearance().barTintColor = UIColor.esaGreen()
    UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]
    
    UINavigationBar.appearance().titleTextAttributes = [NSFontAttributeName: UIFont(name: "Lato-Regular", size: 19)!, NSForegroundColorAttributeName: UIColor.whiteColor()]
    
    // tabbar settings
    let titleFontAll : UIFont = UIFont(name: "Lato-Regular", size: 11.0)!
    let attributesNormal = [ NSForegroundColorAttributeName : UIColor.grayColor(), NSFontAttributeName : titleFontAll ]
    let attributesSelected = [ NSForegroundColorAttributeName : UIColor.esaGreen(), NSFontAttributeName : titleFontAll ]
    UITabBarItem.appearance().setTitleTextAttributes(attributesNormal, forState: .Normal)
    UITabBarItem.appearance().setTitleTextAttributes(attributesSelected, forState: .Selected)
    
    return true
  }
  
  func application(app: UIApplication, openURL url: NSURL, options: [String : AnyObject]) -> Bool {
    if (url.host == "oauth-callback") {
      OAuthSwift.handleOpenURL(url)
    }
    return true
  }
  
  @available(iOS 9.0, *)
  func application(application: UIApplication, performActionForShortcutItem shortcutItem: UIApplicationShortcutItem, completionHandler: (Bool) -> Void) {
    let handled = handleShortCutItem(shortcutItem)
    completionHandler(handled)
  }
  
  func handleShortCutItem(shortcutItem: UIApplicationShortcutItem) -> Bool {
    Window.openEditor(window!.rootViewController!, post: nil)
    return true
  }
  
  func applicationWillResignActive(application: UIApplication) {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
  }
  
  func applicationDidEnterBackground(application: UIApplication) {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
  }
  
  func applicationWillEnterForeground(application: UIApplication) {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
  }
  
  func applicationDidBecomeActive(application: UIApplication) {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
  }

  func applicationWillTerminate(application: UIApplication) {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
  }
  
  
}

