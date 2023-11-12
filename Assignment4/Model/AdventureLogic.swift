//
//  AdventureLogic.swift
//  Assignment4
//
//  Created by Justin Gray on 11/11/23.
//

import Foundation

struct AdventureLogic {
    
    var adventureScore : Int = 0
    var adventureLocation : Int = 0
    var adventureLocationCount : Int = 0
    var endGameActive = false
    var adventureLocations = [Location]()
    
    var applicantStatus = "Evaluating"
    
    mutating func processSelection(_ answerIn : String, _ gameStatus : Bool){
   
        if !endGameActive {
            if adventureLocations[getCurrentLocation()].checkAnswer(answerIn)  && getCurrentLocation() <= adventureLocations.count - 4{
                
                moveLocation()
                incrementScore(true)
                
            }
            
            else if !adventureLocations[getCurrentLocation()].checkAnswer(answerIn)  && getCurrentLocation() <= adventureLocations.count - 4{
                
                moveLocation()
                incrementScore(false)
            }
        }
        else {
            if adventureLocations[getCurrentLocation()].checkAnswer(answerIn) {
                moveLocation()
                gateCheck() 
            }
            else {
                forceLocation(8)
            }
        }
        
    }
    
    mutating func moveLocation() {
        adventureLocation += 1
    }
    
    mutating func forceLocation(_ indexIn : Int){
        adventureLocation = indexIn
    }
    
    mutating func incrementScore(_ boolIn : Bool) {
        
        if boolIn {
            adventureScore += 1
        }
        else{
            adventureScore -= 1
        }
    }
    
    mutating func setLocations(_ locationsIn : [Location]) {
        self.adventureLocations = locationsIn
    }
        
    mutating func startEndgame(){
        endGameActive = true
    }
    
    mutating func gameOver() {
        endGameActive = false
    }
    
    mutating func endgame(_ answerIn  : String) {
        
        if !endGameActive {
            startEndgame()
        }
               
        processSelection(answerIn, endGameActive)

    }
    
    mutating func gateCheck() {
        if getCurrentLocation() == 5 {
            
            if getAdventureScore() <= 2 {
                applicantStatus = "Terminated"
                forceLocation(0)
                adventureScore = 0
                
            }
            
            else if getAdventureScore() >= 3 && getAdventureScore() < 5 {
                applicantStatus = "Retained"
                forceLocation(0)
                adventureScore = 0

            }
            
            else if getAdventureScore() >= 5 && !endGameActive{
                applicantStatus = "ERROR! - 4,8,15,16,23,42"
                forceLocation(5)
                endGameActive = true
                adventureScore = 0
            }
        }
        else if getCurrentLocation() == 7 {
            applicantStatus = "L O S T"
            adventureScore = 0

        }
    }
    
    
    func getEndGameStatus() -> Bool {
        return endGameActive
    }
    
    func getCurrentLocation() -> Int{
        return adventureLocation
    }
    
    func getAdventureScore() -> Int{
        return adventureScore
    }
    
    
    
    
    mutating func createStations() -> [Location] {
        
        //Establish questions
        
        let HydraQuestion = "You have been assigned to the Hydra Station. One of the Polar Bears is ignoring the food puzzle, what do you do?"
        
        let SwanQuestion = "We have decided to reassign you based on your work at Hydra. Upon arrival at the Swan station, you MUST enter the code every 108 minutes."
        
        let FlameQuestion = "You have successfully completed your rotation at Swan station. Please report any relevant scientific news from the outside world during your time at the Flame."
        
        let PearlQuestion = "Welcome to the Pearl. Here you will record your observations on other members of the Dharma Initiative.  Be sure to place your notebook in the vacuum tube when you are finished."
        
        let OrchidQuestion = "Your next assignement will be the Orchid. Please keep a close eye on the plants...and nothing else."
        
        let SecretTunnelQuestion = "RESTRICTED AREA - MAGNETIC ANONOMLY"
        
        let WheelRoomQuestion = "There appears to be a wheel embeded into a wall..."
        
        let LOST = "You moved the Island."
        
        //EstablishOptions
        let HydraOption1 = "Notify supervisor"
        let HydraOption2 = "Enter the cage"
        
        let SwanOption1 =  "4,8,15,16,23,42 -> Execute"
        let SwanOption2 = "Do nothing"
        
        let FlameOption1 = "Jan 22, 1970"
        let FlameOption2 = "April 11, 1970"
        
        let PearlOption1 = "Report nothing"
        let PearlOption2 = "Report on Swan Station"
        
        let OrchidOption1 = "Tend to plants"
        let OrchidOption2 = "Inspect hatch"
        
        let SecretOption1 = "Turn Back"
        let SecretOption2 = "...Continue"
        
        let SecretOption3 = "Turn the wheel"
        let SecretOption4 = "Turn Back"
        
        let gameOver = "Put it back!"
        let gameOver2 = "4,8,15,16,23,42"
        
        //Create location objects
        
        let hydra = Location("Hydra", HydraQuestion, HydraOption1, HydraOption2, HydraOption1)
        let swan = Location("Swan", SwanQuestion, SwanOption1, SwanOption2, SwanOption1)
        let flame = Location("Flame", FlameQuestion, FlameOption1, FlameOption2, FlameOption2)
        let pearl = Location("Pearl", PearlQuestion, PearlOption1, PearlOption2, PearlOption1)
        let orchid = Location("Orchid", OrchidQuestion, OrchidOption1, OrchidOption2, OrchidOption2)
        let SecretTunnel = Location("SecretTunnel", SecretTunnelQuestion, SecretOption1, SecretOption2, SecretOption2)
        let WheelRoom = Location("WheelRoom", WheelRoomQuestion, SecretOption3, SecretOption4, SecretOption3)
        let IslandLost = Location("IslandLost", LOST, gameOver, gameOver2, gameOver)
        
        let locationArray = [hydra, swan, flame, pearl, orchid, SecretTunnel, WheelRoom, IslandLost]
        
        adventureLocations = locationArray
        //Location array
        return locationArray
    }
}
