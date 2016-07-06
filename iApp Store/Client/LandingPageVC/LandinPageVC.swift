//
//  LandinPageVC.swift
//  iApp Store
//
//  Created by VJ on 06/07/16.
//  Copyright © 2016 Grability. All rights reserved.
//

import Foundation
import UIKit

class LandinPageVC: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let instance = ServiceLocator.get().need(ConnectionAPI) as! ConnectionAPI
        instance.getResponseFromURL(Constants.Connection.REQUEST_URL)
    }
    
}