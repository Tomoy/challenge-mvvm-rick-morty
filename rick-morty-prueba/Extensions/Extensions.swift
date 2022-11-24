//
//  Extensions.swift
//  rick-morty-prueba
//
//  Created by Tomas Ignacio Moyano on 23.11.22.
//

import Foundation
import UIKit

protocol Storyboarded {
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    
    static func instantiate() -> Self {
        
        let fullName = NSStringFromClass(self)

        // this splits by the dot and uses everything after, giving "MyViewController"
        let className = fullName.components(separatedBy: ".")[1]

        // load our storyboard
        let bundle = Bundle(for: self)
        let storyboard = UIStoryboard(name: className, bundle: bundle)

        // instantiate a view controller with that identifier, and force cast as the type that was requested
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
}

extension UIImageView {
  func loadImage(at url: URL) {
    UIImageLoader.loader.load(url, for: self)
  }

  func cancelImageLoad() {
    UIImageLoader.loader.cancel(for: self)
  }
}

extension UIViewController {
    //Method to show a simple alert controller that gives a message and has only one dismiss button
    func showMessageAlertController(title:String, message:String, dismissButtonText:String) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
                
        let dismissButtonAction = UIAlertAction(title: dismissButtonText, style: .default) { (action:UIAlertAction) in
            alertController.dismiss(animated: true) {}
        }
        
        alertController.addAction(dismissButtonAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
