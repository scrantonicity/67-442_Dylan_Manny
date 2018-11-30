//
//  BirthWebViewController.swift
//  67442_DM
//
//  Created by Manuel Lopez on 11/27/18.
//  Copyright © 2018 Dylan Hyun. All rights reserved.
//

import UIKit
import WebKit

class BirthWebViewController: UIViewController, WKNavigationDelegate {

  var activityIndicator: UIActivityIndicatorView!
  var urlString: String?
  var viewModel: BirthWebViewModel?
  @IBOutlet var webView: WKWebView!
  @IBOutlet weak var share: UIBarButtonItem!
  
  
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
  
  @IBAction func shareButtonTapped(_ sender: Any) {
    let person:String = viewModel!.getName()
    let year:String = viewModel!.birth.year
    let url:String = viewModel!.getUrl()
    let textToShare = "Did you know? Today in \(year), \(person) was born. \(url)"
    
    let ac = UIActivityViewController(activityItems: [textToShare], applicationActivities: nil)
    present(ac, animated: true)
    //    navigationController?.present(activityViewController, animated: true)
  }
  

}
