//
//  DateExtensions.swift
//  Pods
//
//  Created by Tom on 10/19/15.
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

/// Adds TimeUnit functionality to date objects, allowing method chaining.
extension NSDate {
    
// MARK: - Next and previous time unit
// MARK: Minutes
    /**
    Creates a new date at the beginning of the minute found by subtracting the
    given number of minutes from the receiver.
    
    - parameter delta: The number of minutes to subtract from the receiver.
    
    - returns: The newly created date.
    */
    public func minutesBefore(delta: Int = 1) -> NSDate {
        return TimeUnit.minutesBefore(self, delta: delta);
    }
    
    /**
    Creates a new date at the beginning of the minute found by adding the
    given number of minutes to the receiver.
    
    - parameter delta: The number of minutes to add to the receiver.
    
    - returns: The newly created date.
    */
    public func minutesAfter(delta: Int = 1) -> NSDate {
        return TimeUnit.minutesAfter(self, delta: delta);
    }
    
    /**
    Creates a new date at the first second of the minute prior to the receiver.
    
    - returns: The newly created date representing the first second of the
    minute prior to the receiver.
    */
    public func minuteBefore() -> NSDate {
        return TimeUnit.minuteBefore(self)
    }
    
    /**
    Creates a new date at the first second of the minute following the receiver.
    
    - returns: The newly created date representing the first second of the
    minute following the receiver.
    */
    public func minuteAfter() -> NSDate {
        return TimeUnit.minuteAfter(self)
    }
    
// MARK: Hours
    
    /**
    Creates a new date at the beginning of the hour found by subtracting the
    given number of hours from the receiver.
    
    - parameter delta: The number of hours to subtract from the receiver.
    
    - returns: The newly created date.
    */
    public func hoursBefore(delta: Int = 1) -> NSDate {
        return TimeUnit.hoursBefore(self, delta: delta);
    }
    
    /**
     Creates a new date at the beginning of the hour found by adding the
     given number of hours to the receiver.
     
     - parameter delta: The number of hours to add to the receiver.
     
     - returns: The newly created date.
     */
    public func hoursAfter(delta: Int = 1) -> NSDate {
        return TimeUnit.hoursAfter(self, delta: delta);
    }
    
    /**
    Creates a new date at the first second of the hour prior to the receiver.
    
    - returns: The newly created date representing the first second of the
    hour prior to the receiver.
    */
    public func hourBefore() -> NSDate {
        return TimeUnit.hourBefore(self)
    }
    
    /**
    Creates a new date at the first second of the hour following the receiver.
    
    - returns: The newly created date representing the first second of the
    hour following the receiver.
    */
    public func hourAfter() -> NSDate {
        return TimeUnit.hourAfter(self)
    }
    
// MARK: Days
    
    /**
    Creates a new date at the beginning of the day found by subtracting the
    given number of days from the receiver.
    
    - parameter delta: The number of days to subtract from the receiver.
    
    - returns: The newly created date.
    */
    public func daysBefore(delta: Int = 1) -> NSDate {
        return TimeUnit.daysBefore(self, delta: delta);
    }
    
    /**
     Creates a new date at the beginning of the day found by adding the
     given number of days to the receiver.
     
     - parameter delta: The number of days to add to the receiver.
     
     - returns: The newly created date.
     */
    public func daysAfter(delta: Int = 1) -> NSDate {
        return TimeUnit.daysAfter(self, delta: delta);
    }
    
    /**
    Creates a new date at the first second of the day prior to the receiver.
    
    - returns: The newly created date representing the first second of the
    day prior to the receiver.
    */
    public func dayBefore() -> NSDate {
        return TimeUnit.dayBefore(self)
    }
    
    /**
    Creates a new date at the first second of the day following the receiver.
    
    - returns: The newly created date representing the first second of the
    day following the receiver.
    */
    public func dayAfter() -> NSDate {
        return TimeUnit.dayAfter(self)
    }
    
// MARK: Weeks
    
    /**
    Creates a new date at the beginning of the week found by subtracting the
    given number of weeks from the receiver.
    
    - parameter delta: The number of weeks to subtract from the receiver.
    
    - returns: The newly created date.
    */
    public func weeksBefore(delta: Int = 1) -> NSDate {
        return TimeUnit.weeksBefore(self, delta: delta);
    }
    
    /**
     Creates a new date at the beginning of the week found by adding the
     given number of weeks to the receiver.
     
     - parameter delta: The number of weeks to add to the receiver.
     
     - returns: The newly created date.
     */
    public func weeksAfter(delta: Int = 1) -> NSDate {
        return TimeUnit.weeksAfter(self, delta: delta);
    }
    
    /**
    Creates a new date at the first second of the week prior to the receiver.
    
    - returns: The newly created date representing the first second of the
    week prior to the receiver.
    */
    public func weekBefore() -> NSDate {
        return TimeUnit.weekBefore(self)
    }
    
    /**
    Creates a new date at the first second of the week following the receiver.
    
    - returns: The newly created date representing the first second of the
    week following the receiver.
    */
    public func weekAfter() -> NSDate {
        return TimeUnit.weekAfter(self)
    }
    
// MARK: Months
    
    /**
    Creates a new date at the beginning of the month found by subtracting the
    given number of months from the receiver.
    
    - parameter delta: The number of months to subtract from the receiver.
    
    - returns: The newly created date.
    */
    public func monthsBefore(delta: Int = 1) -> NSDate {
        return  TimeUnit.monthsBefore(self, delta: delta);
    }
    
    /**
     Creates a new date at the beginning of the month found by adding the
     given number of months to the receiver.
     
     - parameter delta: The number of months to add to the receiver.
     
     - returns: The newly created date.
     */
    public func monthsAfter(delta: Int = 1) -> NSDate {
        return TimeUnit.monthsAfter(self, delta: delta);
    }
    
    /**
    Creates a new date at the first second of the month prior to the receiver.
    
    - returns: The newly created date representing the first second of the
    month prior to the receiver.
    */
    public func monthBefore() -> NSDate {
        return TimeUnit.monthBefore(self)
    }
    
    /**
    Creates a new date at the first second of the month following the receiver.
    
    - returns: The newly created date representing the first second of the
    month following the receiver.
    */
    public func monthAfter() -> NSDate {
        return TimeUnit.monthAfter(self)
    }
    
// MARK: Years
    
    /**
    Creates a new date at the beginning of the year found by subtracting the
    given number of years from the receiver.
    
    - parameter delta: The number of years to subtract from the receiver.
    
    - returns: The newly created date.
    */
    public func yearsBefore(delta: Int = 1) -> NSDate {
        return TimeUnit.yearsBefore(self, delta: delta);
    }
    
    /**
     Creates a new date at the beginning of the year found by adding the
     given number of hours to the receiver.
     
     - parameter delta: The number of years to add to the receiver.
     
     - returns: The newly created date.
     */
    public func yearsAfter(delta: Int = 1) -> NSDate {
        return TimeUnit.yearsAfter(self, delta: delta);
    }
    
    /**
    Creates a new date at the first second of the year prior to the receiver.
    
    - returns: The newly created date representing the first second of the
    year prior to the receiver.
    */
    public func yearBefore() -> NSDate {
        return TimeUnit.yearBefore(self)
    }
    
    /**
    Creates a new date at the first second of the year following the receiver.
    
    - returns: The newly created date representing the first second of the
    year following the receiver.
    */
    public func yearAfter() -> NSDate {
        return TimeUnit.yearAfter(self)
    }
}