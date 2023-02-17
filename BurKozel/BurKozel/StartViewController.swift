//
//  StartViewController.swift
//  BurKozel
//
//  Created by Гаджи Герейакаев on 17.02.2023.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet weak var playerOneTextField: UITextField!
    @IBOutlet weak var playerTwoTextField: UITextField!
    @IBOutlet weak var playerThreeTextField: UITextField!
    @IBOutlet weak var playerFourTextField: UITextField!
    
    @IBOutlet weak var leadTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? ViewController {
            destinationVC.playerOneVar = playerOneTextField.text
            destinationVC.playerTwoVar = playerTwoTextField.text
            destinationVC.playerThreeVar = playerThreeTextField.text
            destinationVC.playerFourVar = playerFourTextField.text
            if leadTextField.text == "1" {
                destinationVC.lead = playerOneTextField.text
            }
            else if leadTextField.text == "2" {
                destinationVC.lead = playerTwoTextField.text
            }
            else if leadTextField.text == "3" {
                destinationVC.lead = playerThreeTextField.text
            }
            else if leadTextField.text == "4" {
                destinationVC.lead = playerFourTextField.text
            }
            
        }
        
    }
    
    @IBAction func startGameButton() {
        performSegue(withIdentifier: "startGame", sender: nil)
    }
    
}

extension StartViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == playerOneTextField {
            playerTwoTextField.becomeFirstResponder()
        }
        else if textField == playerTwoTextField {
            playerThreeTextField.becomeFirstResponder()
        }
        else if textField == playerThreeTextField {
            playerFourTextField.becomeFirstResponder()
        }
        else if textField == playerFourTextField {
            leadTextField.becomeFirstResponder()
        }
        else {
            startGameButton()
        }
        return true
    }
}
