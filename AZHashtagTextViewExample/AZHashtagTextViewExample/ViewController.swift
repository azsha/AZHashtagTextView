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
        
        myTextView.resolveHashTags()
        myTextView.linkTextAttributes = [NSForegroundColorAttributeName: UIColor.red]
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textView(_ textView: UITextView, shouldInteractWith url: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        
        if let aztextView = textView as? AZHashtagTextView {
            if let URL = url.scheme {
                let arrId = Int(URL)
                
                let alertController = UIAlertController(title: "AZHashtagTextViewExample", message: "\(aztextView.hashtagArr![arrId!])", preferredStyle: .alert)
                let okBtn = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
                    UIAlertAction in
                    alertController.dismiss(animated: true, completion: nil)
                }
                alertController.addAction(okBtn)
                
                self.present(alertController, animated: true, completion: nil)
                
            }
        }
        return false
    }
}

