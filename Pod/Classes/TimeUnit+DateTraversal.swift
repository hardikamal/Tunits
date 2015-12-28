//
//  TimeUnit+DateTraversal.swift
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
// MARK: - Previous and Next Time Units
    
// MARK: minutes
    /**
    Creates a new date by subtracting the given number of minutes from the given
    date and truncating to the first second of the date's minute.
    
    - parameter date:  The date from which to subtract minutes.
    - parameter delta: The number of minutes to be subtracted.
    
    - returns: The newly created date.
    */
    public func minutesBefore(date:NSDate, delta:Int = 1) -> NSDate {
        return self.minutesAfter(date, delta: -delta)
    }
    
    /**
    Creates a new date by subtracting the given number of minutes from the given
    date and truncating to the first second of the date's minute.
    
    - parameter date:  The date from which to subtract minutes.
    - parameter delta: The number of minutes to be subtracted.
    
    - returns: The newly created date.
    */
    static public func minutesBefore(date:NSDate, delta:Int = 1) -> NSDate {
        return sharedInstance.minutesBefore(date, delta: delta)
    }
    
    /**
    Creates a new date at the first second of the minute prior to the given date.
    
    - parameter date: The date for which to find the previous minute.
    
    - returns: The newly created date.
    */
    public func minuteBefore(date:NSDate) -> NSDate {
        let previousMinute = self.calendar.dateByAddingUnit(.Minute, value: -1, toDate: date, options: [])!
        return self.beginningOfMinute(previousMinute)
    }
    
    /**
     Creates a new date at the first second of the minute prior to the given date.
     
     - parameter date: The date for which to find the previous minute.
     
     - returns: The newly created date.
     */
    static public func minuteBefore(date:NSDate) -> NSDate {
        return sharedInstance.minuteBefore(date)
    }
    
    /**
    Creates a new date by adding the given number of minutes from the given date 
    and truncating to the first second of the date's minute.
    
    - parameter date:  The date from which to subtract minutes.
    - parameter delta: The number of minutes to be subtracted.
    
    - returns: The newly created date.
    */
    public func minutesAfter(date:NSDate, delta:Int = 1) -> NSDate {
        let minute = self.calendar.dateByAddingUnit(.Minute, value: delta, toDate: date, options: [])!
        return self.beginningOfMinute(minute)
    }
    
    /**
    Creates a new date by adding the given number of minutes from the given date 
    and truncating to the first second of the date's minute.
    
    - parameter date:  The date from which to subtract minutes.
    - parameter delta: The number of minutes to be subtracted.
    
    - returns: The newly created date.
    */
    static public func minutesAfter(date:NSDate, delta:Int = 1) -> NSDate {
        return sharedInstance.minutesAfter(date, delta: delta)
    }
    
    /**
     Creates a new date at the first second of the minute following the given date.
     
     - parameter date: The date for which to calculate the next minute.
     
     - returns: The newly created date.
     */
    public func minuteAfter(date:NSDate) -> NSDate {
        let nextMinute = self.calendar.dateByAddingUnit(.Minute, value: 1, toDate: date, options: [])!
        return self.beginningOfMinute(nextMinute)
    }
    
    /**
     Creates a new date at the first second of the minute following the given date.
     
     - parameter date: The date for which to calculate the next minute.
     
     - returns: The newly created date.
     */
    static public func minuteAfter(date:NSDate) -> NSDate {
        return sharedInstance.minuteAfter(date)
    }
    
// MARK: hours
    /**
     Creates a new date at the first second of the hour prior to the given date.
     
     - parameter date: The date for which to find the previous hour
     
     - returns: The newly created date.
     */
    public func hourBefore(date:NSDate) -> NSDate {
        let previousHour = self.calendar.dateByAddingUnit(.Hour, value: -1, toDate: date, options: [])!
        return self.beginningOfHour(previousHour)
    }
    
    /**
     Creates a new date at the first second of the hour prior to the given date.
     
     - parameter date: The date for which to find the previous hour
     
     - returns: The newly created date.
     */
    static public func hourBefore(date:NSDate) -> NSDate {
        return sharedInstance.hourBefore(date)
    }
    
    /**
     Creates a new date at the first second of the hour following the given date.
     
     - parameter date: The date for which to find the next hour
     
     - returns: The newly created date.
     */
    public func hourAfter(date:NSDate) -> NSDate {
        let nextHour = self.calendar.dateByAddingUnit(.Hour, value: 1, toDate: date, options: [])!
        return self.beginningOfHour(nextHour)
    }
    
    /**
     Creates a new date at the first second of the hour following the given date.
     
     - parameter date: The date for which to find the next hour
     
     - returns: The newly created date.
     */
    static public func hourAfter(date:NSDate) -> NSDate {
        return sharedInstance.hourAfter(date)
    }
    
// MARK: days
    /**
     Creates a new date at the first second of the day prior to the given date.
     
     - parameter date: The date for which to find the previous day.
     
     - returns: The newly created date.
     */
    public func dayBefore(date:NSDate) -> NSDate {
        let previousDay = self.calendar.dateByAddingUnit(.Day, value: -1, toDate: date, options: [])!
        return self.beginningOfDay(previousDay)
    }
    
    /**
     Creates a new date at the first second of the day prior to the given date.
     
     - parameter date: The date for which to find the previous day.
     
     - returns: The newly created date.
     */
    static public func dayBefore(date:NSDate) -> NSDate {
        return sharedInstance.dayBefore(date)
    }
    
    /**
     Creates a new date at the first second of the day following the given date.
     
     - parameter date: The date for which to find the next day.
     
     - returns: The newly created date.
     */
    public func dayAfter(date:NSDate) -> NSDate {
        let nextDay = self.calendar.dateByAddingUnit(.Day, value: 1, toDate: date, options: [])!
        return self.beginningOfDay(nextDay)
    }
    
    /**
     Creates a new date at the first second of the day following the given date.
     
     - parameter date: The date for which to find the next day.
     
     - returns: The newly created date.
     */
    static public func dayAfter(date:NSDate) -> NSDate {
        return sharedInstance.dayAfter(date)
    }
    
// MARK: weeks
    /**
     Creates a new date at the first second of the week prior to the given date.
     
     - parameter date: The date for which to find the previous week
     
     - returns: The newly created date.
     */
    public func weekBefore(date:NSDate) -> NSDate {
        let previousWeek = self.calendar.dateByAddingUnit(.WeekOfYear, value: -1, toDate: date, options: [])!
        return self.beginningOfWeek(previousWeek)
    }
    
    /**
     Creates a new date at the first second of the week prior to the given date.
     
     - parameter date: The date for which to find the previous week
     
     - returns: The newly created date.
     */
    static public func weekBefore(date:NSDate) -> NSDate {
        return sharedInstance.weekBefore(date)
    }
    
    /**
     Creates a new date at the first second of the week following the given date.
     
     - parameter date: The date for which to find the next week
     
     - returns: The newly created date.
     */
    public func weekAfter(date:NSDate) -> NSDate {
        let nextWeek = self.calendar.dateByAddingUnit(.WeekOfYear, value: 1, toDate: date, options: [])!
        return self.beginningOfWeek(nextWeek)
    }
    
    /**
     Creates a new date at the first second of the week following the given date.
     
     - parameter date: The date for which to find the next week
     
     - returns: The newly created date.
     */
    static public func weekAfter(date:NSDate) -> NSDate {
        return sharedInstance.weekAfter(date)
    }
    
// MARK: months
    /**
     Creates a new date at the first second of the month prior to the given date.
     
     - parameter date: The date for which to find the previous month.
     
     - returns: The newly created date.
     */
    public func monthBefore(date:NSDate) -> NSDate {
        let previousMonth = self.calendar.dateByAddingUnit(.Month, value: -1, toDate: date, options: [])!
        return self.beginningOfMonth(previousMonth)
    }
    
    /**
     Creates a new date at the first second of the month prior to the given date.
     
     - parameter date: The date for which to find the previous month.
     
     - returns: The newly created date.
     */
    static public func monthBefore(date:NSDate) -> NSDate {
        return sharedInstance.monthBefore(date)
    }
    
    /**
     Creates a new date at the first second of the month following the given date.
     
     - parameter date: The date for which to find the next month.
     
     - returns: The newly created date.
     */
    public func monthAfter(date:NSDate) -> NSDate {
        let nextMonth = self.calendar.dateByAddingUnit(.Month, value: 1, toDate: date, options: [])!
        return self.beginningOfMonth(nextMonth)
    }
    
    /**
     Creates a new date at the first second of the month following the given date.
     
     - parameter date: The date for which to find the next month.
     
     - returns: The newly created date.
     */
    static public func monthAfter(date:NSDate) -> NSDate {
        return sharedInstance.monthAfter(date)
    }
    
// MARK: years
    /**
     Creates a new date at the first second of the year prior to the given date.
     
     - parameter date: The date for which to find the previous year.
     
     - returns: The newly created date.
     */
    public func yearBefore(date:NSDate) -> NSDate {
        let previousYear = self.calendar.dateByAddingUnit(.Year, value: -1, toDate: date, options: [])!
        return self.beginningOfYear(previousYear)
    }
    
    /**
     Creates a new date at the first second of the year prior to the given date.
     
     - parameter date: The date for which to find the previous year.
     
     - returns: The newly created date.
     */
    static public func yearBefore(date:NSDate) -> NSDate {
        return sharedInstance.yearBefore(date)
    }
    
    /**
     Creates a new date at the first second of the year following the given date.
     
     - parameter date: The date for which to find the next year.
     
     - returns: The newly created date.
     */
    public func yearAfter(date:NSDate) -> NSDate {
        let nextYear = self.calendar.dateByAddingUnit(.Year, value: 1, toDate: date, options: [])!
        return self.beginningOfYear(nextYear)
    }
    
    /**
     Creates a new date at the first second of the year following the given date.
     
     - parameter date: The date for which to find the next year.
     
     - returns: The newly created date.
     */
    static public func yearAfter(date:NSDate) -> NSDate {
        return sharedInstance.yearAfter(date)
    }
}
