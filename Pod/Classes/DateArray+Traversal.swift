//
//  DateArray+Traversal.swift
//  Pods
//
//  Created by Tom on 1/22/16.
//
//

import Foundation


extension Array where Element : NSDate {
    
    /**
     Creates a new array by iterating across the receiver and performing the 
     given traversal function on each date with the given delta.
     
     - parameter delta: The number of units of time to add or subtract from each
                        date in the receiver. Default is 1.
     - parameter f:     The function used to subtract or add units of time from
                        each date in the receiver.
     
     - returns:         The newly created array of dates
     */
    private func foldTraversal(delta: Int = 1, f: (NSDate, Int) -> NSDate) -> [NSDate] {
        var dates : [NSDate] = []
        for date: NSDate in self {
            dates.append(f(date, delta))
        }
        
        return dates
    }
    
    
// MARK: - Minutes
    
    /**
     Creates a new array by subtracting the given number of minutes from each 
     date in the receiver.
     
     - parameter delta: The number of minutes to subtract.
     
     - returns:         The newly created array of dates.
     */
    public func minutesBefore(delta:Int = 1) -> [NSDate] {
        return self.foldTraversal(delta, f: TimeUnit.minutesBefore)
    }
    
    /**
     Creates a new array by adding the given number of minutes to each date in 
     the receiver.
     
     - parameter delta: The number of minutes to add.
     
     - returns:         The newly created array of dates.
     */
    public func minutesAfter(delta:Int = 1) -> [NSDate] {
        return self.foldTraversal(delta, f: TimeUnit.minutesAfter)
    }
    
    /**
     Creates a new array of dates at the first second of the minute prior to 
     the corresponding date in the receiver.
     
     - returns: The newly created array of dates.
     */
    public func minuteBefore() -> [NSDate] {
        return self.foldTraversal(1, f: TimeUnit.minutesBefore)
    }
    
    /**
     Creates a new array of dates at the first second of the minute following 
     the corresponding date in the receiver.
     
     - returns: The newly created array of dates.
     */
    public func minuteAfter() -> [NSDate] {
        return self.foldTraversal(1, f: TimeUnit.minutesAfter)
    }
    
    
// MARK: - Hours
    
    /**
    Creates a new array of dates at the first second of the hour found by 
    subtracting the given number of hours from each date in the receiver.
    
    - parameter delta:  The number of hours to be subtracted.
    
    - returns:          The newly created array of dates.
    */
    public func hoursBefore(delta:Int = 1) -> [NSDate] {
        return self.foldTraversal(delta, f: TimeUnit.hoursBefore)
    }
    
    /**
     Creates a new array of dates at the first second of the hour found by 
     adding the given number of hours to each date in the receiver.
     
     - parameter delta: The number of hours to add.
     
     - returns:         The newly created array of dates.
     */
    public func hoursAfter(delta:Int = 1) -> [NSDate] {
        return self.foldTraversal(delta, f: TimeUnit.hoursAfter)
    }
    
    /**
     Creates a new array of dates at the first second of the hour found by 
     subtracting an hour from each date in the receiver.
     
     - returns: The newly created array of dates.
     */
    public func hourBefore() -> [NSDate] {
        return self.foldTraversal(1, f: TimeUnit.hoursBefore)
    }
    
    /**
     Creates a new array of dates at the first second of the hour found by 
     adding an hour to each date in the receiver.
     
     - returns: The newly created array of dates.
     */
    public func hourAfter() -> [NSDate] {
        return self.foldTraversal(1, f: TimeUnit.hoursAfter)
    }
    
    
// MARK: - Days
    
    /**
    Creates a new array of dates at the first second of the day found by
    subtracting the given number of days from each date in the receiver.

    - parameter delta:  The number of days to be subtracted.

    - returns:          The newly created array of dates.
    */
    public func daysBefore(delta:Int = 1) -> [NSDate] {
        return self.foldTraversal(delta, f: TimeUnit.daysBefore)
    }
    
    /**
     Creates a new array of dates at the first second of the day found by
     adding the given number of days to each date in the receiver.
     
     - parameter delta: The number of days to be added.
     
     - returns:         The newly created array of dates.
     */
    public func daysAfter(delta:Int = 1) -> [NSDate] {
        return self.foldTraversal(delta, f: TimeUnit.daysAfter)
    }
    
    /**
     Creates a new array of dates at the first second of the day found by 
     subtracting a day from each date in the receiver.
     
     - returns: The newly created array of dates.
     */
    public func dayBefore() -> [NSDate] {
        return self.foldTraversal(1, f: TimeUnit.daysBefore)
    }
    
    /**
     Creates a new array of dates at the first second of the day found by adding
     a day to each date in the receiver.
     
     - returns: The newly created array of dates.
     */
    public func dayAfter() -> [NSDate] {
        return self.foldTraversal(1, f: TimeUnit.daysAfter)
    }
    
    
// MARK: - Weeks
    
    /**
    Creates a new array of dates at the first second of the week found by 
    subtracting the given number of weeks from each date in the receiver.
    
    - parameter delta:  The number of weeks to subtract.
    
    - returns:          The newly created array of dates.
    */
    public func weeksBefore(delta:Int = 1) -> [NSDate] {
        return self.foldTraversal(delta, f: TimeUnit.weeksBefore)
    }
    
    /**
     Creates a new array of dates at the first second of the week found by 
     adding the given number of weeks to each date in the receiver.
     
     - parameter delta: The number of weeks to add.
     
     - returns:         The newly created array of dates.
     */
    public func weeksAfter(delta:Int = 1) -> [NSDate] {
        return self.foldTraversal(delta, f: TimeUnit.weeksAfter)
    }
    
    /**
     Creates a new array of dates at the first second of the week found by
     subtracting a week from each date in the receiver.
     
     - returns: The newly created array of dates.
     */
    public func weekBefore() -> [NSDate] {
        return self.foldTraversal(1, f: TimeUnit.weeksBefore)
    }
    
    /**
     Creates a new array of dates at the first second of the week found by 
     adding a week to each date in the receiver.
     
     - returns: The newly created array of dates.
     */
    public func weekAfter() -> [NSDate] {
        return self.foldTraversal(1, f: TimeUnit.weeksAfter)
    }
    
    
// MARK: - Months
    
    /**
    Creates a new array of dates at the first second of the month found by 
    subtracting the given number of dates from each date in the receiver.
    
    - parameter delta:  The number of weeks to be subtracted.
    
    - returns:          The newly created array of dates.
    */
    public func monthsBefore(delta:Int = 1) -> [NSDate] {
        return self.foldTraversal(delta, f: TimeUnit.monthsBefore)
    }
    
    /**
     Creates a new array of dates at the first second of the month found by 
     adding the given number of months to each date in the receiver.
     
     - parameter delta: The number of months to be added.
     
     - returns:         The newly created array of dates.
     */
    public func monthsAfter(delta:Int = 1) -> [NSDate] {
        return self.foldTraversal(delta, f: TimeUnit.monthsAfter)
    }
    
    /**
     Creates a new array of dates at the first second of the month found by 
     subtracting a month from each date in the receiver.
     
     - returns: The newly created array of dates.
     */
    public func monthBefore() -> [NSDate] {
        return self.foldTraversal(1, f: TimeUnit.monthsBefore)
    }
    
    /**
     Creates a new array of dates at the first second of the month found by 
     adding a month to each date in the receiver.
     
     - returns: The newly created array of dates.
     */
    public func monthAfter() -> [NSDate] {
        return self.foldTraversal(1, f: TimeUnit.monthsAfter)
    }
    
    
// MARK: - Years
    
    /**
    Creates a new array of dates at the first second of the year found by 
    subtracting the given number of years from each date in the receiver.
    
    - parameter delta:  The number of years to subtract.
    
    - returns:          The newly created array of dates.
    */
    public func yearsBefore(delta:Int = 1) -> [NSDate] {
        return self.foldTraversal(delta, f: TimeUnit.yearsBefore)
    }
    
    /**
     Creates a new array of dates at the first second of the year found by 
     adding the given number of years to each date in the receiver.
     
     - parameter delta: The number of years to be added.
     
     - returns:         The newly created array of dates.
     */
    public func yearsAfter(delta:Int = 1) -> [NSDate] {
        return self.foldTraversal(delta, f: TimeUnit.yearsAfter)
    }
    
    /**
     Creates a new array of dates at the first second of the year found by 
     subtracting a year from each date in the receiver.
     
     - returns: The newly created array of dates.
     */
    public func yearBefore() -> [NSDate] {
        return self.foldTraversal(1, f: TimeUnit.yearsBefore)
    }
    
    /**
     Creates a new array of dates at the first second of the year found by 
     adding a year to each date in the receiver.
     
     - returns: The newly created array of dates.
     */
    public func yearAfter() -> [NSDate] {
        return self.foldTraversal(1, f: TimeUnit.yearsAfter)
    }
}
