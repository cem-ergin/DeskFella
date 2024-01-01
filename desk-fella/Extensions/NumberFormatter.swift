//
//  NumberFormatter.swift
//  desk-fella
//
//  Created by Cem Ergin on 30/12/2023.
//

import Foundation

extension NumberFormatter {
    func chargeFormatter () -> NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        return formatter
    }
}
