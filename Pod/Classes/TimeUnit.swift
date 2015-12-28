//
//  TimeUnit.swift
//  Pods
//
//  Created by Tom on 9/4/15.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//
// Large portions of this code were influenced by Matt Thompson (http://mattt.me).
// The original code can be found at https://github.com/mattt/CupertinoYankee
//
import Foundation

public class TimeUnit : NSObject {
    
// MARK: - Properties and Lifecycle
    /// Static instance for static methods
    public static let sharedInstance = TimeUnit()
    
    /// The calendar to be used for date calculations
    public lazy var calendar : NSCalendar = {
       return NSCalendar.autoupdatingCurrentCalendar()
    }()
    
    /**
     Sets the calendar used when performing operations statically. The default
     value is NSCalendar.autoupdatingCurrentCalendar().
     
     - parameter calendar: The calendar to use when performing operations 
        statically.
     
     - returns: The static instance of TimeUnit.
     */
    public static func setStaticCalendar(calendar: NSCalendar) -> TimeUnit {
        sharedInstance.calendar = calendar
        
        return sharedInstance
    }
    
// MARK: - Calculate beginning of time unit
    /**
        Creates a new date at the first second of the same minute as the given date.
    
        - parameter date: The date for which to calculate the beginning of the minute.
    
        - returns: The newly created date representing the first second of the minute.
    */
    public func beginningOfMinute(date:NSDate) -> NSDate {
        let components = self.calendar.components(
            [.Year, .Month, .Day, .Hour, .Minute], fromDate: date
        )
        
        return self.calendar.dateFromComponents(components)!;
    }
    
    /**
        Creates a new date at the first second of the same minute as the given date.
    
        - parameter date: The date for which to calculate the beginning of the minute.
    
        - returns: The newly created date representing the first second of the minute.
    */
    static public func beginningOfMinute(date:NSDate) -> NSDate {
        return sharedInstance.beginningOfMinute(date)
    }
    
    /**
        Creates a new date at the first second of the same hour as the given date
    
        - parameter date: The new date for which to calculate the beginning of the hour
    
        - returns: The newly created date representing the first second of the hour
    */
    public func beginningOfHour(date:NSDate) -> NSDate {
        let components = self.calendar.components(
            ([.Year, .Month, .Day, .Hour]), fromDate: date
        )
        
        return self.calendar.dateFromComponents(components)!
    }
    
    /**
        Creates a new date at the first second of the same hour as the given date
    
        - parameter date: The new date for which to calculate the beginning of the hour
    
        - returns: The newly created date representing the first second of the hour
    */
    static public func beginningOfHour(date:NSDate) -> NSDate {
        return sharedInstance.beginningOfHour(date)
    }
    
    /**
        Creates a new date at the first second of the same day as the given date
    
        - parameter date: The date for which to calculate the beginning of the day
    
        - returns: The newly created date representing the first second of the day
    */
    public func beginningOfDay(date:NSDate) -> NSDate {
        let components = self.calendar.components(
            ([.Year, .Month, .Day]), fromDate: date
        )
        
        return self.calendar.dateFromComponents(components)!
    }
    
    /**
        Creates a new date at the first second of the same day as the given date
    
        - parameter date: The date for which to calculate the beginning of the day
    
        - returns: The newly created date representing the first second of the day
    */
    static public func beginningOfDay(date:NSDate) -> NSDate {
        return sharedInstance.beginningOfDay(date)
    }
    
    /**
        Creates a new date at the first second of the same week as the given date
    
        - parameter date: The date for which to calculate the beginning of the week
    
        - returns: The newly created date representing the first second of the week
    */
    public func beginningOfWeek(date:NSDate) -> NSDate {
        let components = self.calendar.components([.Year, .Month, .Day, .Weekday], fromDate: date)
        let weekdayOffset = (components.weekday < self.calendar.firstWeekday)
            ? (components.weekday + 7) - self.calendar.firstWeekday
            : components.weekday - self.calendar.firstWeekday
            
        components.day -= weekdayOffset;
        
        return self.calendar.dateFromComponents(components)!
    }
    
    /**
        Creates a new date at the first second of the same week as the given date
    
        - parameter date: The date for which to calculate the beginning of the week
    
        - returns: The newly created date representing the first second of the week
    */
    static public func beginningOfWeek(date:NSDate) -> NSDate {
        return sharedInstance.beginningOfWeek(date)
    }
    
    /**
        Creates a new date at the first second of the same month as the given 
        date
    
        - parameter date: The date for which to calculate the beginning of the month
    
        - returns: The newly created date representing the first second of the month
    */
    public func beginningOfMonth(date:NSDate) -> NSDate {
        let components = self.calendar.components(([.Year, .Month]), fromDate: date)
        
        return self.calendar.dateFromComponents(components)!
    }
    
    /**
        Creates a new date at the first second of the same month as the given 
        date
    
        - parameter date: The date for which to calculate the beginning of the month
    
        - returns: The newly created date representing the first second of the month
    */
    static public func beginningOfMonth(date:NSDate) -> NSDate {
        return sharedInstance.beginningOfMonth(date)
    }
    
    /**
        Creates a new date at the first second of the same year as the given date
    
        - parameter date: The date for which to calculate the beginning of the year
    
        - returns: The newly created date representing the first second of the year
    */
    public func beginningOfYear(date:NSDate) -> NSDate {
        let components = self.calendar.components(.Year, fromDate: date)
        
        return self.calendar.dateFromComponents(components)!
    }
    
    /**
        Creates a new date at the first second of the same year as the given date
    
        - parameter date: The date for which to calculate the beginning of the year
    
        - returns: The newly created date representing the first second of the year
    */
    static public func beginningOfYear(date:NSDate) -> NSDate {
        return sharedInstance.beginningOfYear(date)
    }
    
// MARK: - Calculate end of time unit
    /**
        Creates a new date at the last second of the same minute as the given date.
    
        - parameter date: The date for which to calculate the end of the minute.
    
        - returns: The newly created date representing the last second of the minute.
    */
    public func endOfMinute(date:NSDate) -> NSDate {
        let firstSecondOfNextMinute = self.beginningOfMinute(
            self.calendar.dateByAddingUnit(.Minute, value: 1, toDate: date, options: [])!
        )
        
        return firstSecondOfNextMinute.dateByAddingTimeInterval(-1)
    }
    
    /**
        Creates a new date at the last second of the same minute as the given date.
    
        - parameter date: The date for which to calculate the end of the minute.
    
        - returns: The newly created date representing the last second of the minute.
    */
    static public func endOfMinute(date:NSDate) -> NSDate {
        return sharedInstance.endOfMinute(date)
    }
    
    /**
        Creates a new date at the last second of the same hour as the given date.
    
        - parameter date: The date for which to calculate the end of the hour.
    
        - returns: The newly created date representing the last second of the hour.
    */
    public func endOfHour(date:NSDate) -> NSDate {
        let firstSecondOfNextHour = self.beginningOfHour(
            self.calendar.dateByAddingUnit(.Hour, value: 1, toDate: date, options: [])!
        )
        
        return firstSecondOfNextHour.dateByAddingTimeInterval(-1)
    }
    
    /**
        Creates a new date at the last second of the same hour as the given date.
    
        - parameter date: The date for which to calculate the end of the month
    
        - returns: The newly created date representing the last second of the hour.
    */
    static public func endOfHour(date:NSDate) -> NSDate {
        return sharedInstance.endOfHour(date)
    }
    
    /**
        Creates a new date at the last second of the same day as the given date.
    
        - parameter date: The date for which to calculate the end of the hour.
    
        - returns: The newly created date representing the last second of the day.
    */
    public func endOfDay(date:NSDate) -> NSDate {
        let firstSecondOfNextDay = self.beginningOfDay(
            self.calendar.dateByAddingUnit(.Day, value: 1, toDate: date, options: [])!
        )
        
        return firstSecondOfNextDay.dateByAddingTimeInterval(-1)
    }
    
    /**
        Creates a new date at the last second of the same day as the given date.
    
        - parameter date: The date for which to calculate the end of the hour.
    
        - returns: The newly created date representing the last second of the day.
    */
    static public func endOfDay(date:NSDate) -> NSDate {
        return sharedInstance.endOfDay(date)
    }
    
    /**
        Creates a new date at the last second of the same week as the given date.
    
        - parameter date: The date for which to calculate the end of the week.
    
        - returns: The newly created date representing the last second of the week.
    */
    public func endOfWeek(date:NSDate) -> NSDate {
        let firstSecondOfNextWeek = self.beginningOfWeek(
            self.calendar.dateByAddingUnit(.WeekOfYear, value: 1, toDate: date, options: [])!
        )
        
        return firstSecondOfNextWeek.dateByAddingTimeInterval(-1)
    }
    
    /**
        Creates a new date at the last second of the same week as the given date.
    
        - parameter date: The date for which to calculate the end of the week.
    
        - returns: The newly created date representing the last second of the week.
    */
    static public func endOfWeek(date:NSDate) -> NSDate {
        return sharedInstance.endOfWeek(date)
    }
    
    /**
        Creates a new date at the last second of the same month as the given date
    
        - parameter date: The date for which to calculate the end of the month
    
        - returns: The newly created date representing the last second of the month
    */
    public func endOfMonth(date:NSDate) -> NSDate {
        let firstSecondOfNextMonth = self.beginningOfMonth(
            self.calendar.dateByAddingUnit(.Month, value: 1, toDate: date, options: [])!
        )
        
        return firstSecondOfNextMonth.dateByAddingTimeInterval(-1)
    }
    
    /**
        Creates a new date at the last second of the same month as the given date
    
        - parameter date: The date for which to calculate the end of the month
    
        - returns: The newly created date representing the last second of the month
    */
    static public func endOfMonth(date:NSDate) -> NSDate {
        return sharedInstance.endOfMonth(date)
    }
    
    /**
        Creates a new date at the last second of the same year as the given date.
    
        - parameter date: The date for which to calculate the end of the year.
    
        - returns: The newly created date representing the last second of the year.
    */
    public func endOfYear(date:NSDate) -> NSDate {
        let firstSecondOfNextYear = self.beginningOfYear(
            self.calendar.dateByAddingUnit(.Year, value: 1, toDate: date, options: [])!
        )
        
        return firstSecondOfNextYear.dateByAddingTimeInterval(-1)
    }
    
    /**
        Creates a new date at the last second of the same year as the given date.
    
        - parameter date: The date for which to calculate the end of the year.
    
        - returns: The newly created date representing the last second of the year.
    */
    static public func endOfYear(date:NSDate) -> NSDate {
        return sharedInstance.endOfYear(date)
    }
}
