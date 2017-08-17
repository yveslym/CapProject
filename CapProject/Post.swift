//
//  Post.swift
//  CapProject
//
//  Created by Yves Songolo on 8/8/17.
//  Copyright © 2017 Yveslym. All rights reserved.
//

import Foundation
import UIKit
import Firebase
class Post: NSObject{
    
    var teacherLastName : String?
    var postDescrition: String?
    var url: String?
    var teacherPicture: UIImage?
    var date: Date?
    var postID:String?
    
    override init (){
        self.date = Date()
        self.postDescrition = ""
        self.url = ""
        self.teacherPicture = UIImage()
        self.teacherLastName = ""
        self.postID = ""
    }
    
    init?(snapshot: DataSnapshot) {
        
        guard let dict = snapshot.value as? [String: Any]
            
            else{return nil}
        
        let post = dict["info"] as? Post
        self.date = post?.date
        self.postDescrition = post?.postDescrition
        self.teacherLastName = post?.teacherLastName
        self.postID = post?.postID
        self.teacherPicture = UIImage()

    }
}









