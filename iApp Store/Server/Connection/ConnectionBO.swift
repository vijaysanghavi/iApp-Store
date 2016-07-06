//
//  ConnectionBO.swift
//  iApp Store
//
//  Created by VJ on 7/5/16.
//  Copyright © 2016 Grability. All rights reserved.
//

import Foundation

class ConnectionBO: NSObject , ConnectionAPI {
    
    func getResponseFromURL(url: String) {
        let url = NSURL(string: url)
        let session = NSURLSession.sharedSession()
        
        session.dataTaskWithURL(url!) { (data, response, error) in
            print("data \(data) response \(response) error \(error)")
        }
    }
    
}