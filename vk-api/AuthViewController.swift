//
//  AuthViewController.swift
//  vk_server
//
//  Created by Grisha Pospelov on 19.08.2021.
//
import UIKit
import WebKit

class AuthViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView! {
        didSet {
            webView.navigationDelegate = self
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        authorizeToVK()
    }
    
    func authorizeToVK() {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: "7822904"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "262150"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "revoke", value: "1"),
            URLQueryItem(name: "v", value: "5.68")
        ]
        
        let request = URLRequest(url: urlComponents.url!)
        
        webView.load(request)
    }

}

extension AuthViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        
        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment  else {
            decisionHandler(.allow)
            return
        }
        
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
        }
        
        guard let token = params["access_token"],
              let userId = params["user_id"] else { return }
        
        print(token)
        
        
        
        Session.shared.token = token
        Session.shared.userId = userId
        
        let friendsVC = DisplayFriendsViewController()
        
        navigationController?.pushViewController(friendsVC, animated: true)
        
        performSegue(withIdentifier: "toTabs", sender: self)
        
        decisionHandler(.cancel)
    }
}

