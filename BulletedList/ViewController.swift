//
//  ViewController.swift
//  BulletedList
//
//  Created by Ben Dodson on 09/08/2018.
//  Copyright © 2018 Dodo Apps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(updateUI), name: .UIContentSizeCategoryDidChange, object: nil)
        updateUI()
    }

    @objc func updateUI() {

        let bullet = "•  "
        
        var strings = [String]()
        strings.append("Payment will be charged to your iTunes account at confirmation of purchase.")
        strings.append("Your subscription will automatically renew unless auto-renew is turned off at least 24-hours before the end of the current subscription period.")
        strings.append("Your account will be charged for renewal within 24-hours prior to the end of the current subscription period.")
        strings.append("Automatic renewals will cost the same price you were originally charged for the subscription.")
        strings.append("You can manage your subscriptions and turn off auto-renewal by going to your Account Settings on the App Store after purchase.")
        strings.append("Read our terms of service and privacy policy for more information.")
        strings = strings.map { return bullet + $0 }
        
        label.adjustsFontForContentSizeCategory
        
        var attributes = [NSAttributedStringKey: Any]()
        attributes[.font] = UIFont.preferredFont(forTextStyle: .body)
        attributes[.foregroundColor] = UIColor.darkGray
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.headIndent = (bullet as NSString).size(withAttributes: attributes).width
        attributes[.paragraphStyle] = paragraphStyle

        let string = strings.joined(separator: "\n\n")
        label.attributedText = NSAttributedString(string: string, attributes: attributes)
    }

}

