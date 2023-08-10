//
//  YearPickerView.swift
//  DesafioJoinin
//
//  Created by Igor Fortti on 09/08/23.
//

import UIKit

protocol YearPickerViewDelegate: AnyObject {
    func didSelectYear(_ year: Int)
}

class YearPickerView: UIPickerView, UIPickerViewDelegate, UIPickerViewDataSource {
    
    weak var yearDelegate: YearPickerViewDelegate?
    
    private var years: [Int] = []
    
    init(delegate: YearPickerViewDelegate?){
        super.init(frame: .zero)
        self.yearDelegate = delegate
        self.delegate = self
        self.dataSource = self
        
        for year in 0...9999 {
            years.append(year)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return years.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(years[row])"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedYear = years[row]
        yearDelegate?.didSelectYear(selectedYear)
    }
}
