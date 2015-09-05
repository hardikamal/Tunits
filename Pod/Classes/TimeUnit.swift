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
    private let calendar : NSCalendar
    
    /**
        Initializes a new TImeUnit
    
        :returns: The newly intialized TimeUnit
    */
    public init() {
        self.calendar = NSCalendar.autoupdatingCurrentCalendar()
    }
    
// MARK: - Calculate beginning of time unit
    
    /**
        Creates a new date at the first second of the same hour as the given date
    
        :param: date The new date for which to calculate the beginning of the hour
    
        :returns: The newly created date representing the first second of the hour
    */
    private func beginningOfHour(date:NSDate) -> NSDate {
        let components = self.calendar.components(
            (NSCalendarUnit.CalendarUnitYear | NSCalendarUnit.CalendarUnitMonth | NSCalendarUnit.CalendarUnitDay | NSCalendarUnit.CalendarUnitHour), fromDate: date
        )
        
        return self.calendar.dateFromComponents(components)!
    }
    
    /**
        Creates a new date at the first second of the same day as the given date
    
        :param: date The date for which to calculate the beginning of the day
    
        :returns: The newly created date representing the first second of the day
    */
    private func beginningOfDay(date:NSDate) -> NSDate {
        let components = self.calendar.components(
            (NSCalendarUnit.CalendarUnitYear | NSCalendarUnit.CalendarUnitMonth | NSCalendarUnit.CalendarUnitDay), fromDate: date
        )
        
        return self.calendar.dateFromComponents(components)!
    }
    
    /**
        Creates a new date at the first second of the same month as the given 
        date
    
        :param: date The date for which to calculate the beginning of the month
    
        :returns: The newly created date representing the first second of the month
    */
    private func beginningOfMonth(date:NSDate) -> NSDate {
        let components = self.calendar.components((NSCalendarUnit.CalendarUnitYear | NSCalendarUnit.CalendarUnitMonth), fromDate: date)
        
        return self.calendar.dateFromComponents(components)!
    }
    
    
// MARK: - Build time units
    
    /**
        Creates an array of dates at the first second of each minute of the hour 
        of the given date.
    
        :param: date A date within the day for which to create dates.
    
        :returns: The newly created array of dates.
    */
    public func minutesOfHour(date:NSDate) -> [NSDate] {
        var currentMinute = self.beginningOfHour(date)
        var minutesOfHour : [NSDate] = []
        
        let firstMinuteOfNextHour = self.beginningOfHour(self.calendar.dateByAddingUnit(
            NSCalendarUnit.CalendarUnitHour, value: 1, toDate: currentMinute, options: NSCalendarOptions.allZeros)!
        )
        
        while currentMinute.compare(firstMinuteOfNextHour) == NSComparisonResult.OrderedAscending {
            minutesOfHour.append(currentMinute.copy() as! NSDate)
            
            currentMinute = self.calendar.dateByAddingUnit(
                NSCalendarUnit.CalendarUnitMinute, value: 1, toDate: currentMinute, options: NSCalendarOptions.allZeros
            )!
        }
        
        return minutesOfHour
    }
    
    /**
        Creates an array of dates at the first second of each hour of the day of
        the given date.
    
        :param: date A date within the day for which to create dates.
    
        :returns: The newly created array of dates.
    */
    public func hoursOfDay(date:NSDate) -> [NSDate] {
        var currentHour = self.beginningOfDay(date)
        var hoursOfDay : [NSDate] = []
        
        let firstHourOfNextDay = self.beginningOfDay(self.calendar.dateByAddingUnit(
            NSCalendarUnit.CalendarUnitDay, value: 1, toDate: currentHour, options: NSCalendarOptions.allZeros)!
        )
        
        while currentHour.compare(firstHourOfNextDay) == NSComparisonResult.OrderedAscending {
            hoursOfDay.append(currentHour.copy() as! NSDate)
            
            currentHour = self.calendar.dateByAddingUnit(
                NSCalendarUnit.CalendarUnitHour, value: 1, toDate: currentHour, options: NSCalendarOptions.allZeros
            )!
        }
        
        return hoursOfDay
    }
    
    /**
        Creates an array of dates at midnight on each day of the month of the 
        given date. 
    
        :param: date A date within the month for which to create dates.
    
        :returns: The newly created array of dates.
    */
    public func daysOfMonth(date:NSDate) -> [NSDate] {
        var currentDay = self.beginningOfMonth(date)
        var daysOfMonth : [NSDate] = []
        
        let firstDayOfNextMonth = self.beginningOfMonth(self.calendar.dateByAddingUnit(
            NSCalendarUnit.CalendarUnitMonth, value: 1, toDate: currentDay, options: NSCalendarOptions.allZeros)!
        )
        
        while currentDay.compare(firstDayOfNextMonth) == NSComparisonResult.OrderedAscending {
            daysOfMonth.append(currentDay.copy() as! NSDate)
            
            currentDay = self.calendar.dateByAddingUnit(
                NSCalendarUnit.CalendarUnitDay, value:1, toDate:currentDay, options:NSCalendarOptions.allZeros
            )!
            
        }
        
        return daysOfMonth
    }
}
