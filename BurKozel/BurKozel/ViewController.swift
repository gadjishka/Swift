//
//  ViewController.swift
//  BurKozel
//
//  Created by Гаджи Герейакаев on 16.02.2023.
//

import UIKit

class ViewController: UIViewController {

  
    @IBOutlet weak var gadjiLastScore: UILabel!
    @IBOutlet weak var gadjiCurScore: UILabel!
    @IBOutlet weak var gadjiText: UITextField!
    
    @IBOutlet weak var tasyaLastScore: UILabel!
    @IBOutlet weak var tasyaCurScore: UILabel!
    @IBOutlet weak var tasyaText: UITextField!
    
    @IBOutlet weak var sergayLastScore: UILabel!
    @IBOutlet weak var sergayCurScore: UILabel!
    @IBOutlet weak var sergayText: UITextField!
    
    @IBOutlet weak var natashaLastScore: UILabel!
    @IBOutlet weak var natashaCurScore: UILabel!
    @IBOutlet weak var natashaText: UITextField!
    
    @IBOutlet weak var winnerLabel: UILabel!
    
    @IBOutlet weak var loserLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        winnerLabel.isHidden = true
        loserLabel.isHidden = true
        // Do any additional setup after loading the view.
    }

    func endGame() {
        gadjiLastScore.text = "0"
        gadjiCurScore.text = "0"
        tasyaLastScore.text = "0"
        tasyaCurScore.text = "0"
        sergayLastScore.text = "0"
        sergayCurScore.text = "0"
        natashaLastScore.text = "0"
        natashaCurScore.text = "0"
    }
    
    @IBAction func resultButton() {
        gadjiLastScore.text = gadjiCurScore.text
        tasyaLastScore.text = tasyaCurScore.text
        sergayLastScore.text = sergayCurScore.text
        natashaLastScore.text = natashaCurScore.text
        
        var gadji = (Int(gadjiCurScore.text!)!)
        gadji += (Int(gadjiText.text!)!)
        gadjiCurScore.text = String(gadji)
        
        var tasya = (Int(tasyaCurScore.text!)!)
        tasya += (Int(tasyaText.text!)!)
        tasyaCurScore.text = String(tasya)
        
        var sergay = (Int(sergayCurScore.text!)!)
        sergay += (Int(sergayText.text!)!)
        sergayCurScore.text = String(sergay)
        
        var natasha = (Int(natashaCurScore.text!)!)
        natasha += (Int(natashaText.text!)!)
        natashaCurScore.text = String(natasha)
        
        gadjiText.text = ""
        tasyaText.text = ""
        sergayText.text = ""
        natashaText.text = ""
        
        if Int(gadjiCurScore.text!)! >= 31 {
            loserLabel.isHidden = false
            loserLabel.text = "Гаджи Проиграл!"
        }
        if Int(tasyaCurScore.text!)! >= 31 {
            loserLabel.isHidden = false
            loserLabel.text = "Тася Проиграла!"
        }
        if Int(sergayCurScore.text!)! >= 31 {
            loserLabel.isHidden = false
            loserLabel.text = "Сергей Проиграл!"
        }
        if Int(natashaCurScore.text!)! >= 31 {
            loserLabel.isHidden = false
            loserLabel.text = "Наташа Проиграла!"
        }
        
        
    }
    
    @IBAction func againButton() {
        endGame()
    }
    
}

extension ViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == gadjiText {
            tasyaText.becomeFirstResponder()
        }
        else if textField == tasyaText {
            sergayText.becomeFirstResponder()
        }
        else if textField == sergayText {
            natashaText.becomeFirstResponder()
        }
        else {
            resultButton()
        }
        return true
    }
}
