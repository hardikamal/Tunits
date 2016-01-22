//
//  Date+Subunits.swift
//  Pods
//
//  Created by Tom on 1/22/16.
//
//

import Foundation

extension NSDate {
// MARK: - Building Subunits
    
    /**
    Creates an array of dates at the first second of each minute of the hour
    of the receiving date.
    
    - returns: The newly created array of dates.
    */
    public func minutesOfHour() -> [NSDate] {
        return TimeUnit.minutesOfHour(self)
    }

    /**
     Creates an array of dates at the first second of each hour of the day
     of the receiving date.
     
     - returns: The newly created array of dates.
     */
    public func hoursOfDay() -> [NSDate] {
        return TimeUnit.hoursOfDay(self)
    }

    /**
     Creates an array of dates at the first second of each day of the week
     of the receiving date.
     
     - returns: The newly created array of dates.
     */
    public func daysOfWeek() -> [NSDate] {
        return TimeUnit.daysOfWeek(self)
    }

    /**
     Creates an array of dates at the first second of each day of the month
     of the receiving date.
     
     - returns: The newly created array of dates.
     */
    public func daysOfMonth() -> [NSDate] {
        return TimeUnit.daysOfMonth(self)
    }
    
    /**
     Creates an array of dates at the first second of each month of the year
     of the receiving date.
     
     - returns: The newly created array of dates.
     */
    public func monthsOfYear() -> [NSDate] {
        return TimeUnit.monthsOfYear(self)
    }
}