//
//  Schedule.swift
//  CapProject
//
//  Created by Yves Songolo on 8/21/17.
//  Copyright © 2017 Yveslym. All rights reserved.
//

import Foundation

struct Schedule{
    var dateOfFirstDay: NSDate?
    var dateOfLastDay: NSDate?
    var startTime: NSDate?
    var endTime: NSDate?
    var Days:DayOfCourses?
    
}
struct DayOfCourses {
    var monday: Bool? = false
    var tuesday:Bool? = false
    var wednesday:Bool? = false
    var thursday:Bool? = false
    var friday:Bool? = false
    var saturday:Bool? = false
    var sunday:Bool? = false
}

