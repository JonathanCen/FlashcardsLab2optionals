//
//  ViewController.swift
//  Flashcards(redone)
//
//  Created by Jonathan Cen on 10/27/18.
//  Copyright © 2018 Jonathan Cen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var backLabel: UILabel!
    @IBOutlet weak var frontLabel: UILabel!
    @IBOutlet weak var card: UIView!
    
    @IBOutlet weak var btnOptionOne: UIButton!
    
    @IBOutlet weak var BtnOptionTwo: UIButton!
    
    @IBOutlet weak var BtnOptionThree: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        card.layer.cornerRadius = 20.0
        frontLabel.layer.cornerRadius = 20.0
        backLabel.layer.cornerRadius = 20.0
        
        card.layer.shadowRadius = 15.0
        card.layer.shadowOpacity = 0.2
        
        frontLabel.clipsToBounds = true
        backLabel.clipsToBounds = true
        
        btnOptionOne.layer.borderWidth = 3.0
        btnOptionOne.layer.cornerRadius = 20.0
        btnOptionOne.layer.borderColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        
        BtnOptionTwo.layer.borderWidth = 3.0
        BtnOptionTwo.layer.cornerRadius = 20.0
        BtnOptionTwo.layer.borderColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        
        BtnOptionThree.layer.borderWidth = 3.0
        BtnOptionThree.layer.cornerRadius = 20.0
        BtnOptionThree.layer.borderColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func didTapOnFlashCard(_ sender: Any) {
        
        if frontLabel.isHidden {
            frontLabel.isHidden = false
        }
        else {
            frontLabel.isHidden = true
        }
    }
    @IBAction func didTapOnBtnOne(_ sender: Any) {
        btnOptionOne.isHidden = true
    }
    
    @IBAction func didTapOnBtnTwo(_ sender: Any) {
        frontLabel.isHidden = true
    }
    @IBAction func didTapOnBtnThree(_ sender: Any) {
        BtnOptionThree.isHidden = true
    }
}

