//
//  ViewController.swift
//  SocialApp
//
//  Created by Aaron Thomas on 27/02/2017.
//  Copyright © 2017 Aaron Thomas. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase

class SignInVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //integrating with Facebook
    @IBAction func facebookBtnTapped(_ sender: Any) {
        
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil {
                print("AARON: Unable to authenticate with Facebook- \(error)")
            } else if result?.isCancelled == true {
                print("AARON: User cancelled Facebook authentication")
            } else {
                print("AARON: Successfuly authenticated with Facebook")
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)
            }
        }
    }
    
    func firebaseAuth(_ credential: FIRAuthCredential) {
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
            if error != nil {
                print("AARON: Unable to authenticate with Firebase - \(error)")
            } else {
                print("AARON: Successfully authenticated with Firebase")
            }
})
}
}

