//
//  AppDelegate.swift
//  67442_DM
//
//  Created by Dylan Hyun on 11/3/18.
//  Copyright © 2018 Dylan Hyun. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, SPTSessionManagerDelegate,
SPTAppRemoteDelegate, SPTAppRemotePlayerStateDelegate {

  var window: UIWindow?
  
  //  Mark: Spotify Config
  let SpotifyClientID = "e32331cd032847249c3aed5780f6a12b"
  let SpotifyRedirectURL = URL(string: "spotify-ios-quick-start://spotify-login-callback")!
  
  lazy var configuration = SPTConfiguration(
    clientID: SpotifyClientID,
    redirectURL: SpotifyRedirectURL
  )
  
  lazy var sessionManager: SPTSessionManager = {
    if let tokenSwapURL = URL(string: "https://dailyarchive.herokuapp.com/api/token"),
      let tokenRefreshURL = URL(string: "https://dailyarchive.herokuapp.com/api/refresh_token") {
      self.configuration.tokenSwapURL = tokenSwapURL
      self.configuration.tokenRefreshURL = tokenRefreshURL
      self.configuration.playURI = ""
    }
    let manager = SPTSessionManager(configuration: self.configuration, delegate: self)
    return manager
  }()
  
  func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
    self.sessionManager.application(app, open: url, options: options)
    return true
  }
  
  lazy var appRemote: SPTAppRemote = {
    let appRemote = SPTAppRemote(configuration: self.configuration, logLevel: .debug)
    appRemote.delegate = self
    return appRemote
  }()
  
  func sessionManager(manager: SPTSessionManager, didInitiate session: SPTSession) {
    self.appRemote.connectionParameters.accessToken = session.accessToken
    self.appRemote.connect()
    print("success", session)
    let requestedScopes: SPTScope = [.appRemoteControl]
    self.sessionManager.initiateSession(with: requestedScopes, options: .default)
  }
  
  func appRemoteDidEstablishConnection(_ appRemote: SPTAppRemote) {
    // Connection was successful, you can begin issuing commands
    self.appRemote.playerAPI?.delegate = self
    self.appRemote.playerAPI?.subscribe(toPlayerState: { (result, error) in
      if let error = error {
        debugPrint(error.localizedDescription)
      }
    })
  }
  
  func playerStateDidChange(_ playerState: SPTAppRemotePlayerState) {
    debugPrint("Track name: %@", playerState.track.name)
  }
  
  //  Mark: Delegate Functions
  
  func sessionManager(manager: SPTSessionManager, didFailWith error: Error) {
    print("fail", error)
  }
  func sessionManager(manager: SPTSessionManager, didRenew session: SPTSession) {
    print("renewed", session)
  }
  
//  func appRemoteDidEstablishConnection(_ appRemote: SPTAppRemote) {
//    print("connected")
//  }
  func appRemote(_ appRemote: SPTAppRemote, didDisconnectWithError error: Error?) {
    print("disconnected")
  }
  func appRemote(_ appRemote: SPTAppRemote, didFailConnectionAttemptWithError error: Error?) {
    print("failed")
  }
//  func playerStateDidChange(_ playerState: SPTAppRemotePlayerState) {
//    print("player state changed")
//  }

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    return true
  }

  func applicationWillResignActive(_ application: UIApplication) {
    if self.appRemote.isConnected {
      self.appRemote.disconnect()
    }
  }

  func applicationDidEnterBackground(_ application: UIApplication) {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
  }

  func applicationWillEnterForeground(_ application: UIApplication) {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
  }

  func applicationDidBecomeActive(_ application: UIApplication) {
    if let _ = self.appRemote.connectionParameters.accessToken {
      self.appRemote.connect()
    }
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

