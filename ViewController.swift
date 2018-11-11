//
//  ViewController.swift
//  Flashcards(redone)
//
//  Created by Jonathan Cen on 10/27/18.
//  Copyright © 2018 Jonathan Cen. All rights reserved.
//

import UIKit

struct Flashcard {
    var question: String
    var answer: String
}

class ViewController: UIViewController {

    @IBOutlet weak var backLabel: UILabel!
    @IBOutlet weak var frontLabel: UILabel!
    @IBOutlet weak var card: UIView!
    
    @IBOutlet weak var btnOptionOne: UIButton!
    
    @IBOutlet weak var BtnOptionTwo: UIButton!
    
    @IBOutlet weak var BtnOptionThree: UIButton!

    @IBOutlet weak var prevButton: UIButton!
    
    @IBOutlet weak var nextButton: UIButton!
    
    // Array to hold our flashcards
    var flashcards = [Flashcard]()
    
    // Current flashcard index
    var currentIndex = 0
    
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
        
        updateFlashcard(question: "What's the captial of Brazil?", answer: "Brasilia", extraAnswerOne: "Rio de Janeiro", extraAnswerTwo: "Sao Paulo")
        
        // Read saved flashcards
        readSavedFlashcards()
        
        // Adding our inital flashcard if needed
        if flashcards.count == 0 {
            updateFlashcard(question: "What's the captial of Brazil?", answer: "Brasillia", extraAnswerOne: "Rio de Janeiro", extraAnswerTwo: "Sao Paulo")
            
        }
        else{
            updateLabel()
            updateNextPrevButtons()
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //We know the destination of the segue is the Navigation Controller
        let navigationController = segue.destination as! UINavigationController
        
        //We know the Navigation COntroller only contains a Creation View Controller
        let creationController = navigationController.topViewController as! CreationViewController
        
        //We set the flashcardsController property to self
        creationController.flashcardsController = self
        
        
        if segue.identifier == "EditSegue"{
            creationController.initialQuestion = frontLabel.text
            creationController.initialAnswer = backLabel.text
        }
        
        
    }

    @IBAction func didTapOnFlashCard(_ sender: Any) {
        
        if frontLabel.isHidden {
            frontLabel.isHidden = false
        }
        else {
            frontLabel.isHidden = true
        }
    }
    
    func updateFlashcard(question: String, answer: String, extraAnswerOne: String?, extraAnswerTwo: String?) {
        let flashcard = Flashcard(question: question, answer: answer)
        
        frontLabel.text = flashcard.question
        backLabel.text = flashcard.answer
        
        flashcards.append(flashcard)
        
        // Logging to the console
        print("😎 Added new flashcard")
        print("😎 We now have \(flashcards.count) flaschards")
        
        // Update current index
        currentIndex = flashcards.count - 1
        print("😎 Our current index is \(currentIndex)")
        
        // Update buttons
        updateNextPrevButtons()
        
        //Update labels
        updateLabel()
        
        frontLabel.text = question
        backLabel.text = answer
        btnOptionOne.setTitle(extraAnswerOne, for: .normal)
        BtnOptionTwo.setTitle(answer, for: .normal)
        BtnOptionThree.setTitle(extraAnswerTwo, for: .normal)
    }
    
    func updateNextPrevButtons() {
        
        // Disable next button if at the end
        if currentIndex == flashcards.count - 1 {
            nextButton.isEnabled = false
        }
        else{
            nextButton.isEnabled = true
        }
        
        // Disable prev button if at the beginning
        if currentIndex == 0 {
            prevButton.isEnabled = false
        }
        else{
            prevButton.isEnabled = true
        }
    }
    
    @IBAction func didTapOnPrev(_ sender: Any) {
        
        //Decrease current index
        currentIndex = currentIndex - 1
        
        // Update labels
        updateLabel()
        
        // Update buttons
        updateNextPrevButtons()
    }
    
    @IBAction func didTapOnNext(_ sender: Any) {
        //Increase current index
        currentIndex = currentIndex + 1
        
        // Update labels
        updateLabel()
        
        // Update buttons
        updateNextPrevButtons()
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
    
    func updateLabel() {
        
        //Get current flashcard
        let currentFlaschard = flashcards[currentIndex]
        
        //Update labels
        frontLabel.text = currentFlaschard.question
        backLabel.text = currentFlaschard.answer
    }
    
    func saveAllFlashcardsToDisk(){
        
        // From flashcard array to dictionary arrary
        let dictionaryArray = flashcards.map {(card) -> [String: String] in return ["question": card.question, "answer": card.answer]
        }
        
        //Save array on disk using UserDefaults
        UserDefaults.standard.set(flashcards, forKey: "flashcards")
        //Log it
        print(" Flashcards saved to UserDefaults")
    }
    
    func  readSavedFlashcards(){
        // read dictionary array from disk (if any)
        if let dictionaryArrary = UserDefaults.standard.array(forKey: "flashcards") as? [[String: String]]{
            
            // In here we know for sure we have a dictionary arrary
            let savedCards = dictionaryArrary.map { dictionary -> Flashcard in return Flashcard(question: dictionary["question"]!, answer: dictionary["answer"]!)
            }
            
            // Put all these cards in our flashcards arrary
            flashcards.append(contentsOf: savedCards)
        }
    }
}

