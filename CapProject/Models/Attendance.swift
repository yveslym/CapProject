//
//  Attendance.swift
//  CapProject
//
//  Created by Yves Songolo on 8/8/17.
//  Copyright © 2017 Yveslym. All rights reserved.
//

import Foundation
class Attendance: NSObject{
    
    private var date: Date?
    private var present: Bool?
    private var late: Bool?
    private var absent: Bool?
    private var startTime: String?
    private var endTime: String?
    
    func marckPresent(){return self.present = true}

    func markLate(){return self.late        = true}

    func markAbsent(){return self.absent    = true}
    
    override init(){
        self.absent  = false
        self.present = false
        self.late    = false
    }
    
<<<<<<< HEAD
    init?(snapshot: DataSnapshot) {
        
        guard let dict = snapshot.value as? [String: Any]
            
            else{return nil}
        let attendance = dict[Constants.attendance] as? Attendance
        
        self.AttendanceID = (attendance?.AttendanceID)!
        
        // add the time condition, if student scan in certain time he will be mark present or late
        self.present = true
    }
=======
>>>>>>> parent of 955b75c... about to split qr code with vc
}
