//
//  ViewController.swift
//  Assignment4
//
//  Created by Justin Gray on 11/11/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var applicantStatusLabel: UILabel!
    
    var locations = [Location]()
    var adventureLogic = AdventureLogic()
   
    var applicantStatus : String = "Evaluating"
    var endGameActive = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       locations = adventureLogic.createStations()
        
        updateUI(0)
    }
    
    
    @IBAction func choiceSelection(_ sender: UIButton) {
        
        let userAnswer = sender.titleLabel!.text!
        
        if adventureLogic.endGameActive{
            adventureLogic.endgame(userAnswer)
            updateUI(adventureLogic.getCurrentLocation())
            
            return
            
        }
        
        adventureLogic.processSelection(userAnswer, adventureLogic.endGameActive)
        adventureLogic.gateCheck()
    
        updateUI(adventureLogic.getCurrentLocation())

    }
    

    func resetUI() {
        adventureLogic.gameOver()
        adventureLogic.applicantStatus = "Evaluating"
        applicantStatusLabel.textColor = .black
        view.backgroundColor = .white
        
        adventureLogic.forceLocation(0)
        
    }
    
  
    @objc func updateUI(_ indexIn : Int) {
        
        var indexIn = indexIn
        
        if indexIn == 8 {
            resetUI()
            indexIn = 0
        }
        
        questionLabel.text = locations[indexIn].getQuestion()
        button1.setTitle(locations[indexIn].getChoice1(), for: .normal)
        button2.setTitle(locations[indexIn].getChoice2(), for: .normal)
        applicantStatusLabel.text =  "Applicant Status: \(adventureLogic.applicantStatus)"
        
        switch adventureLogic.applicantStatus {
            case "Terminated":
                view.backgroundColor = .systemRed
                break
            case "Retained":
                view.backgroundColor = .systemGreen
                break
            case "ERROR! - 4,8,15,16,23,42":
                view.backgroundColor = .systemPurple
                applicantStatusLabel.textColor = .systemRed
                break
            case "L O S T":
                view.backgroundColor = .systemYellow
            default:
                view.backgroundColor = .white
                
                
        }
        
    }

}



