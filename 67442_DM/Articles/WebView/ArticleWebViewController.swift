//
//  ArticleWebViewController.swift
//  67442_DM
//
//  Created by Manuel Lopez on 11/9/18.
//  Copyright © 2018 Dylan Hyun. All rights reserved.
//

import UIKit
import WebKit

class ArticleWebViewController: UIViewController, WKNavigationDelegate {
  
  var activityIndicator: UIActivityIndicatorView!
  var urlString: String?
  @IBOutlet var webView: WKWebView!
//  @IBOutlet weak var back: UIBarButtonItem!


  override func viewDidLoad() {
    print("starting web view load")
    super.viewDidLoad()
    print("did super loading")
    webView.navigationDelegate = self
    print(urlString ?? "None given")
    let url:URL = URL(string: urlString!)!
    let urlRequest:URLRequest = URLRequest(url:url)
    webView.load(urlRequest)
    // Do any additional setup after loading the view.
    activityIndicator = UIActivityIndicatorView()
    activityIndicator.center = self.view.center
    activityIndicator.hidesWhenStopped = true
    activityIndicator.style = UIActivityIndicatorView.Style.gray
    view.addSubview(activityIndicator)
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(true)
//    print(urlString ?? "None given")
    let url:URL = URL(string: urlString!)!
    print(url)

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
    print("Did start loading")
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
