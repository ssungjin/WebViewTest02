//
//  ViewController.swift
//  WebviewTest02
//
//  Created by D7703_04 on 2019. 9. 9..
//  Copyright © 2019년 Y. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, UISearchBarDelegate,WKNavigationDelegate {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var forwardbutton: UIBarButtonItem!
    @IBOutlet var BackButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // UISearchBarDelegate 객체와 UIViewController 객체와 연결
        searchBar.delegate = self
        webView.navigationDelegate = self
        let request = URLRequest(url: URL(string: "http://www.google.com")!)
        webView.load(request)
    }
    
    func backAction(_ sender: Any) {
        if self.webView.canGoBack {
            self.webView.goBack()
        }
}

    func forwardAction(_ sender: Any) {
        if self.webView.canGoForward {
            self.webView.goForward()
        }
}
    // SearchBarDelegate Method 호출
    // called when keyboard search button pressed
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let inputURL = searchBar.text
        let request = URLRequest(url: URL(string: inputURL!)!)
        webView.load(request)
}
    //웹 받기 시작할때
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
}
    //웹 받는 것 끝났을때
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
      
        BackButton.isEnabled = webView.canGoBack
        forwardbutton.isSpringLoaded = webView.canGoForward
}
}
