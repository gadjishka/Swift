//
//  ViewController.swift
//  Tasya
//
//  Created by Гаджи Герейакаев on 14.02.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelTasya: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonTapped() {
        labelTasya.textColor = .red
        labelTasya.font = UIFont(name: "Zapfino", size: 35.0)
        labelTasya.text = "Люблю тебя солнышко"
    }
    
}

