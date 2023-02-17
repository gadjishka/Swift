//
//  ViewController.swift
//  BurKozel
//
//  Created by Гаджи Герейакаев on 16.02.2023.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var playerOneName: UILabel!
    @IBOutlet weak var playerTwoName: UILabel!
    @IBOutlet weak var playerThreeName: UILabel!
    @IBOutlet weak var playerFourName: UILabel!
    
    @IBOutlet weak var playerOneScore: UILabel!
    @IBOutlet weak var playerOneText: UITextField!
    
    @IBOutlet weak var playerTwoScore: UILabel!
    @IBOutlet weak var playerTwoText: UITextField!
    
    @IBOutlet weak var playerThreeScore: UILabel!
    @IBOutlet weak var playerThreeText: UITextField!
    
    @IBOutlet weak var playerFourScore: UILabel!
    @IBOutlet weak var playerFourText: UITextField!
    
    @IBOutlet weak var winnerLabel: UILabel!
    
    @IBOutlet weak var loserLabel: UILabel!
    
    var playerOneVar: String!
    var playerTwoVar: String!
    var playerThreeVar: String!
    var playerFourVar: String!
    var isGameOver: Bool = false
    var lead: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        winnerLabel.isHidden = true
        loserLabel.isHidden = true
        playerOneName.text = "\(playerOneVar ?? "")"
        playerTwoName.text = "\(playerTwoVar ?? "")"
        playerThreeName.text = "\(playerThreeVar ?? "")"
        playerFourName.text = "\(playerFourVar ?? "")"
        // Do any additional setup after loading the view.
    }

    @IBAction func resultButton() {
        guard let firstText = playerOneText.text, let secondText = playerTwoText.text,
              let thirdText = playerThreeText.text, let fourthText = playerFourText.text else {return}
        
        if isGameOver {
                showAlert(title: "Игра закончена",
                          message: "\(lead ?? "Тась"), может начнешь заново?")
            return
        }
        
        if firstText.isEmpty || secondText.isEmpty || thirdText.isEmpty || fourthText.isEmpty {
            showAlert(title: "Не заполнено",
                      message: "\(lead ?? "Тась"), может все заполнишь?")
            return
        }
        
        
        var playerOne = (Int(playerOneScore.text!)!)
        playerOne += (Int(playerOneText.text!)!)
        playerOneScore.text = String(playerOne)
        
        var playerTwo = (Int(playerTwoScore.text!)!)
        playerTwo += (Int(playerTwoText.text!)!)
        playerTwoScore.text = String(playerTwo)
        
        var playerThree = (Int(playerThreeScore.text!)!)
        playerThree += (Int(playerThreeText.text!)!)
        playerThreeScore.text = String(playerThree)
        
        var playerFour = (Int(playerFourScore.text!)!)
        playerFour += (Int(playerFourText.text!)!)
        playerFourScore.text = String(playerFour)
        
        playerOneText.text = ""
        playerTwoText.text = ""
        playerThreeText.text = ""
        playerFourText.text = ""
        
        exLooser ()
        
    }
    
    @IBAction func againButton() {
        repeatGame()
    }
    
    private func exLooser() {
        if Int(playerOneScore.text!)! >= 31 {
            loserLabel.isHidden = false
            loserLabel.text = "\(playerOneVar ?? "") Проиграл!"
            isGameOver = true
        }
        if Int(playerTwoScore.text!)! >= 31 {
            loserLabel.isHidden = false
            loserLabel.text = "\(playerTwoVar ?? "") Проиграла!"
            isGameOver = true
        }
        if Int(playerThreeScore.text!)! >= 31 {
            loserLabel.isHidden = false
            loserLabel.text = "\(playerThreeVar ?? "") Проиграл!"
            isGameOver = true
        }
        if Int(playerFourScore.text!)! >= 31 {
            loserLabel.isHidden = false
            loserLabel.text = "\(playerFourVar ?? "") Проиграла!"
            isGameOver = true
        }
    }
    
    private func repeatGame() {
        playerOneScore.text = "0"
        playerTwoScore.text = "0"
        playerThreeScore.text = "0"
        playerFourScore.text = "0"
        winnerLabel.isHidden = true
        loserLabel.isHidden = true
    }
    
}

extension ViewController {
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

extension ViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == playerOneText {
            playerTwoText.becomeFirstResponder()
        }
        else if textField == playerTwoText {
            playerThreeText.becomeFirstResponder()
        }
        else if textField == playerThreeText {
            playerFourText.becomeFirstResponder()
        }
        else {
            resultButton()
        }
        return true
    }
}
