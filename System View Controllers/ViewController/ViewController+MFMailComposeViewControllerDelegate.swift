//
//  ViewController+MFMailComposeViewControllerDelegate.swift
//  System View Controllers
//
//  Created by Denis Bystruev on 26/02/2019.
//  Copyright © 2019 Denis Bystruev. All rights reserved.
//

import MessageUI

extension ViewController: MFMailComposeViewControllerDelegate {
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        print(#function)
        dismiss(animated: true, completion: nil)
    }
    
}
