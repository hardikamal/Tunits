//
//  DateArray+Subunits.swift
//  Pods
//
//  Created by Tom on 1/22/16.
//
//

import Foundation
extension Array where Element : NSDate {
    /**
     Creates an array by concatenating the results of performing the function f
     on each date in the receiver.
     
     - parameter f: The function to perform upon each element within the array.
     
     - returns: The newly created array of dates.
     */
    private func foldSubunits(f: (NSDate) -> [NSDate]) -> [NSDate] {
        var units : [NSDate] = []
        for date:NSDate in self {
            units += f(date)
        }
        
        return units
    }
    
    /**
     Creates an array containing the minutes of the hour of each date within 
     the receiver.
     
     - returns: The newly created array of minutes.
     */
    public func minutesOfHour() -> [NSDate] {
        return self.foldSubunits(TimeUnit.minutesOfHour)
    }
    
    /**
     Creates an array containing the hours of the day of each date within the 
     receiver.
     
     - returns: The newly created array of hours.
     */
    public func hoursOfDay() -> [NSDate] {
        return self.foldSubunits(TimeUnit.hoursOfDay)
    }
    
    /**
     Creates an array containing the days of the week of each date within the
     receiver.
     
     - returns: The newly created array of days.
     */
    public func daysOfWeek() -> [NSDate] {
        return self.foldSubunits(TimeUnit.daysOfWeek)
    }
    
    /**
     Creates an array containing the days of the month of each date within the
     receiver.
     
     - returns: The newly created array of days.
     */
    public func daysOfMonth() -> [NSDate] {
        return self.foldSubunits(TimeUnit.daysOfMonth)
    }
    
    /**
     Creates an array containing the months of the year of each date within the
     receiver.
     
     - returns: The newly created array of months.
     */
    public func monthsOfYear() -> [NSDate] {
        return self.foldSubunits(TimeUnit.monthsOfYear)
    }
}