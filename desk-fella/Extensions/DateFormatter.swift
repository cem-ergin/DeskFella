//
//  HourFormatter.swift
//  desk-fella
//
//  Created by Cem Ergin on 30/12/2023.
//

import Foundation

extension DateFormatter {
    func hour(showHour: Bool, showMinute: Bool, showSeconds: Bool) -> DateFormatter {
        let formatter = DateFormatter()
        
        if showHour {
            formatter.dateFormat += "HH:"
        }
        if showMinute {
            formatter.dateFormat += "mm:"
        }
        if showSeconds {
            formatter.dateFormat += "ss"
        }
        
        if formatter.dateFormat.hasSuffix(":") {
            formatter.dateFormat.removeLast()
        }
        return formatter
    }
    
    func MMMMdd () -> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM dd"
        return formatter
    }
}
