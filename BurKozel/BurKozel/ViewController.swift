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
        var loser = max(Int(playerOneScore.text!)!, max(Int(playerTwoScore.text!)!,
                                                        max(Int(playerThreeScore.text!)!, Int(playerFourScore.text!)!)))
        loserLabel.isHidden = false
        
        switch loser {
        case Int(playerOneScore.text!)!:
            loserLabel.text = "\(playerOneVar ?? "") Проиграл(a)!"
        case Int(playerTwoScore.text!)!:
            loserLabel.text = "\(playerTwoVar ?? "") Проиграл(a)!"
        case Int(playerThreeScore.text!)!:
            loserLabel.text = "\(playerThreeVar ?? "") Проиграл(a)!"
        case Int(playerFourScore.text!)!:
            loserLabel.text = "\(playerFourVar ?? "") Проиграл(a)!"
        default:
            loserLabel.text = "Хз кто Проиграл!"
        }
        
        var winner = min(Int(playerOneScore.text!)!, min(Int(playerTwoScore.text!)!,
                                                        min(Int(playerThreeScore.text!)!, Int(playerFourScore.text!)!)))
        winnerLabel.isHidden = false
        
        switch winner {
        case Int(playerOneScore.text!)!:
            winnerLabel.text = "\(playerOneVar ?? "")  Выиграл(a)!"
        case Int(playerTwoScore.text!)!:
            winnerLabel.text = "\(playerTwoVar ?? "") Выиграл(a)!"
        case Int(playerThreeScore.text!)!:
            winnerLabel.text = "\(playerThreeVar ?? "") Выиграл(a)!"
        case Int(playerFourScore.text!)!:
            winnerLabel.text = "\(playerFourVar ?? "") Выиграл(a)!"
        default:
            winnerLabel.text = "Хз кто Выиграл!"
        }
        
        isGameOver = true
    }
    
    
    
    private func repeatGame() {
        playerOneScore.text = "0"
        playerTwoScore.text = "0"
        playerThreeScore.text = "0"
        playerFourScore.text = "0"
        winnerLabel.isHidden = true
        loserLabel.isHidden = true
        isGameOver = false
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
