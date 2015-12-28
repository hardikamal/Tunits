//
//  TimeUnit+DateContains.swift
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
// MARK: - Determining whether date falls within time unit
    /**
    Returns true if the given date falls on or before the start date and on
    or before the end date and false otherwise.
    
    - parameter date:      The date to be tested
    - parameter startDate: The beginning of the time range
    - parameter endDate:   The end of the time range
    
    - returns: true if the date falls on or within the given start and end date,
    false otherwise
    */
    private func dateIsBetween(date:NSDate, startDate:NSDate, endDate:NSDate) -> Bool {
        let beforeStartDate = startDate.compare(date) == .OrderedDescending
        let afterEndDate = endDate.compare(date) == .OrderedAscending
        
        return !beforeStartDate && !afterEndDate
    }
    
    /**
     Returns true if the given date falls within the minute of the given minute
     or false otherwise.
     
     - parameter date:   The date being tested.
     - parameter minute: Any date within the minute of the test range.
     
     - returns: True if the given date falls within the hour or false otherwise.
     */
    public func minuteContainsDate(date:NSDate, minute:NSDate) -> Bool {
        let beginningOfMinute = self.beginningOfMinute(minute)
        let endOfMinute = self.endOfMinute(minute)
        
        return self.dateIsBetween(date, startDate: beginningOfMinute, endDate: endOfMinute)
    }
    
    /**
     Returns true if the given date falls within the minute of the given minute
     or false otherwise.
     
     - parameter date:   The date being tested.
     - parameter minute: Any date within the minute of the test range.
     
     - returns: True if the given date falls within the hour or false otherwise.
     */
    static public func minuteContainsDate(date:NSDate, minute:NSDate) -> Bool {
        return sharedInstance.minuteContainsDate(date, minute: minute)
    }
    
    /**
     Returns true if the given date falls within the hour of the given hour
     or false otherwise.
     
     - parameter date: The date being tested.
     - parameter hour: Any date within the hour of the test range.
     
     - returns: True if the given date falls within the hour or false otherwise.
     */
    public func hourContainsDate(date:NSDate, hour:NSDate) -> Bool {
        let beginningOfHour = self.beginningOfHour(hour)
        let endOfHour = self.endOfHour(hour)
        
        return self.dateIsBetween(date, startDate: beginningOfHour, endDate: endOfHour)
    }
    
    /**
     Returns true if the given date falls within the hour of the given hour
     or false otherwise.
     
     - parameter date: The date being tested
     - parameter hour: Any date within the hour of the test range
     
     - returns: True if the given date falls within the hour or false otherwise
     */
    static public func hourContainsDate(date:NSDate, hour:NSDate) -> Bool {
        return sharedInstance.hourContainsDate(date, hour: hour)
    }
    
    /**
     Returns true if the given date falls within the day of the given day or
     false otherwise. See also NSCalendar.isDate:inSameDayAsDate method for
     similar functionality.
     
     - parameter date: The date being tested.
     - parameter day:  Any date within the day of the test range.
     
     - returns: True if the given date falls wtihin the day or false otherwise.
     */
    public func dayContainsDate(date:NSDate, day:NSDate) -> Bool {
        let beginningOfDay = self.beginningOfDay(day)
        let endOfDay = self.endOfDay(day)
        
        return self.dateIsBetween(date, startDate: beginningOfDay, endDate: endOfDay)
    }
    
    /**
     Returns true if the given date falls within the day of the given day or
     false otherwise. See also NSCalendar.isDate:inSameDayAsDate method for
     similar functionality.
     
     - parameter date: The date being tested.
     - parameter day:  Any date within the day of the test range.
     
     - returns: True if the given date falls wtihin the day or false otherwise.
     */
    static public func dayContainsDate(date:NSDate, day:NSDate) -> Bool {
        return sharedInstance.dayContainsDate(date, day: day)
    }
    
    /**
     Returns true if the given date falls within the week of the given week or
     false otherwise.
     
     - parameter date: The date being tested.
     - parameter week: Any date within the week of the test range.
     
     - returns: True if the given date falls within the week or false otherwise.
     */
    public func weekContainsDate(date:NSDate, week:NSDate) -> Bool {
        let beginningOfWeek = self.beginningOfWeek(week)
        let endOfWeek = self.endOfWeek(week)
        
        return self.dateIsBetween(date, startDate: beginningOfWeek, endDate: endOfWeek)
    }
    
    /**
     Returns true if the given date falls within the week of the given week or
     false otherwise.
     
     - parameter date: The date being tested.
     - parameter week: Any date within the week of the test range.
     
     - returns: True if the given date falls within the week or false otherwise.
     */
    static public func weekContainsDate(date:NSDate, week:NSDate) -> Bool {
        return sharedInstance.weekContainsDate(date, week: week)
    }
    
    /**
     Returns true if the given date falls within the day of the given month
     or false otherwise.
     
     - parameter date:  The date being tested.
     - parameter month: Any date within the month of the test range.
     
     - returns: True if the given date falls within the month or false otherwise.
     */
    public func monthContainsDate(date:NSDate, month:NSDate) -> Bool {
        let beginningOfMonth = self.beginningOfMonth(month)
        let endOfMonth = self.endOfMonth(month)
        
        return self.dateIsBetween(date, startDate: beginningOfMonth, endDate: endOfMonth)
    }
    
    /**
     Returns true if the given date falls within the day of the given month
     or false otherwise.
     
     - parameter date:  The date being tested.
     - parameter month: Any date within the month of the test range.
     
     - returns: True if the given date falls within the month or false otherwise.
     */
    static public func monthContainsDate(date:NSDate, month:NSDate) -> Bool {
        return sharedInstance.monthContainsDate(date, month: month)
    }
    
    /**
     Returns true if the given date falls within the year of the given year
     or false otherwise.
     
     - parameter date: The date being tested.
     - parameter year: Any date within the year of the test range.
     
     - returns: True if the given date falls wtihin the year or false otherwise.
     */
    public func yearContainsDate(date:NSDate, year:NSDate) -> Bool {
        let beginningOfYear = self.beginningOfYear(year)
        let endOfYear = self.endOfYear(year)
        
        return self.dateIsBetween(date, startDate: beginningOfYear, endDate: endOfYear)
    }
    
    /**
     Returns true if the given date falls within the year of the given year
     or false otherwise.
     
     - parameter date: The date being tested.
     - parameter year: Any date within the year of the test range.
     
     - returns: True if the given date falls wtihin the year or false otherwise.
     */
    static public func yearContainsDate(date:NSDate, year:NSDate) -> Bool {
        return sharedInstance.yearContainsDate(date, year: year)
    }
}
