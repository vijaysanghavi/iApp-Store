//
//  CommonUtils.swift
//  iApp Store
//
//  Created by VJ on 06/07/16.
//  Copyright © 2016 Grability. All rights reserved.
//

import Foundation

class CommonUtils: NSObject {
    
    
    /**
     To validate a condition and throw error if condition is true
     - Parameter message: The message for the the error
     - Parameter domainName: The domainName for the the error, default is **Error**
     - Parameter errorCode: The errorCode for the the error, default is **0**
     */
    static func assertError(isError: Bool, message: String, domainName : String = "Error", errorCode:Int = 0) {
        if(!isError){
            self.throwErrorWithMessage(message, domainName: domainName, errorCode: errorCode)
        }
    }
    
    /**
     To generate and throw error
     - Parameter isError: If true will raise an NSException else return and NSError from the message provided
     - Parameter message: The message for the the error
     - Parameter domainName: The domainName for the the error, default is **Error**
     - Parameter errorCode: The errorCode for the the error, default is **0**
     */
     static func throwErrorWithMessage(message: String, domainName : String = "Error", errorCode:Int = 0) -> NSError? {
        let err : NSError = NSError(domain: domainName, code: errorCode, userInfo: [NSLocalizedDescriptionKey:message])
        NSException.raise(err.domain, format:message, arguments: getVaList([err]))
        return err
    }

}