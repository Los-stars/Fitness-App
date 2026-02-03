//
//  LoginViewController.swift
//  Fitness App
//
//  Created by Amir on 07.12.2025.
//

import UIKit
import FirebaseCore
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    @IBAction func logIn(_ sender: Any) {
        Task{
            do{
                guard let login = username.text, let passwd = password.text else {
                    return
                }
                
                if login.isEmpty || passwd.isEmpty{
                    showAlert(error: "Error", message: "Login or password are empty")
                }
                
                let authResult = try await Auth.auth().signIn(withEmail: login, password: passwd)
                
                await MainActor.run(){
                    guard let new = storyboard?.instantiateViewController(identifier: "SetFingerprintViewController") as? SetFingerprintViewController else {
                        return
                    }
                    new.modalPresentationStyle = .fullScreen
                    self.present(new, animated: true)
                }
            }
            catch{
                await MainActor.run(){
                    showAlert(error: "Error", message: error.localizedDescription)
                }
            }
        }
        
        
    }
    @IBAction func forgetPassword(_ sender: Any) {
        guard let new = storyboard?.instantiateViewController(identifier: "ForgotPasswordViewController") as? ForgotPasswordViewController else {
            return
        }
        new.modalPresentationStyle = .fullScreen
        self.present(new, animated: true)
    }
    @IBAction func signUp(_ sender: Any) {
        guard let new = storyboard?.instantiateViewController(identifier: "CraeteAccountViewController") as? CraeteAccountViewController else{
            return
        }
        new.modalPresentationStyle = .fullScreen
        self.present(new, animated: true)
    }
    @IBAction func backToPreScreen(_ sender: Any) {
        guard let new = storyboard?.instantiateViewController(identifier: "PreScreenViewController") as? PreScreenViewController else {
            return
        }
        new.modalPresentationStyle = .fullScreen
        self.present(new, animated: true)
    }
    
    private func showAlert(error e: String, message m: String){
        let alert = UIAlertController(title: e, message: m , preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
