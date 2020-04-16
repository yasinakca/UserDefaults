//
//  ViewController.swift
//  UserDefaultsApp
//
//  Created by YASIN AKCA on 16.04.2020.
//  Copyright © 2020 YASIN AKCA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var idTextField: UITextField!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedId = UserDefaults.standard.object(forKey: "id")
        
        if let newName = storedName as? String {
            self.nameLabel.text = "Name: \(newName) "
        }
        
        if let newId = storedId as? String {
            self.idLabel.text = "Id: \(newId)"
        }
    }

    @IBAction func saveClicked(_ sender: Any) {
        UserDefaults.standard.set(nameTextField.text!, forKey: "name")
        UserDefaults.standard.set(idTextField.text!, forKey: "id")
        
        nameLabel.text = "Name \(nameTextField.text!)"
        idLabel.text = "Id: \(idTextField.text!)"
    }
    
    @IBAction func deleteClicked(_ sender: Any) {
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedId = UserDefaults.standard.object(forKey: "id")
        
        if (storedName as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "name")
            self.nameLabel.text = "Name: "
        }
        
        if (storedId as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "id")
            self.idLabel.text = "Id: "
        }
    }
}

