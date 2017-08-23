//
//  Helpers.swift
//  CapProject
//
//  Created by Yves Songolo on 8/3/17.
//  Copyright © 2017 Yveslym. All rights reserved.
//

import Foundation

class Helpers{
    
    
    //function to check if the domain of email is edu
    static func checkEmailEdu(forEmail email: String)-> Bool{
        var correct: Bool = false
        
        if email.hasSuffix(".edu"){
            correct = true
            return correct
        }
        return correct
    }
}
