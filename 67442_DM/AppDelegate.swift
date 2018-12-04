//
//  AppDelegate.swift
//  67442_DM
//
//  Created by Dylan Hyun on 11/3/18.
//  Copyright © 2018 Dylan Hyun. All rights reserved.
//

import UIKit
import CoreData
import SpotifyKit

fileprivate let application = SpotifyManager.SpotifyDeveloperApplication(
  clientId:     "e32331cd032847249c3aed5780f6a12b",
  clientSecret: "40bb2b273af94a458b8459e093fa6265",
  redirectUri:  "dailyarchive://callback"
)

let spotifyManager = SpotifyManager(with: application)
var savedArticles = [Event]()

func getFont(year: Int) -> String {
  if (year < 1920) {
    return "Baskerville"
  } else if (year < 1940) {
    return "Futura"
  } else if (year < 1960) {
    return "Helvetica"
  } else if (year < 1980) {
    return "GillSans"
  } else if (year < 2000) {
    return "AmericanTypewriter"
  }
  return "Avenir"
}

func getImage(year: Int) -> UIImage {
  switch year {
  case _ where year < 1920:
    return UIImage(named: "10s")!
  case _ where year < 1930:
    return UIImage(named: "20s")!
  case _ where year < 1940:
    return UIImage(named: "30s")!
  case _ where year < 1950:
    return UIImage(named: "40s")!
  case _ where year < 1960:
    return UIImage(named: "50s")!
  case _ where year < 1970:
    return UIImage(named: "60s")!
  case _ where year < 1980:
    return UIImage(named: "70s")!
  case _ where year < 1990:
    return UIImage(named: "80s")!
  case _ where year < 2000:
    return UIImage(named: "90s")!
  case _ where year < 2010:
    return UIImage(named: "2000s")!
  default:
    return UIImage(named: "2010s")!
  }
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
//  let spotifyManager = SpotifyManager(with:
//    SpotifyManager.SpotifyDeveloperApplication(
//      clientId:     "e32331cd032847249c3aed5780f6a12b",
//      clientSecret: "40bb2b273af94a458b8459e093fa6265",
//      redirectUri:  "https://dailyarchive.com/callback/redirect"
//    )
//  )
  
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    return true
  }
  
  func application(_ application: UIApplication, handleOpen url: URL) -> Bool {
    spotifyManager.saveToken(from: url)
    
    return true
  }
  
  func applicationWillResignActive(_ application: UIApplication) {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
  }
  
  func applicationDidEnterBackground(_ application: UIApplication) {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
  }
  
  func applicationWillEnterForeground(_ application: UIApplication) {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
  }
  
  func applicationDidBecomeActive(_ application: UIApplication) {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
//    spotifyManager.authorize()
  }
  
  func applicationWillTerminate(_ application: UIApplication) {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    self.saveContext()
  }
  
  // MARK: - Core Data stack
  
  lazy var persistentContainer: NSPersistentContainer = {
    /*
     The persistent container for the application. This implementation
     creates and returns a container, having loaded the store for the
     application to it. This property is optional since there are legitimate
     error conditions that could cause the creation of the store to fail.
     */
    let container = NSPersistentContainer(name: "_7442_DM")
    container.loadPersistentStores(completionHandler: { (storeDescription, error) in
      if let error = error as NSError? {
        // Replace this implementation with code to handle the error appropriately.
        // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        
        /*
         Typical reasons for an error here include:
         * The parent directory does not exist, cannot be created, or disallows writing.
         * The persistent store is not accessible, due to permissions or data protection when the device is locked.
         * The device is out of space.
         * The store could not be migrated to the current model version.
         Check the error message to determine what the actual problem was.
         */
        fatalError("Unresolved error \(error), \(error.userInfo)")
      }
    })
    return container
  }()
  
  // MARK: - Core Data Saving support
  
  func saveContext () {
    let context = persistentContainer.viewContext
    if context.hasChanges {
      do {
        try context.save()
      } catch {
        // Replace this implementation with code to handle the error appropriately.
        // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        let nserror = error as NSError
        fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
      }
    }
  }
  
}
