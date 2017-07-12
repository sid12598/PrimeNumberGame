//
//  Question.swift
//  PrimeNumberGame
//
//  Created by Siddharth Poduval on 12/07/17.
//  Copyright © 2017 Siddharth Poduval. All rights reserved.
//

import Foundation

class Question {
    
    var number = Int(arc4random_uniform(100))
    
    func answer() -> Bool {
        var i = 2
        while i < number/2 {
            if number%i==0 {
                return false
            }
            i+=1
        }
        return true
    }
}
