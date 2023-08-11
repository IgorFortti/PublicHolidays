//
//  DetailViewModel.swift
//  DesafioJoinin
//
//  Created by Igor Fortti on 09/08/23.
//

import Foundation

class DetailViewModel {
    // MARK: - Properties
    private let coordinator: DetailCoordinator
    private var holiday: Holiday
    
    public var detailViewControllerTitle: String {
        return holiday.date ?? ""
    }
    
    public var holidayName: String {
        return holiday.name ?? ""
    }
    
    public var holidayLocalName: String {
        return holiday.localName ?? ""
    }
    
    public var holidayLaunchYear: String {
        if let launchYear = holiday.launchYear {
            let lauchYearString = String(launchYear)
            return lauchYearString
        } else {
            return "There is no record of the launch year of this holiday"
        }
    }
    
    public var holidayFixed: String {
        if let fixed = holiday.fixed {
            if fixed {
                return "This is a fixed holiday"
            } else {
                return "This isn't a fixed holiday"
            }
        } else {
            return "There is no record about this holiday being fixed or not"
        }
    }
    
    public var holidayGlobal: String {
        if let global = holiday.global {
            if global {
                return "This is a global holiday"
            } else {
                return "This isn't a global holiday"
            }
        } else {
            return "There is no record about this holiday being global or not"
        }
    }
    
    // MARK: - Initializer
    init(coordinator: DetailCoordinator, holiday: Holiday) {
        self.coordinator = coordinator
        self.holiday = holiday
    }
}
