//
//  String+Ext.swift
//  UIKIT_GHFollowers
//
//  Created by Yaroslaw Homziak on 16.10.2025.
//

import Foundation
extension String {
    
    func convertToDate() -> Date? {
        let dateFormatte = DateFormatter()
        dateFormatte.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatte.locale = Locale(identifier: "en_US_POSIX")
        dateFormatte.timeZone = .current
        
        return dateFormatte.date(from: self)
    }
    
    func convertToDispalyFormat() -> String {
        guard let date = self.convertToDate() else { return "N/A"}
        return date.convertToMonthYearFormat()
    }
}
