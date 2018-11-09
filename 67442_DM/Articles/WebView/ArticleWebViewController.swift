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
  
  var urlString: String?
  @IBOutlet var webView: WKWebView!
//  @IBOutlet weak var back: UIBarButtonItem!


  override func viewDidLoad() {
    super.viewDidLoad()
    webView.navigationDelegate = self
    // Do any additional setup after loading the view.
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(true)
    print(urlString ?? "None given")
    let url:URL = URL(string: urlString!)!
    
    let urlRequest:URLRequest = URLRequest(url:url)
    webView.load(urlRequest)
  }
  
  @IBAction func backTapped(_ sender: Any) {
    if webView.canGoBack {
      webView.goBack()
    }
  }
  

}
