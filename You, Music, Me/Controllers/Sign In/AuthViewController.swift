//
//  AuthViewController.swift
//  You, Music, Me
//
//  Created by Justin Viasus on 1/29/22.
//

import Foundation
import UIKit
import WebKit

// A class that handles the user signing into spotify with the API. Loads the authentication page in a web view.
class AuthViewController: UIViewController, WKNavigationDelegate {
    
    private let webView: WKWebView = {
        // An object that specifies the behaviors to use when loading and rendering page content.
        let preferences = WKWebpagePreferences()
        preferences.allowsContentJavaScript = true
        
        // A collection of properties that you use to initialize a web view.
        let configuration = WKWebViewConfiguration()
        configuration.defaultWebpagePreferences = preferences
        
        let webView = WKWebView(frame: .zero, configuration: configuration)
        
        return webView
    }()
    
    public var completionHandler: ((Bool) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Sign in to Spotify"
        view.backgroundColor = .systemBackground
        
        // This allows us to know when the page loads.
        webView.navigationDelegate = self
        
        view.addSubview(webView)
        
        // Unwrap the sign in URL
        guard let url = SpotifyAuthManager.shared.signInURL else { return }
        
        // Load the url in the web view
        webView.load(URLRequest(url: url))
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // Set the web view's frame to the entirety of the vc's bounds
        webView.frame = view.bounds
    }
    
    // The web view calls this method after it receives provisional approval to process a navigation request, but before it receives a response to that request.
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        // The URL for the current web page
        guard let url = webView.url else { return }
        
        // If the url has a parameter for code, we want to get it and exchange the code that Spotify gives us (after the user gives us permission) for an access token.
        guard let code = URLComponents(string: url.absoluteString)?.queryItems?.first(where: { $0.name == "code"  })?.value else { return }
        
        // Exchange the code for access token
        SpotifyAuthManager.shared.exchangeCodeForToken(code: code) { [weak self] success in
            DispatchQueue.main.async {
                self?.navigationController?.popToRootViewController(animated: true)
                self?.completionHandler?(success)
            }
        }
    }
    
}
