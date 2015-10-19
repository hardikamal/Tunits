//
//  DateExtensions.swift
//  Pods
//
//  Created by Tom on 10/19/15.
//
//

import Foundation
import Tunits

/// Adds TimeUnit functionality to date objects, allowing method chaining.
extension NSDate {
    
    // MARK: - Beginning of time unit
    /**
    Creates a new date at the first second of the same minute as the recevier.
    
    - returns: The newly created date representing the first second of the same
    minute as the receiver.
    */
    public func beginningOfMinute() -> NSDate {
        return TimeUnit.beginningOfMinute(self)
    }
    
    /**
    Creates a new date at the first second of the same hour as the receiver.
    
    - returns: The newly created date representing the first second of the
    same hour as the receiver.
    */
    public func beginningOfHour() -> NSDate {
        return TimeUnit.beginningOfHour(self)
    }
    
    /**
    Creates a new date at the first second of the same day as the receiver.
    
    - returns: The newly created date representing the first second of the
    same day as the receiver.
    */
    public func beginningOfDay() -> NSDate {
        return TimeUnit.beginningOfDay(self)
    }
    
    /**
    Creates a new date at the first second of the same week as the receiver.
    
    - returns: The newly created date representing the first second of the
    same week as the receiver.
    */
    public func beginningOfWeek() -> NSDate {
        return TimeUnit.beginningOfWeek(self)
    }
    
    /**
    Creates a new date at the first second of the same month as the receiver.
    
    - returns: The newly created date representing the first second of the
    same month as the receiver.
    */
    public func beginningOfMonth() -> NSDate {
        return TimeUnit.beginningOfMonth(self)
    }
    
    /**
    Creates a new date at the first second of the same year as the receiver.
    
    - returns: The newly created date representing the first second of the
    same year as the receiver.
    */
    public func beginningOfYear() -> NSDate {
        return TimeUnit.beginningOfYear(self)
    }
    
    // MARK: - End of time unit
    
    /**
    Creates a new date at the last second of the same minute as the receiver.
    
    - returns: The newly created date representing the last second of the
    same minute as the receiver.
    */
    public func endOfMinute() -> NSDate {
        return TimeUnit.endOfMinute(self)
    }
    
    /**
    Creates a new date at the last second of the same hour as the receiver.
    
    - returns: The newly created date representing the last second of the
    same hour as the receiver.
    */
    public func endOfHour() -> NSDate {
        return TimeUnit.endOfHour(self)
    }
    
    /**
    Creates a new date at the last second of the same day as the receiver.
    
    - returns: The newly created date representing the last second of the
    same day as the receiver.
    */
    public func endOfDay() -> NSDate {
        return TimeUnit.endOfDay(self)
    }
    
    /**
    Creates a new date at the last second of the same week as the receiver.
    
    - returns: The newly created date representing the last second of the
    same week as the receiver.
    */
    public func endOfWeek() -> NSDate {
        return TimeUnit.endOfWeek(self)
    }
    
    /**
    Creates a new date at the last second of the same month as the receiver.
    
    - returns: The newly created date representing the last second of the
    same month as the receiver.
    */
    public func endOfMonth() -> NSDate {
        return TimeUnit.endOfMonth(self)
    }
    
    /**
    Creates a new date at the last second of the same year as the receiver.
    
    - returns: The newly created date representing the last second of the
    same year as the receiver.
    */
    public func endOfYear() -> NSDate {
        return TimeUnit.endOfYear(self)
    }
    
    
    // MARK: - Next and previous time unit
    
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