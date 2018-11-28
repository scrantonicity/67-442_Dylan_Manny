//
//  DeathWebViewController.swift
//  67442_DM
//
//  Created by Manuel Lopez on 11/27/18.
//  Copyright © 2018 Dylan Hyun. All rights reserved.
//

import UIKit
import WebKit

class DeathWebViewController: UIViewController, WKNavigationDelegate {
  
  var activityIndicator: UIActivityIndicatorView!
  var urlString: String?
  var viewModel: DeathWebViewModel?
  @IBOutlet var webView: WKWebView!
  //  @IBOutlet weak var back: UIBarButtonItem!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    webView.navigationDelegate = self
    //    print(urlString ?? "None given")
    //    let url:URL = URL(string: urlString!)!
    //
    //    let urlRequest:URLRequest = URLRequest(url:url)
    //    webView.load(urlRequest)
    // Do any additional setup after loading the view.
    activityIndicator = UIActivityIndicatorView()
    activityIndicator.center = self.view.center
    activityIndicator.hidesWhenStopped = true
    activityIndicator.style = UIActivityIndicatorView.Style.gray
    view.addSubview(activityIndicator)
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(true)
    urlString = viewModel?.getUrl()
    print(urlString ?? "None given")
    let url:URL = URL(string: urlString!)!
    
    let urlRequest:URLRequest = URLRequest(url:url)
    webView.load(urlRequest)
    print("url loaded")
  }
  
  func showActivityIndicator(show: Bool) {
    if show {
      activityIndicator.startAnimating()
    } else {
      activityIndicator.stopAnimating()
    }
  }
  
  func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
    showActivityIndicator(show: false)
  }
  
  func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
    showActivityIndicator(show: true)
  }
  
  func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
    showActivityIndicator(show: false)
  }
  
  @IBAction func backTapped(_ sender: Any) {
    if webView.canGoBack {
      webView.goBack()
    }
  }
  
}
