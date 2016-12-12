//
//  NSDate.swift
//  reperecipe
//
//  Created by Takuya Shikichi on 2016/08/14.
//  Copyright © 2016年 Takuya Shikichi. All rights reserved.
//

import SwiftDate

internal let NSDateZero = NSDate(timeIntervalSince1970: 0)

enum RepeRecipeDateFormat: String {
    case YearMonthDay    = "yyyy/MM/dd"
}

extension NSDate {
    func toString(format: RepeRecipeDateFormat) -> String {
        let dateInRegion = self.inRegion(DateRegion(calendarName: .Gregorian, localeName: .JapaneseJapan))
        if let returnString = dateInRegion.toString(.Custom(format.rawValue)) {
            return returnString
        } else {
            let dateFormatter = NSDateFormatter()
            dateFormatter.locale = NSLocale(localeIdentifier: "ja_JP")
            dateFormatter.dateFormat = format.rawValue
            return dateFormatter.stringFromDate(self)
        }
    }
    static func dateFromString(dateString: String, format: RepeRecipeDateFormat) -> NSDate? {
        if dateString == "" {
            return nil
        }
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: "ja_JP")
        dateFormatter.dateFormat = format.rawValue
        return dateFormatter.dateFromString(dateString)
    }
    
}