//
//  ServiceLocator.swift
//  iApp Store
//
//  Created by VJ on 7/06/16.
//  Copyright © 2016 Cogitate. All rights reserved.
//

import Foundation

public class ServiceLocator : NSObject {
    
    static var instance : ServiceLocator =  ServiceLocator()
    var services = NSMutableDictionary()
    
    private override init(){
        super.init()
    }
    
    public static func get() -> ServiceLocator {
        return instance
    }
    
    /**
     Creates the map of protocols and their implementers
     - Parameter protocol: The name of the protocol
     - Parameter implementation: The class that conforms to that protocol. The implementation should have a default empty initalizer
    */
    public func register(`protocol` : Protocol, implementation : AnyClass) {
        let isImplemented : Bool = implementation.conformsToProtocol(NSProtocolFromString(NSStringFromProtocol(`protocol`))!)
        CommonUtils.assertError(isImplemented, message: "\(implementation) does not conform to protocol \(NSStringFromProtocol(`protocol`))")
        services.setObject(implementation, forKey: NSStringFromProtocol(`protocol`))
        
    }
    
    /**
     Fetches the implementation of the class that conforms to that protocol
     - Parameter protocol: The name of the protocol
     - Returns: The protocol implementation. The implementation should have a default empty initalizer
     */
    public func need(`protocol` : Protocol) -> AnyObject{
        return self.getImplementation(NSStringFromProtocol(`protocol`))
    }
    
    /**
     Fetches the implementation of the class that conforms to that protocol
     - Parameter protcolName: The name of the protocol in string
     - Returns: The protocol implementation. The implementation should have a default empty initalizer
     */
    public func getImplementation(protcolName : String) -> AnyObject{
        let clazz : AnyClass = services.objectForKey(protcolName) as! AnyClass
        return ObjcHelper.objectForClass(clazz)
    }
}

