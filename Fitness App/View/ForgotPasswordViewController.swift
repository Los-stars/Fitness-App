//
//  ForgotPasswordViewController.swift
//  Fitness App
//
//  Created by Amir on 10.12.2025.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    @IBOutlet weak var emailAddress: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func goToSetPassword(_ sender: Any) {
        guard let email = emailAddress.text else {
            return
        }
//                    self.showAlert(error: "Error", message: "You don't have an account")
    }
    @IBAction func back(_ sender: Any) {
        guard let new = storyboard?.instantiateViewController(identifier: "LoginViewController") as? LoginViewController else{
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
