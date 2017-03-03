//
//  FeedVC.swift
//  SocialApp
//
//  Created by Aaron Thomas on 02/03/2017.
//  Copyright © 2017 Aaron Thomas. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper
import Firebase

class FeedVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func signInTapped(_ sender: Any) {
        let keychainResult = KeychainWrapper.defaultKeychainWrapper.removeObject(forKey: KEY_UID)
        print("AARON: ID removed from keychain \(keychainResult)")
        try! FIRAuth.auth()?.signOut()
        performSegue(withIdentifier: "goToSignInVC", sender: nil)
    }
    
}
