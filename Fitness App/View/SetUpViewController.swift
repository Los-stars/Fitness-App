//
//  SetUpViewController.swift
//  Fitness App
//
//  Created by Amir on 11.01.2026.
//

import UIKit

class SetUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func nextButton(_ sender: Any) {
        guard let new = storyboard?.instantiateViewController(identifier: "SetGenderViewController") as? SetGenderViewController else {
            return
        }
        new.modalPresentationStyle = .fullScreen
        self.present(new, animated: true)
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
