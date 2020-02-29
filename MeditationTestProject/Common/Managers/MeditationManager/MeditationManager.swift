//
//  MeditationManager.swift
//  MeditationTestProject
//
//  Created by Sergey Tszyu on 23.02.2020.
//  Copyright © 2020 Sergey Tszyu. All rights reserved.
//

import UIKit
import RealmSwift
import SwiftDate

class MeditationManager: NSObject {
    
    class func logSession(withTime time: Int) {
        
        let realm = try! Realm()
        
        let now = Date() as NSDate
        let session = MeditationSession(date: now, time: time)
        
        try! realm.write {
            realm.add(session)
        }
        
    }
    
}

