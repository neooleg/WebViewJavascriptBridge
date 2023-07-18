//
//  ViewController.swift
//  ExampleSwiftApp-iOS
//
//  Created by John Marcus Westin on 12/27/16.
//  Copyright © 2016 Marcus Westin. All rights reserved.
//

import UIKit
import WebKit

import WebViewJavascriptBridge

func loadEchoSample(_ webView: Any) {
    let request = URLRequest.init(url: Bundle.main.url(forResource: "echo", withExtension: "html")!)
//    if webView is UIWebView {
//        (webView as! UIWebView).loadRequest(request)
//    } else {
        (webView as! WKWebView).load(request)
//    }
}

class ViewController: UIViewController {
    
    var webView: WKWebView = WKWebView.init()
    var bridge: WebViewJavascriptBridge = WebViewJavascriptBridge.init();

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // --- WebView ---
        var frame = view.bounds
        frame.size.height /= 2
        
        webView = WKWebView.init(frame: frame)
        webView.backgroundColor = UIColor.red
        webView.isInspectable = true
        
        // --- WebView Bridge ---
        loadEchoSample(webView)
        bridge = WebViewJavascriptBridge.init(webView);
        
        view.addSubview(webView)
    }
    
    // --- [START: For debugging purposes] Taps support ---
    @objc private func handleTapGesture(_ gesture: UITapGestureRecognizer) {
        bridge.callHandler("showAlert", data: "Hi from ObjC to JS!")
    }
    // --- [END: For debugging purposes] Taps support ---

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

