//
//  Date+Ext.swift
//  UIKIT_GHFollowers
//
//  Created by Yaroslaw Homziak on 16.10.2025.
//

import Foundation
extension Date {
    
    func convertToMonthYearFormat() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM yyyy"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = .current
        
        return dateFormatter.string(from: self)
    }
}
