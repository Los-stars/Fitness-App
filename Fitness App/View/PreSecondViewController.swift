//
//  PreSecondViewController.swift
//  Fitness App
//
//  Created by Amir on 07.12.2025.
//

import UIKit

class PreSecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func nextVC(_ sender: Any) {
        guard let new = storyboard?.instantiateViewController(identifier: "PreThirdViewController") as? PreThirdViewController else { return }
        
        let transition = CATransition()
            transition.duration = 0.35
            transition.type = .push
            transition.subtype = .fromRight
            view.window?.layer.add(transition, forKey: kCATransition)
        
        new.modalPresentationStyle = .fullScreen
        present(new, animated: false)
    }
    @IBAction func skipAllPreviewButton(_ sender: Any) {
        guard let new = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController else { return }
        
        new.modalPresentationStyle = .fullScreen
        self.present(new, animated: false)
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
