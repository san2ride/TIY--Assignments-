//
//  APIController.swift
//  TopTracksApp
//
//  Created by Phil Wright on 6/20/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

import UIKit

class APIController: NSObject
{
    
    func fetchGithubuser(username: String) {
        
        let urlString = "https://api.github.com/users/\(username)"
        
        if let url = NSURL(string: urlString) {
            
            let session = NSURLSession.sharedSession()
            
            let task = session.dataTaskWithURL(url, completionHandler: {
                (data, response, error) in
                
                if error != nil {
                    print(error?.localizedDescription)
                    return
                }
                
                if let data = data {
                    
                    
                    if let jsonDictionary = self.parseJSON(data) {
                        
                        print(jsonDictionary)
                        
                    } else {
                        print("cant parse the jsonDictionary")
                    }
                
                    
                }
                
            })
            task.resume()
            
            
        }
    }
    

    
    
    // This method allows us to send some NSData and get back a JSONDictionary
    
    func parseJSON(data: NSData?) -> JSONDictionary? {
        
        var theDictionary : JSONDictionary? = nil
        
        if let data = data {
            do {
                
                if let jsonDictionary = try NSJSONSerialization.JSONObjectWithData(data, options: []) as? JSONDictionary {
                    
                    
                    theDictionary = jsonDictionary
                    
                    //print(jsonDictionary)
                    
                    
                } else {
                    print("Could not parse jsonDictionary")
                }
                
            } catch {
                
            }
            
            
        } else {
            print("Could not unwrap data")
        }
        
        return theDictionary
    }

}
