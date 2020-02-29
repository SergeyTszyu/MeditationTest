//
//  MeditationSession.swift
//  MeditationTestProject
//
//  Created by Sergey Tszyu on 23.02.2020.
//  Copyright © 2020 Sergey Tszyu. All rights reserved.
//

import UIKit
import RealmSwift

class MeditationSession: Object {
    
    static var MeditationDuration = 60
    
    dynamic var date: NSDate = NSDate(timeIntervalSince1970: 1)
    dynamic var time = 0
    
    convenience init(date: NSDate, time: Int) {
        self.init()
        self.date = date
        self.time = time
    }
    
    var didMeditate: Bool {
        return self.time == MeditationSession.MeditationDuration
    }
    
}
