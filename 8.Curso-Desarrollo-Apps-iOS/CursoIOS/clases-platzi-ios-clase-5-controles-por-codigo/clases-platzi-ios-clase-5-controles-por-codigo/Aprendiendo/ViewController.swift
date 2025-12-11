//
//  ViewController.swift
//  Aprendiendo
//
//  Created by Luis Carlos Mejia Garcia on 20/01/20.
//  Copyright © 2020 Platzi. All rights reserved.
//

import UIKit
import PopupDialog

class ViewController: UIViewController {
    // MARK: - Referencias UI
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBOutlet weak var emailSwitch: UISwitch!
    
    @IBAction func loginButtonAction() {
        // 1. Obtener los valores de los textfield.
        let email = emailTextField.text
        let password = passwordTextField.text
        
        if email == "carlos@mejia.com", password == "123" {
            if emailSwitch.isOn {
                
                // Desta manera guardamos valores con llave y valor en los UserDefaults.
                storage.setValue(email, forKey: emailKey)
            } else {
                // Borrar elemento del userDefaults
                storage.removeObject(forKey: emailKey)
            }
            
            performSegue(withIdentifier: "home_segue", sender: nil)
        } else {
            // print("Credenciales Inválidas.")
            showErrorDialog()
        }
    }
    
    private let emailKey = "email-key"
    private let storage = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        
        // De esta manera buscamos un String en los UserDefaults y los asignamos.
        if let storageEmail = storage.string(forKey: emailKey) {
            emailTextField.text = storageEmail
            emailSwitch.isOn = true
        } else {
            emailSwitch.isOn =  false
        }
    }
    private func showErrorDialog() {
        // Prepare the popup assets
        let title = "Error"
        let message = "Credenciales Inválidas"
        let image = UIImage(named: "pexels-photo-103290")

        // Create the dialog
        let popup = PopupDialog(title: title, message: message, image: image)

        // Create buttons
        let buttonOne = CancelButton(title: "CANCEL") {
            print("You canceled the car dialog.")
        }
        /*
        // This button will not the dismiss the dialog
        let buttonTwo = DefaultButton(title: "ADMIRE CAR", dismissOnTap: false) {
            print("What a beauty!")
        }

        let buttonThree = DefaultButton(title: "BUY CAR", height: 60) {
            print("Ah, maybe next time :)")
        }
         */
        // Add buttons to dialog
        // Alternatively, you can use popup.addButton(buttonOne)
        // to add a single button
        // popup.addButtons([buttonOne, buttonTwo, buttonThree])
        popup.addButtons([buttonOne])

        
        // Present dialog
        self.present(popup, animated: true, completion: nil)
    }
}

