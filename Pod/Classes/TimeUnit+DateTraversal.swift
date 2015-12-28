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
    
    /**************
     *** PLURAL ***
     **************/
    
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
    
    /**************
     *** SINGLE ***
     **************/
    
    /**
    Creates a new date at the first second of the minute prior to the given date.
    
    - parameter date: The date for which to find the previous minute.
    
    - returns: The newly created date.
    */
    public func minuteBefore(date:NSDate) -> NSDate {
        return self.minutesBefore(date)
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
     Creates a new date at the first second of the minute following the given date.
     
     - parameter date: The date for which to calculate the next minute.
     
     - returns: The newly created date.
     */
    public func minuteAfter(date:NSDate) -> NSDate {
        return self.minutesAfter(date)
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
    
    /**************
    *** PLURAL ***
    **************/
    
    /**
    Creates a new date by adding the given number of hours to the given date and
    truncating to the first second of the date's hour.
    
    - parameter date:  The date to which to add hours.
    - parameter delta: The number of hours to be added
    
    - returns: The newly created date.
    */
    public func hoursAfter(date:NSDate, delta: Int = 1) -> NSDate {
        let hour = self.calendar.dateByAddingUnit(.Hour, value: delta, toDate: date, options: [])!
        return self.beginningOfHour(hour)
    }
    
    /**
    Creates a new date by adding the given number of hours to the given date and
    truncating to the first second of the date's hour.
    
    - parameter date:  The date to which to add hours.
    - parameter delta: The number of hours to be added
    
    - returns: The newly created date.
    */
    static public func hoursAfter(date:NSDate, delta: Int = 1) -> NSDate {
        return sharedInstance.hoursAfter(date, delta: delta)
    }
    
    /**
    Creates a new date by subtracting the given number of hours from the given
    date and truncating to the first second of the date's hour.
    
    - parameter date:  The date from which to subtract hours.
    - parameter delta: The number of hours to be subtracted
    
    - returns: The newly created date.
    */
    public func hoursBefore(date:NSDate, delta: Int = 1) -> NSDate {
        return self.hoursAfter(date, delta: -delta)
    }
    
    /**
    Creates a new date by subtracting the given number of hours from the given
    date and truncating to the first second of the date's hour.
    
    - parameter date:  The date from which to subtract hours.
    - parameter delta: The number of hours to be subtracted
    
    - returns: The newly created date.
    */
    static public func hoursBefore(date:NSDate, delta: Int = 1) -> NSDate {
        return sharedInstance.hoursBefore(date, delta: delta)
    }
    
    /**************
    *** SINGLE ***
    **************/
    
    /**
     Creates a new date at the first second of the hour prior to the given date.
     
     - parameter date: The date for which to find the previous hour
     
     - returns: The newly created date.
     */
    public func hourBefore(date:NSDate) -> NSDate {
        return self.hoursBefore(date)
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
        return self.hoursAfter(date)
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
    /**************
    *** PLURAL ***
    **************/
   
    /**
    Creates a new date by adding the given number of days to the given
    date and truncating to the first second of the date's day.
    
    - parameter date:  The date to which to add days.
    - parameter delta: The number of days to be added
    
    - returns: The newly created date.
    */
    public func daysAfter(date:NSDate, delta:Int = 1) -> NSDate {
        let day = self.calendar.dateByAddingUnit(.Day, value: delta, toDate: date, options: [])!
        return self.beginningOfDay(day)
    }
    
    /**
    Creates a new date by adding the given number of days to the given
    date and truncating to the first second of the date's day.
    
    - parameter date:  The date to which to add days.
    - parameter delta: The number of days to be added
    
    - returns: The newly created date.
    */
    static public func daysAfter(date:NSDate, delta:Int = 1) -> NSDate {
        return sharedInstance.daysAfter(date, delta:delta)
    }
    
    /**
    Creates a new date by subtracting the given number of days from the given
    date and truncating to the first second of the date's day.
    
    - parameter date:  The date from which to subtract days.
    - parameter delta: The number of days to be subtracted
    
    - returns: The newly created date.
    */
    public func daysBefore(date:NSDate, delta:Int = 1) -> NSDate {
        return self.daysAfter(date, delta:-delta)
    }
    
    /**
    Creates a new date by subtracting the given number of days from the given
    date and truncating to the first second of the date's day.
    
    - parameter date:  The date from which to subtract days.
    - parameter delta: The number of days to be subtracted
    
    - returns: The newly created date.
    */
    static public func daysBefore(date:NSDate, delta:Int = 1) -> NSDate {
        return sharedInstance.daysBefore(date, delta:delta)
    }
    
    
    /**************
    *** SINGLE ***
    **************/
     
    /**
     Creates a new date at the first second of the day prior to the given date.
     
     - parameter date: The date for which to find the previous day.
     
     - returns: The newly created date.
     */
    public func dayBefore(date:NSDate) -> NSDate {
        return self.daysBefore(date)
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
        return self.daysAfter(date)
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
    
    /**************
     *** PLURAL ***
     **************/
    
    /**
     Creates a new date by adding the given number of weeks to the given
     date and truncating to the first second of the date's week.
    
     - parameter date:  The date to which to add weeks.
     - parameter delta: The number of weeks to be added
    
     - returns: The newly created date.
    */
    public func weeksAfter(date:NSDate, delta:Int = 1) -> NSDate {
        let week = self.calendar.dateByAddingUnit(.WeekOfYear, value: delta, toDate: date, options: [])!
        return self.beginningOfWeek(week)
    }
    
    /**
     Creates a new date by adding the given number of weeks to the given
     date and truncating to the first second of the date's week.
    
     - parameter date:  The date to which to add weeks.
     - parameter delta: The number of weeks to be added
    
     - returns: The newly created date.
    */
    static public func weeksAfter(date:NSDate, delta:Int = 1) -> NSDate {
        return sharedInstance.weeksAfter(date, delta:delta)
    }
    
    /**
     Creates a new date by subtracting the given number of weeks from the given
     date and truncating to the first second of the date's week.
     
     - parameter date:  The date from which to subtract weeks.
     - parameter delta: The number of weeks to be subtracted
     
     - returns: The newly created date.
     */
    public func weeksBefore(date:NSDate, delta:Int = 1) -> NSDate {
        return self.weeksAfter(date, delta:-delta)
    }
    
    /**
     Creates a new date by subtracting the given number of weeks from the given
     date and truncating to the first second of the date's week.
     
     - parameter date:  The date from which to subtract weeks.
     - parameter delta: The number of weeks to be subtracted
     
     - returns: The newly created date.
     */
    static public func weeksBefore(date:NSDate, delta:Int = 1) -> NSDate {
        return sharedInstance.weeksBefore(date, delta:delta)
    }
    
    /**************
     *** SINGLE ***
     **************/
    
    /**
     Creates a new date at the first second of the week prior to the given date.
     
     - parameter date: The date for which to find the previous week
     
     - returns: The newly created date.
     */
    public func weekBefore(date:NSDate) -> NSDate {
        return self.weeksBefore(date)
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
        return self.weeksAfter(date)
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
    
    /**************
     *** PLURAL ***
     **************/
    
    /**
    Creates a new date by adding the given number of months to the given
    date and truncating to the first second of the date's month.
    
    - parameter date:  The date to which to add months.
    - parameter delta: The number of months to be added
    
    - returns: The newly created date.
    */
    public func monthsAfter(date:NSDate, delta:Int = 1) -> NSDate {
        let month = self.calendar.dateByAddingUnit(.Month, value: delta, toDate: date, options: [])!
        return self.beginningOfMonth(month)
    }
    
    /**
     Creates a new date by adding the given number of months to the given
     date and truncating to the first second of the date's month.
     
     - parameter date:  The date to which to add months.
     - parameter delta: The number of months to be added
     
     - returns: The newly created date.
     */
    static public func monthsAfter(date:NSDate, delta:Int = 1) -> NSDate {
        return sharedInstance.monthsAfter(date, delta:delta)
    }
    
    /**
     Creates a new date by subtracting the given number of months from the given
     date and truncating to the first second of the date's months.
     
     - parameter date:  The date from which to subtract months.
     - parameter delta: The number of months to be subtracted
     
     - returns: The newly created date.
     */
    public func monthsBefore(date:NSDate, delta:Int = 1) -> NSDate {
        return self.monthsAfter(date, delta:-delta)
    }
    
    /**
     Creates a new date by subtracting the given number of months from the given
     date and truncating to the first second of the date's month.
     
     - parameter date:  The date from which to add months.
     - parameter delta: The number of months to be subtracted.
     
     - returns: The newly created date.
     */
    static public func monthsBefore(date:NSDate, delta:Int = 1) -> NSDate {
        return sharedInstance.monthsBefore(date, delta:delta)
    }
    
    /**************
     *** SINGLE ***
     **************/
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
    
    /**************
     *** SINGLE ***
     **************/
    
    /**
    Creates a new date by adding the given number of years to the given
    date and truncating to the first second of the date's year.
    
    - parameter date:  The date to which to add years.
    - parameter delta: The number of years to be added.
    
    - returns: The newly created date.
    */
    public func yearsAfter(date:NSDate, delta:Int = 1) -> NSDate {
        let year = self.calendar.dateByAddingUnit(.Year, value: delta, toDate: date, options: [])!
        return self.beginningOfYear(year)
    }
    
    /**
     Creates a new date by adding the given number of years to the given
     date and truncating to the first second of the date's year.
     
     - parameter date:  The date to which to add year.
     - parameter delta: The number of years to be added.
     
     - returns: The newly created date.
     */
    static public func yearsAfter(date:NSDate, delta:Int = 1) -> NSDate {
        return sharedInstance.yearsAfter(date, delta:delta)
    }
    
    /**
     Creates a new date by subtracting the given number of years from the given
     date and truncating to the first second of the date's year.
     
     - parameter date:  The date from which to add years.
     - parameter delta: The number of years to be subtracted.
     
     - returns: The newly created date.
     */
    public func yearsBefore(date:NSDate, delta:Int = 1) -> NSDate {
        return self.yearsAfter(date, delta:-delta)
    }
    
    /**
     Creates a new date by subtracting the given number of years from the given
     date and truncating to the first second of the date's year.
     
     - parameter date:  The date from which to add year.
     - parameter delta: The number of years to be subtracted.
     
     - returns: The newly created date.
     */
    static public func yearsBefore(date:NSDate, delta:Int = 1) -> NSDate {
        return sharedInstance.yearsBefore(date, delta:delta)
    }
    
    
    /**************
     *** SINGLE ***
     **************/
    /**
     Creates a new date at the first second of the year prior to the given date.
     
     - parameter date: The date for which to find the previous year.
     
     - returns: The newly created date.
     */
    public func yearBefore(date:NSDate) -> NSDate {
        return self.yearsBefore(date)
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
        return self.yearsAfter(date)
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
