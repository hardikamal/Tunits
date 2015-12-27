//
//  TimeUnitTestsUtilities.swift
//  Tunits
//
//  Created by Tom on 12/27/15.
//  Copyright © 2015 CocoaPods. All rights reserved.
//

import Foundation
import Tunits

public class TimeUnitTestsUtilities : NSObject {
    public enum Weekday : Int {
        case Sunday = 1
        case Monday = 2
        case Tuesday = 3
        case Wednesday = 4
        case Thursday = 5
        case Friday = 6
        case Saturday = 7
    }
    
    public func timeUnitWithCalendarWithMondayAsFirstWeekday() -> TimeUnit {
        return self.timeUnitWithCalendarWithFirstWeekday(Weekday.Monday);
    }
    
    public func timeUnitWithCalendarWithSundayAsFirstWeekday() -> TimeUnit {
        return self.timeUnitWithCalendarWithFirstWeekday(Weekday.Sunday);
    }
    
    public func timeUnitWithCalendarWithFirstWeekday(weekday : Weekday) -> TimeUnit {
        let tunit = TimeUnit()
        tunit.calendar = self.calendarWithFirstWeekday(weekday)
        return tunit
    }
    
    public func calendarWithSundayAsFirstWeekday() -> NSCalendar {
        return self.calendarWithFirstWeekday(Weekday.Sunday)
    }
    
    public func calendarWithMondayAsFirstWeekday() -> NSCalendar {
        return self.calendarWithFirstWeekday(Weekday.Monday)
    }
    
    public func calendarWithFirstWeekday(weekday: Weekday) -> NSCalendar {
        let calendar = NSCalendar.currentCalendar()
        calendar.firstWeekday = weekday.rawValue
        return calendar
    }
}