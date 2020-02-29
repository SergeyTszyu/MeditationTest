//
//  MeditationViewController.swift
//  MeditationTestProject
//
//  Created by Sergey Tszyu on 23.02.2020.
//  Copyright © 2020 Sergey Tszyu. All rights reserved.
//

import UIKit

final class MeditationViewController: UIViewController {
    
    // MARK: - @IBOutlets
    
    @IBOutlet private weak var minutesLabel: UILabel!
    @IBOutlet private weak var secondsLabel: UILabel!
    @IBOutlet private weak var meditationButton: UIButton!
    
    // MARK: - Properties
    
    fileprivate var backgroundTaskIdentifier: UIBackgroundTaskIdentifier?
    fileprivate var timer: Timer?
    fileprivate var currentSeconds: Int = 0 {
        didSet {
            let seconds = currentSeconds % 60
            let minutes = currentSeconds / 60
            minutesLabel.text = String(format: "%.2d", minutes)
            secondsLabel.text = String(format: "%.2d", seconds)
        }
    }
    fileprivate var isMeditating = false
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    deinit {
        stopTimer()
    }
}


// MARK: - IBActions

extension MeditationViewController {
    
    @IBAction func meditationAction(_ sender: UIButton) {
        if isMeditating {
            endMeditation()
        } else {
            startMeditation()
        }
    }
}

// MARK: - Private

private extension MeditationViewController {
    
    func setup() {
        backgroundTaskIdentifier = UIApplication.shared.beginBackgroundTask(expirationHandler: {
            UIApplication.shared.endBackgroundTask(self.backgroundTaskIdentifier!)
        })
        currentSeconds = MeditationSession.MeditationDuration
        startMeditation()
    }
    
    func formattedTime() {
     
    }
    
    func startMeditation() {
        startTimer()
        
        isMeditating = true
        currentSeconds = MeditationSession.MeditationDuration
        meditationButton.setTitle("Завершить", for: .normal)
    }
    
    func endMeditation() {

        stopTimer()
        
        isMeditating = false
        currentSeconds = MeditationSession.MeditationDuration
        meditationButton.setTitle("Начать", for: .normal)
    }
    
    func startTimer() {
        if timer != nil {
            stopTimer()
        }
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFired), userInfo: nil, repeats: true)
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    @objc func timerFired() {
        if currentSeconds > 0 {
            currentSeconds -= 1
        } else if currentSeconds == 0 {
            endMeditation()
        }
    }
}
