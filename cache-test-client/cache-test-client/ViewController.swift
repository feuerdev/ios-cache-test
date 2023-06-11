//
//  ViewController.swift
//  cache-test-client
//
//  Created by Jannik Feuerhahn on 11.06.23.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    var cachePolicy:URLRequest.CachePolicy = .useProtocolCachePolicy
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func sendRequest(_ sender: Any) {
        let url = URL(string: "http://localhost:3000/cache")!
        let request = URLRequest(url: url, cachePolicy: cachePolicy)
        webView.load(request)
    }
    
    @IBAction func sendRequestNoCache(_ sender: Any) {
        let url = URL(string: "http://localhost:3000/no-cache")!
        let request = URLRequest(url: url, cachePolicy: cachePolicy)
        webView.load(request)
    }
    
    @IBAction func switchCaching(_ sender: UISwitch) {
        cachePolicy = sender.isOn ? .useProtocolCachePolicy : .reloadIgnoringLocalAndRemoteCacheData
        
    }
    @IBAction func clear(_ sender: Any) {
        webView.load(URLRequest(url: URL(string:"about:blank")!))
    }
}

