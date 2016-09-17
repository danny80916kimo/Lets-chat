//
//  ViewController.swift
//  Lets-chat
//
//  Created by Zack on 2016/9/7.
//  Copyright © 2016年 DaGin. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func fbBtnPressed (_ sender: UIButton){
        let facebookLogIn = FBSDKLoginManager()
        facebookLogIn.logIn(withReadPermissions: ["email"], from: self)
        {(result, error) in
            if error != nil {
                print("Facebook login faild. Error \(error)")
            }else if result?.isCancelled == true{
                print("danny: User canncelld Facebook authentication")
            }else{
                print("danny: successfully authenticated with Facebook")
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                // let accessToken = FBSDKAccessToken.current().tokenString
                // print("Successfully logged in with facebook. \(accessToken)")
                self.firebaseAuth(credential)
                
            }
        }
    }
    func firebaseAuth(_ credential: FIRAuthCredential){
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
            if error != nil{
                print("danny:Unable to authenticate with Firebase - \(error)")
            }else{
                print("danny:Sucessfully authenticate with Firebase")
            }
        })
    }
}


