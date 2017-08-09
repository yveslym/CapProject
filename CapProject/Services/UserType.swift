//
//  UserType.swift
//  CapProject
//
//  Created by Yves Songolo on 8/3/17.
//  Copyright © 2017 Yveslym. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase
import Firebase

/// UsersType is use to save either teacher or student data before archiving tpo persist user. before archiving,  we set to true the corresponding user type we want to archive, and when unarchiving we check wich user was archiving
class UsersType{
    
    var student: Student?
    var teacher: Teacher?
    private var ArchiveStudent: Bool?
    private var ArchiveTeacher: Bool?
   // var studentType: String?
   // let teacherType: String?
    
    
    init (){
        self.teacher   = nil
        self.student   = nil
        self.ArchiveTeacher = false
        self.ArchiveStudent = false
        
    }
    
    func isStudentArchived()->Bool{
        
        var arcStd = false
        if ArchiveStudent == true{
            arcStd = true
        }
        return arcStd
    }
    
    func isTeacherArchived()->Bool{
        var arctch = false
        if ArchiveTeacher == true{
        arctch     = true
        }
        return arctch
    }
    
    
     func saveStudent (withStudent student: Student, archivethisStudent: Bool = false){
        
        if archivethisStudent == true{
            
            self.teacher   = nil
            self.student   = student
            ArchiveTeacher = true
            ArchiveStudent = false
        }
    }
    
    func saveTeacher (withTeacher teacher: Teacher, archiveThisTeacher: Bool = false) {
        
        if archiveThisTeacher == true{
        self.teacher   = teacher
        self.student   = nil
        ArchiveTeacher = true
        ArchiveStudent = false
        }
        
    }

    func getStudent()-> Student{
        return self.student!
    }
    
    func getTeacher()->Teacher{
        return self.teacher!
    }
    




}
























