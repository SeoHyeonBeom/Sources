//
//  ViewController.swift
//  MiniBrowser
//
//  Created by 범서현 on 2021/11/17.
//

import UIKit
import WebKit

class ViewController: UIViewController, UITextViewDelegate, WKNavigationDelegate {

    @IBOutlet weak var BookMarkSegmentedControl: UISegmentedControl!
    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var mainWebView: WKWebView!
    @IBOutlet weak var spinningActivityIndicatorView: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let initialURL = "https://www.google.com"
        let myURL = URL(string:initialURL)
        let myRequest = URLRequest(url:myURL!)
        mainWebView.load(myRequest)
        urlTextField.text = initialURL
        mainWebView.navigationDelegate = self
    }

    @IBAction func bookMarkAction(_ sender: Any) {
        let bookMarkURL = BookMarkSegmentedControl.titleForSegment(at: BookMarkSegmentedControl.selectedSegmentIndex)
        let urlString = "https://www.\(bookMarkURL!).com"
        mainWebView.load(URLRequest(url: URL(string: urlString)!))
        urlTextField.text = urlString

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        var urlString = "\(urlTextField.text!)"
        if !urlString.hasPrefix("https://"){
            urlString = "https://\(urlTextField.text!)"

        }
        urlTextField.text = urlString
        mainWebView.load(URLRequest(url: URL(string: "urlString")!))
        textField.resignFirstResponder()
        return true
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        spinningActivityIndicatorView.startAnimating()

    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        spinningActivityIndicatorView.stopAnimating()

    }
    
    @IBAction func goBackAction(_ sender: Any) {
        mainWebView.goBack()
    }
    @IBAction func goForwardAction(_ sender: Any) {
        mainWebView.goForward()
    }
    @IBAction func stopLoadingAction(_ sender: Any) {
        mainWebView.stopLoading()
    }
    @IBAction func reloadAction(_ sender: Any) {
        mainWebView.reload()
    }
}

