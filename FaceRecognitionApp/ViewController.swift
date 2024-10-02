//
//  ViewController.swift
//  FaceRecognitionApp
//
//  Created by Eren Elçi on 3.10.2024.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    @IBOutlet var myLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signIncClick(_ sender: Any) {
        
        let authContext = LAContext()
        var error: NSError?
        
        if authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Is it you?") { (success, error) in
                if success == true {
                    // giriş başarılı
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "toSecondVC", sender: nil)
                    }
                    
                } else {
                    DispatchQueue.main.sync {
                        self.myLabel.text = "Error!"
                    }
                    
                }
            }
        }

    }
    
}

