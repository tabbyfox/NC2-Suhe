//
//  Date.swift
//  NC2-Suhe
//
//  Created by Suherda Dwi Santoso on 26/07/22.
//

import Foundation

extension Date
{
    func toString(dateFormat format: String ) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
        
    }

}
