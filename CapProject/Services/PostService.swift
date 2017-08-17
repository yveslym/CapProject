//
//  PostService.swift
//  CapProject
//
//  Created by Yves Songolo on 8/11/17.
//  Copyright © 2017 Yveslym. All rights reserved.
//

import Foundation
import Firebase

struct PostService {
    
    /// Function to creare an alert
    ///
    /// - Parameters: Post
    ///   - post: post contain: teacher name, post description, date of post
    ///   - completion: completion return Post added in the database
    static func createAlertPost(withPost post: Post!, completion: @escaping (Post?)->Void){
        
        if let newPost = post {
            
            let postref = NetworkConstant.alertPosttRef.childByAutoId()
            newPost.postID = postref.key
            
            
            let postAttr = ["teacher last name:":newPost.teacherLastName!, "ID": newPost.postID!,"Descrition":newPost.postDescrition!," date ": newPost.date!] as [String : Any]
            
            postref.setValue(postAttr)
            
            completion(newPost)
        }
        else{
            completion(nil)
        }
    }
   
    static func retrieveAlertPost(withPostKey key: String, completion: @escaping (Post?)->Void){
        let ref = NetworkConstant.alertPosttRef.child(key)
        
        ref.observeSingleEvent(of: .value, with: {(snapshot) in
            
            guard let post = Post(snapshot: snapshot)
                else{
                    return completion (nil)
            }
            completion (post)
        })
    }
    
}
























