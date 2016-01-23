//
//  DateArray+Contains.swift
//  Pods
//
//  Created by Tom on 1/23/16.
//
//

import Foundation

extension Array where Element : NSDate {
    
    private func indexOfDate(compareDate:NSDate, comparingUnit: (date:NSDate, otherDate:NSDate) -> Bool) -> Int? {
        for (index, date) in self.enumerate() {
            if (comparingUnit(date:date, otherDate:compareDate)) {
                return index
            }
        }
        
        return nil
    }
    
    public func indexOfMinute(minute: NSDate) -> Int? {
        return self.indexOfDate(minute, comparingUnit: TimeUnit.minuteContainsDate)
    }
    
    public func indexOfHour(hour: NSDate) -> Int? {
        return self.indexOfDate(hour, comparingUnit: TimeUnit.hourContainsDate)
    }
    
    public func indexOfDay(day: NSDate) -> Int? {
        return self.indexOfDate(day, comparingUnit: TimeUnit.dayContainsDate)
    }
    
    public func indexOfMonth(month: NSDate) -> Int? {
        return self.indexOfDate(month, comparingUnit: TimeUnit.monthContainsDate)
    }
    
    public func indexOfYear(year: NSDate) -> Int? {
        return self.indexOfDate(year, comparingUnit: TimeUnit.yearContainsDate)
    }
}