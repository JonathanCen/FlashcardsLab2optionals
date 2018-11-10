//
//  CreationViewController.swift
//  Flashcards(redone)
//
//  Created by Jonathan Cen on 10/27/18.
//  Copyright © 2018 Jonathan Cen. All rights reserved.
//

import UIKit

class CreationViewController: UIViewController {
    
    var flashcardsController: ViewController!

    @IBOutlet weak var questionTextField: UITextField!
    @IBOutlet weak var answerTextField: UITextField!
    
    @IBOutlet weak var extraanswer1: UITextField!
    @IBOutlet weak var extraanswer2: UITextField!
    
    var initialQuestion: String?
    var initialAnswer: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        questionTextField.text = initialQuestion
        answerTextField.text = initialAnswer
    }
    
    @IBAction func didTapOnCancel(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func didTapOnDone(_ sender: Any) {
        
        //Get the text in the question text field
        let questionText = questionTextField.text
        
        //Get the text in the answer text field
        let answerText = answerTextField.text
        
        let extraAnswerOne = extraanswer1.text
        
        let extraAnswerTwo = extraanswer2.text
        
        
        let alert = UIAlertController(title: "Missing text", message: "You need to enter both a question and an answer", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default)
        
        alert.addAction(okAction)
        
        //Call the function to update the flashcard
        //flashcardsController.updateFlashcard(question: questionText!, answer: answerText!)
        
        if questionText == nil || answerText == nil || questionText!.isEmpty || answerText!.isEmpty {
            present(alert, animated: true)
        }
        else{
            flashcardsController.updateFlashcard(question: questionText!, answer: answerText!, extraAnswerOne: extraAnswerOne!, extraAnswerTwo: extraAnswerTwo!)
        }
        
        flashcardsController.frontLabel.isHidden = false
        flashcardsController.btnOptionOne.isHidden = false
        flashcardsController.BtnOptionTwo.isHidden = false
        flashcardsController.BtnOptionThree.isHidden = false
    
        //DIsmiss
        dismiss(animated: true)
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
