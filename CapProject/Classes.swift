//
//  Classes.swift
//  CapProject
//Classes.swift contain class and attendance which will be use by student
//
//
//  Created by Yves Songolo on 8/8/17.
//  Copyright © 2017 Yveslym. All rights reserved.
//

import Foundation
class Classes: NSObject{
    
    var course = Course()
    var attendance = [Attendance]()
   // Add list of post
    
//    //==> Mark Getter
//    func getCourse()->Course{return self.course}
//    
//    func getAttendance()->Attendance{return self.attendance}
//    
//    //==> Mark Setter
//    
//    func setCourse(withCourse course: Course){
//        self.course = course
//    }
//
//    func setAttendance(withAttendaance attendance: Attendance){
//        self.attendance = attendance
//    }
    
    init (withCourse course: Course, attendance: Attendance){
        self.course = course
        self.attendance.append(attendance)
    }
}
