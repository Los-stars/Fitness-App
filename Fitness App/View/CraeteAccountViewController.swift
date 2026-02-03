//
//  CraeteAccountViewController.swift
//  Fitness App
//
//  Created by Amir on 10.12.2025.
//

import UIKit
import FirebaseCore
import FirebaseAuth

class CraeteAccountViewController: UIViewController {
    @IBOutlet weak var confirmPassword: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var fullname: UITextField!
    @IBOutlet weak var email: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func signUp(_ sender: Any) {
        Task{
            do{
                guard let f = fullname.text, let e = email.text, let passwd = password.text, let cpasswd = confirmPassword.text else{
                    return
                }
                
                if passwd != cpasswd{
                    showAlert(error: "Error", message: "Your password are not the same")
                }
                
                if f.isEmpty || e.isEmpty || passwd.isEmpty || cpasswd.isEmpty{
                    showAlert(error: "Error", message: "You have missed some data")
                }
                
                let regResult = try await Auth.auth().createUser(withEmail: e, password: passwd)
                
                await MainActor.run(){
                    guard let new  = storyboard?.instantiateViewController(identifier: "SetFingerprintViewController") as? SetFingerprintViewController else{
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
    @IBAction func back(_ sender: Any) {
        guard let new = storyboard?.instantiateViewController(identifier: "LoginViewController") as? LoginViewController else {
            return
        }
        new.modalPresentationStyle = .fullScreen
        self.present(new, animated: true)
        print(1)
    }
    @IBAction func logIn(_ sender: Any) {
        guard let new = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController else{
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
