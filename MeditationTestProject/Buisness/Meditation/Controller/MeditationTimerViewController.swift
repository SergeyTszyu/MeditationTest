//
//  MeditationTimerViewController.swift
//  MeditationTestProject
//
//  Created by Sergey Tszyu on 23.02.2020.
//  Copyright © 2020 Sergey Tszyu. All rights reserved.
//

import UIKit

final class MeditationTimerViewController: UIViewController {
    
    // MARK: - @IBOutlets
    
    @IBOutlet private weak var timePickerView: UIPickerView!
    
    // MARK: - Properties
    
    fileprivate let dataSource = [1, 3, 5, 8, 10]
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

// MARK: Private

private extension MeditationTimerViewController {
    
    @IBAction func nextAction(_ sender: UIButton) {
        let meditationViewController = R.storyboard.meditation.meditationViewController()!
        navigationController?.pushViewController(meditationViewController, animated: true)
    }
}

extension MeditationTimerViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataSource.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let stringValue = "\(dataSource[row])"
        return stringValue
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let time = dataSource[row]
        MeditationSession.MeditationDuration = time * 60
    }
}
