//
//  TimeUnit+DateSubunits.swift
//  Pods
//
//  Created by Tom on 12/27/15.
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

extension TimeUnit {
// MARK: - Build time units
    
    /**
    Creates an array of all dates between the 'from' and 'to' dates with the 
    given offset.
    
    - parameter timeUnit: The unit used to iterate through the dates.
    - parameter fromDate: The date from which to begin iteration.
    - parameter toDate:   The date at which to finish iteration.
    
    - returns: The newly created array of dates.
    */
    private func timeUnits(timeUnit:NSCalendarUnit, fromDate:NSDate, toDate:NSDate) -> [NSDate] {
        var currentDate = fromDate
        var timeUnits : [NSDate] = []
        
        while currentDate.compare(toDate) == .OrderedAscending {
            timeUnits.append(currentDate.copy() as! NSDate)
            
            currentDate = self.calendar.dateByAddingUnit(timeUnit, value: 1, toDate: currentDate, options: [])!
        }
        
        return timeUnits
    }
    
    /**
     Creates an array of dates at the first second of each minute of the hour
     of the given date.
     
     - parameter date: A date within the day for which to create dates.
     
     - returns: The newly created array of dates.
     */
    public func minutesOfHour(date:NSDate) -> [NSDate] {
        let firstMinuteOfHour = self.beginningOfHour(date)
        let firstMinuteOfNextHour = self.beginningOfHour(self.calendar.dateByAddingUnit(
            .Hour, value: 1, toDate: firstMinuteOfHour, options: [])!
        )
        
        return self.timeUnits(.Minute, fromDate: firstMinuteOfHour, toDate: firstMinuteOfNextHour)
    }
    
    /**
     Creates an array of dates at the first second of each minute of the hour
     of the given date.
     
     - parameter date: A date within the day for which to create dates.
     
     - returns: The newly created array of dates.
     */
    static public func minutesOfHour(date:NSDate) -> [NSDate] {
        return sharedInstance.minutesOfHour(date)
    }
    
    /**
     Creates an array of dates at the first second of each hour of the day of
     the given date.
     
     - parameter date: A date within the day for which to create dates.
     
     - returns: The newly created array of dates.
     */
    public func hoursOfDay(date:NSDate) -> [NSDate] {
        let firstHourOfDay = self.beginningOfDay(date)
        let firstHourOfNextDay = self.beginningOfDay(self.calendar.dateByAddingUnit(
            .Day, value: 1, toDate: firstHourOfDay, options: [])!
        )
        
        return self.timeUnits(.Hour, fromDate: firstHourOfDay, toDate: firstHourOfNextDay)
    }
    
    /**
     Creates an array of dates at the first second of each hour of the day of
     the given date.
     
     - parameter date: A date within the day for which to create dates.
     
     - returns: The newly created array of dates.
     */
    static public func hoursOfDay(date:NSDate) -> [NSDate] {
        return sharedInstance.hoursOfDay(date)
    }
    
    /**
     Creates an array of dates at the first second of each day of the week of
     the given date.
     
     - parameter date: A date within the week for which to create dates.
     
     - returns: The newly created array of dates.
     */
    public func daysOfWeek(date:NSDate) -> [NSDate] {
        let firstDayOfWeek = self.beginningOfWeek(date)
        let firstDayOfNextWeek = self.beginningOfWeek(
            self.calendar.dateByAddingUnit(.WeekOfYear, value: 1, toDate: date, options: [])!
        )
        
        return self.timeUnits(.Day, fromDate: firstDayOfWeek, toDate: firstDayOfNextWeek)
    }
    
    /**
     Creates an array of dates at the first second of each day of the week of
     the given date.
     
     - parameter date: A date within the week for which to create dates.
     
     - returns: The newly created array of dates.
     */
    static public func daysOfWeek(date:NSDate) -> [NSDate] {
        return sharedInstance.daysOfWeek(date)
    }
    
    /**
     Creates an array of dates at midnight on each day of the month of the
     given date.
     
     - parameter date: A date within the month for which to create dates.
     
     - returns: The newly created array of dates.
     */
    public func daysOfMonth(date:NSDate) -> [NSDate] {
        let firstDayOfMonth = self.beginningOfMonth(date)
        let firstDayOfNextMonth = self.beginningOfMonth(self.calendar.dateByAddingUnit(
            .Month, value: 1, toDate: firstDayOfMonth, options: [])!
        )
        
        return self.timeUnits(.Day, fromDate: firstDayOfMonth, toDate: firstDayOfNextMonth)
    }
    
    /**
     Creates an array of dates at midnight on each day of the month of the
     given date.
     
     - parameter date: A date within the month for which to create dates.
     
     - returns: The newly created array of dates.
     */
    static public func daysOfMonth(date:NSDate) -> [NSDate] {
        return sharedInstance.daysOfMonth(date)
    }
    
    /**
     Creates an array of dates at midnight of the first day of each month of
     the year of the given date.
     
     - parameter date: A date within the month for which to create dates.
     
     - returns: The newly created array of dates.
     */
    public func monthsOfYear(date:NSDate) -> [NSDate] {
        let firstMonthOfYear = self.beginningOfYear(date)
        let firstMonthOfNextYear = self.beginningOfYear(self.calendar.dateByAddingUnit(
            .Year, value: 1, toDate: firstMonthOfYear, options: [])!
        )
        
        return self.timeUnits(.Month, fromDate: firstMonthOfYear, toDate: firstMonthOfNextYear)
    }
    
    /**
     Creates an array of dates at midnight of the first day of each month of
     the year of the given date.
     
     - parameter date: A date within the month for which to create dates.
     
     - returns: The newly created array of dates.
     */
    static public func monthsOfYear(date:NSDate) -> [NSDate] {
        return sharedInstance.monthsOfYear(date)
    }
}
