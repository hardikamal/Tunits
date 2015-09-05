//
//  TimeUnit.swift
//  Pods
//
//  Created by Tom on 9/4/15.
//
//

import Foundation

public class TimeUnit {
    
// MARK: - Properties and Lifecycle
    
    /// The calendar to be used for date calculations
    let calendar : NSCalendar
    
    /**
        Initializes a new TImeUnit
    
        :returns: The newly intialized TimeUnit
    */
    init() {
        self.calendar = NSCalendar.autoupdatingCurrentCalendar()
    }
    
// MARK: - Calculate beginning of time unit
    
    /**
        Creates a new date at the first second of the same month as the given 
        date
    
        :param: date The date for which to calculate the beginning of the month
    
        :returns: The newly created date representing the first second of the 
            month
    */
    private func beginningOfMonth(date:NSDate) -> NSDate {
        let components = self.calendar.components((NSCalendarUnit.CalendarUnitYear | NSCalendarUnit.CalendarUnitMonth), fromDate: date)
        
        return self.calendar.dateFromComponents(components)!
    }
    
    
// MARK: - Build time units
    
    /**
        Creates an array of dates at midnight on each day of the month of the 
        given date. 
    
        :param: date A date within the month for which to create dates
    
        :returns: The newly created array of dates
    */
    public func daysOfMonth(date:NSDate) -> [NSDate] {
        var currentDay = self.beginningOfMonth(date);
        var daysOfMonth : [NSDate] = []
        
        let firstDayOfNextMonth = self.beginningOfMonth(self.calendar.dateByAddingUnit(
            NSCalendarUnit.CalendarUnitMonth, value: 1, toDate: currentDay, options: NSCalendarOptions.allZeros)!
        )
        
        while currentDay.compare(firstDayOfNextMonth) == NSComparisonResult.OrderedAscending {
            let currentDay = self.calendar.dateByAddingUnit(
                NSCalendarUnit.CalendarUnitMonth, value:1, toDate:currentDay, options:NSCalendarOptions.allZeros
            )
            
            daysOfMonth.append(currentDay!)
        }
        
        return daysOfMonth
    }
}
