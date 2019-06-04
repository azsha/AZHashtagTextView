//
//  ViewController.swift
//  AZHashtagTextViewExample
//
//  Created by JonghyunShin on 2016. 11. 9..
//  Copyright © 2016년 JonghyunShin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var myTextView: AZHashtagTextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTextView.delegate = self
        
        // Search HashTags
        myTextView.resolveHashTags()
        myTextView.linkTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.red]
    }

    func textView(_ textView: UITextView, shouldInteractWith url: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        guard let aztextView = textView as? AZHashtagTextView  else { return false }
        guard let URL = url.scheme else { return false }
        let arrId = Int(URL)
        
        let alertController = UIAlertController(title: "AZHashtagTextViewExample",
                                                message: "\(aztextView.hashtagArr![arrId!])",
                                                preferredStyle: .alert)
        
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { UIAlertAction in
            alertController.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(okButton)
        
        self.present(alertController, animated: true, completion: nil)
        
        return true
    }
}

