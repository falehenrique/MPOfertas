//
//  LoginViewController.swift
//  Menu
//
//  Created by Henrique Goncalves Leite on 20/10/16.
//  Copyright © 2016 Mercado Pago. All rights reserved.
//

import UIKit

import FBSDKCoreKit
import FBSDKLoginKit


class LoginViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    
    @IBOutlet weak var loginFacebook: FBSDKLoginButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let loginButton = FBSDKLoginButton()
        loginFacebook.readPermissions = ["public_profile","email","user_friends"]
        //loginButton.center = self.view.center
        //loginFacebook.delegate = self
        
        
       // self.view.addSubview(loginButton)
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if FBSDKAccessToken.current() != nil {
            self.performSegue(withIdentifier: "paginaInicial", sender: self)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        
        if error == nil {
            let req = FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id,name,email"], tokenString: result.token.tokenString, version: nil, httpMethod: "GET")
            
            req!.start(completionHandler: { (connection, result, error) in
                
                if error == nil {
                    
                    let result = result as? NSDictionary
                    
                    if  let email = result?["email"] {
                        UserDefaults.standard.set(email, forKey: "UserFacebook")
                    }
                    
                    if  let userID = result?["id"] {
                        UserDefaults.standard.set(userID, forKey: "UserID")
                    }
                    
                }  else {
                    print("Error \(error)")
                }
                
                self.performSegue(withIdentifier: "paginaInicial", sender: self)
            })
            
        }   else {
            let alertController = UIAlertController.init(title: "Atenção", message: "Ocorreu um erro ao realizar o login com o Facebook.", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Fechar", style: .default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
        }
        
    }
    
    let myRequest = FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "name, email, id"])
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("user logout")
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
