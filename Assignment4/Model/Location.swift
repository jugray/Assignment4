//
//  Location.swift
//  Assignment4
//
//  Created by Justin Gray on 11/11/23.
//

import Foundation

struct Location {
    
    var name: String
    var locationQuestion : String
    var locationChoice1 : String
    var locationChoice2 : String
    var locationAnswer : String
    var passed : Bool

    
        init(_ nameIn: String, _ questionIn : String, _ choice1In: String, _ choice2In: String, _ answerIn: String){
        
        name = nameIn
        locationQuestion = questionIn
        locationChoice1 = choice1In
        locationChoice2 = choice2In
        locationAnswer = answerIn
        passed = false
        
    }
    
    func getName() -> String{
        return name
    }
    
    func getQuestion() -> String {
        return locationQuestion
    }
    
    func getChoice1() -> String {
        return locationChoice1
    }
    
    func getChoice2() -> String {
        return locationChoice2
    }
    
    func checkAnswer(_ userAnswer : String) -> Bool{
        return userAnswer == locationAnswer
    }
    
    mutating func setResult(_ resultIn : Bool) {
        passed = resultIn
    }
}
