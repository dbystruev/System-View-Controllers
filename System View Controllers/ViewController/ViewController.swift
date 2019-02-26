//
//  ViewController.swift
//  System View Controllers
//
//  Created by Denis Bystruev on 26/02/2019.
//  Copyright © 2019 Denis Bystruev. All rights reserved.
//

import MessageUI
import SafariServices
import UIKit

class ViewController: UIViewController {
    
    // MARK: - ... @IBOutlet
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: - ... Methods
    func share(sender: UIButton) {
        guard let image = imageView.image else { return }
        
        let activityController = UIActivityViewController(
            activityItems: [image],
            applicationActivities: nil
        )
        activityController.popoverPresentationController?.sourceView = sender
        
        present(activityController, animated: true, completion: nil)
    }
    
    func safari(sender: UIButton) {
        let url = URL(string: "http://apple.com")!
        
        let safariViewController = SFSafariViewController(url: url)
        
        present(safariViewController, animated: true, completion: nil)
    }
    
    func camera(sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        let alertController = UIAlertController(
            title: "Choose Image Source",
            message: nil,
            preferredStyle: .actionSheet
        )
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraAction = UIAlertAction(title: "Camera", style: .default) { action in
                imagePicker.sourceType = .camera
                self.present(imagePicker, animated: true, completion: nil)
            }
            alertController.addAction(cameraAction)
        }
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default) { action in
                imagePicker.sourceType = .photoLibrary
                self.present(imagePicker, animated: true, completion: nil)
            }
            alertController.addAction(photoLibraryAction)
        }
        
        alertController.popoverPresentationController?.sourceView = sender
        
        present(alertController, animated: true, completion: nil)
    }
    
    func email(sender: UIButton) {
        guard MFMailComposeViewController.canSendMail() else {
            print(#function, "Can't send e-mail")
            return
        }
        
        let mailComposer = MFMailComposeViewController()
        mailComposer.mailComposeDelegate = self
        mailComposer.setToRecipients(["dbystruev@learnSwift.ru"])
        mailComposer.setSubject("This is a test at \(Date())")
        mailComposer.setMessageBody(
            "Привет, я хотел сообщить, что тиграм не докладывают мяса",
            isHTML: false
        )
        present(mailComposer, animated: true, completion: nil)
    }
    
    // MARK: - ... @IBAction
    @IBAction func buttonPressed(sender button: UIButton) {
        guard let text = button.titleLabel?.text else { return }
        
        switch text {
        case "Share":
            share(sender: button)
        case "Safari":
            safari(sender: button)
        case "Camera":
            camera(sender: button)
        case "Email":
            email(sender: button)
        default:
            break
        }
    }
}

