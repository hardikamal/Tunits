//
//  Date+Boundaries.swift
//  Pods
//
//  Created by Tom on 1/22/16.
//
//

import Foundation

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
}