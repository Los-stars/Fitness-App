//
//  SetGenderViewController.swift
//  Fitness App
//
//  Created by Amir on 02.02.2026.
//

import UIKit

class SetGenderViewController: UIViewController {
    
    var gender: String!
    var maleButton: CircleButton!
    var femaleButton: CircleButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        maleButton = CircleButton(imageName: "icons8-male-100", frame: CGRect(x: 109, y: 297, width: 162, height: 162))
        femaleButton = CircleButton(imageName: "icons8-female-100-2", frame: CGRect(x: 115, y: 515, width: 162, height: 162))
        
        view.addSubview(maleButton)
        view.addSubview(femaleButton)
        
        maleButton.tag = 1
        femaleButton.tag = 2
        
        maleButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        femaleButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
            
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        if sender.tag == 1{
            maleButton.changeImage(to: "icons8-male-100-2")
            maleButton.changeBGColor(to: UIColor.green)
            maleButton.changeStroke(to: UIColor.clear)
            gender = "male"
            
            femaleButton.changeImage(to: "icons8-female-100-2")
            femaleButton.changeBGColor(to: UIColor.clear)
            femaleButton.changeStroke(to: UIColor.white)
        }else{
            maleButton.changeImage(to: "icons8-male-100")
            maleButton.changeBGColor(to: UIColor.clear)
            maleButton.changeStroke(to: UIColor.white)
            gender = "female"
            
            femaleButton.changeImage(to: "icons8-female-100")
            femaleButton.changeBGColor(to: UIColor.green)
            femaleButton.changeStroke(to: UIColor.clear)
        }
    }
    
    @IBAction func backButton(_ sender: Any) {
    }
    @IBAction func continueButton(_ sender: Any) {
        if gender.isEmpty{
            showAlert("You do not choose the gender", "Error")
        }else{
            guard let new = storyboard?.instantiateViewController(identifier: "") as?
        }
    }
    
    private func showAlert(_ errorMessage: String,_ message: String){
        let alert = UIAlertController(title: errorMessage, message: message, preferredStyle: .alert)
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
