//
//  TimeUnitTests.swift
//  Tunits
//
//  Created by Tom on 9/4/15.
//  Copyright (c) 2015 CocoaPods. All rights reserved.
//
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import Tunits
import XCTest

class TimeUnitTests: XCTestCase {
    private var dateFormatter : NSDateFormatter = NSDateFormatter()
    
    private var utilities : TimeUnitTestsUtilities = TimeUnitTestsUtilities()
    
    override func setUp() {
        self.dateFormatter = NSDateFormatter()
        self.dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    }
    
    func testTimeUnitCanBeInitialized() {
        XCTAssertNotNil(TimeUnit())
    }
    
// MARK: - Beginning of Time Units
// MARK: Beginning of Minute
    func testCalculatingBeginningOfAMinuteFromBeginningOfMinute() {
        let beginningOf7AM = self.dateFormatter.dateFromString("2015-09-08 7:00:00")!
        
        XCTAssertEqual(beginningOf7AM, TimeUnit().beginningOfMinute(beginningOf7AM))
        XCTAssertEqual(beginningOf7AM, TimeUnit.beginningOfMinute(beginningOf7AM))
    }
    
    func testCalculatingBeginningOfAMinuteFromMiddleOfMinute() {
        let beginningOf7AM = self.dateFormatter.dateFromString("2015-09-08 7:00:00")!
        let middleOf7_00AM = self.dateFormatter.dateFromString("2015-09-08 7:00:30")!
        
        XCTAssertEqual(beginningOf7AM, TimeUnit().beginningOfMinute(middleOf7_00AM))
        XCTAssertEqual(beginningOf7AM, TimeUnit.beginningOfMinute(middleOf7_00AM))
    }
    
// MARK: Beginning of hour
    func testCalculatingBeginningOfAnHourFromBeginningOfHour() {
        let beginningOf7AM = self.dateFormatter.dateFromString("2015-09-08 7:00:00")!
        
        XCTAssertEqual(beginningOf7AM, TimeUnit().beginningOfHour(beginningOf7AM))
        XCTAssertEqual(beginningOf7AM, TimeUnit.beginningOfHour(beginningOf7AM))
    }
    
    func testCalculatingBeginningOfAnHourFromMiddleOfHour() {
        let beginningOf7AM = self.dateFormatter.dateFromString("2015-09-08 7:00:00")!
        let middleOf7AM = self.dateFormatter.dateFromString("2015-09-08 7:30:00")!
        
        XCTAssertEqual(beginningOf7AM, TimeUnit().beginningOfHour(middleOf7AM))
        XCTAssertEqual(beginningOf7AM, TimeUnit.beginningOfHour(middleOf7AM))
    }
    
    
// MARK: Beginning of day
    func testCalculatingBeginningOfDayFromBeginningOfDay() {
        let beginningOfSeptember8_2015 = self.dateFormatter.dateFromString("2015-09-08 00:00:00")!
        
        XCTAssertEqual(beginningOfSeptember8_2015, TimeUnit().beginningOfDay(beginningOfSeptember8_2015))
        XCTAssertEqual(beginningOfSeptember8_2015 , TimeUnit.beginningOfDay(beginningOfSeptember8_2015))
    }
    
    func testCalculatingBeginningOfDayFromMiddleOfDay() {
        let beginningOfSeptember8_2015 = self.dateFormatter.dateFromString("2015-09-08 00:00:00")!
        let middleOfSeptember8_2015 = self.dateFormatter.dateFromString("2015-09-08 12:00:00")!
        
        XCTAssertEqual(beginningOfSeptember8_2015, TimeUnit().beginningOfDay(middleOfSeptember8_2015))
        XCTAssertEqual(beginningOfSeptember8_2015 , TimeUnit.beginningOfDay(middleOfSeptember8_2015))
    }
    
    
// MARK: Beginning of week
    
    func testCalculatingBeginningOfWeekFromBeginningOfWeekWithSundayAsFirstWeekday() {
        let beginningOfSeptember20_2015 = self.dateFormatter.dateFromString("2015-09-20 00:00:00")!
        
        XCTAssertEqual(beginningOfSeptember20_2015, self.utilities.timeUnitWithCalendarWithSundayAsFirstWeekday().beginningOfWeek(beginningOfSeptember20_2015))
        XCTAssertEqual(beginningOfSeptember20_2015, TimeUnit.setStaticCalendar(self.utilities.calendarWithSundayAsFirstWeekday()).beginningOfWeek(beginningOfSeptember20_2015))
    }
    
    func testCalculatingBeginningOfWeekFromBeginningOfWeekWithMondayAsFirstWeekday() {
        let beginningOfSeptember21_2015 = self.dateFormatter.dateFromString("2015-09-21 00:00:00")!
        
        XCTAssertEqual(beginningOfSeptember21_2015, self.utilities.timeUnitWithCalendarWithMondayAsFirstWeekday().beginningOfWeek(beginningOfSeptember21_2015))
        XCTAssertEqual(beginningOfSeptember21_2015, TimeUnit.setStaticCalendar(self.utilities.calendarWithMondayAsFirstWeekday()).beginningOfWeek(beginningOfSeptember21_2015))
    }
    
    func testCalculatingBeginningOfWeekFromMiddleOfWeekWithSundayAsFirstWeekday() {
        let beginningOfSeptember20_2015 = self.dateFormatter.dateFromString("2015-09-20 00:00:00")!
        let middleOfSeptember23_2015 = self.dateFormatter.dateFromString("2015-09-23 12:00:00")!
        
        XCTAssertEqual(beginningOfSeptember20_2015, self.utilities.timeUnitWithCalendarWithSundayAsFirstWeekday().beginningOfWeek(middleOfSeptember23_2015))
        XCTAssertEqual(beginningOfSeptember20_2015, TimeUnit.setStaticCalendar(self.utilities.calendarWithSundayAsFirstWeekday()).beginningOfWeek(middleOfSeptember23_2015))
    }
    
    func testCalculatingBeginningOfWeekFromMiddleOfWeekWithMondayAsFirstWeekday() {
        let beginningOfSeptember21_2015 = self.dateFormatter.dateFromString("2015-09-21 00:00:00")!
        let middleOfSeptember23_2015 = self.dateFormatter.dateFromString("2015-09-23 12:00:00")!
        
        XCTAssertEqual(beginningOfSeptember21_2015, self.utilities.timeUnitWithCalendarWithMondayAsFirstWeekday().beginningOfWeek(middleOfSeptember23_2015))
        XCTAssertEqual(beginningOfSeptember21_2015, TimeUnit.setStaticCalendar(self.utilities.calendarWithMondayAsFirstWeekday()).beginningOfWeek(middleOfSeptember23_2015))
    }
    
// MARK: Beginning of month
    func testCalculatingBeginningOfMonthFromBeginningOfMonth() {
        let beginningOfSeptember_2015 = self.dateFormatter.dateFromString("2015-09-01 00:00:00")!
        
        XCTAssertEqual(beginningOfSeptember_2015, TimeUnit().beginningOfMonth(beginningOfSeptember_2015))
        XCTAssertEqual(beginningOfSeptember_2015, TimeUnit.beginningOfMonth(beginningOfSeptember_2015))
    }
    
    func testCalculatingBeginningOfMonthFromMiddleOfMonth() {
        let beginningOfSeptember_2015 = self.dateFormatter.dateFromString("2015-09-01 00:00:00")!
        let middleOfSeptember_2015 = self.dateFormatter.dateFromString("2015-09-15 12:00:00")!
        
        XCTAssertEqual(beginningOfSeptember_2015, TimeUnit().beginningOfMonth(middleOfSeptember_2015))
        XCTAssertEqual(beginningOfSeptember_2015, TimeUnit.beginningOfMonth(middleOfSeptember_2015))
    }
    
// MARK: Beginning of year
    
    func testCalculatingBeginningOfYearFromBeginningOfYear() {
        let beginningOf2015 = self.dateFormatter.dateFromString("2015-01-01 00:00:00")!
        
        XCTAssertEqual(beginningOf2015, TimeUnit().beginningOfYear(beginningOf2015))
        XCTAssertEqual(beginningOf2015, TimeUnit.beginningOfYear(beginningOf2015))
    }
    
    func testCalculatingBeginningOfYearFromMiddleOfYear() {
        let beginningOf2015 = self.dateFormatter.dateFromString("2015-01-01 00:00:00")!
        let middleOf2015 = self.dateFormatter.dateFromString("2015-07-01 00:00:00")!
        
        XCTAssertEqual(beginningOf2015, TimeUnit().beginningOfYear(middleOf2015))
        XCTAssertEqual(beginningOf2015, TimeUnit.beginningOfYear(middleOf2015))
    }
    
    
// MARK: - End of time units
// MARK: End of minute
    func testCalculatingEndOfMinuteFromEndOfMinute() {
        let endOf5_00PM = self.dateFormatter.dateFromString("2015-09-08 17:00:59")!
        
        XCTAssertEqual(endOf5_00PM, TimeUnit().endOfMinute(endOf5_00PM))
        XCTAssertEqual(endOf5_00PM, TimeUnit.endOfMinute(endOf5_00PM))
    }
    
    func testCalculatingEndOfMinuteFromMiddleOfMinute() {
        let endOf5_00PM = self.dateFormatter.dateFromString("2015-09-08 17:00:59")!
        let middleOf5_00PM = self.dateFormatter.dateFromString("2015-09-08 17:00:30")!
        
        XCTAssertEqual(endOf5_00PM, TimeUnit().endOfMinute(middleOf5_00PM))
        XCTAssertEqual(endOf5_00PM, TimeUnit.endOfMinute(middleOf5_00PM))
    }
    
// MARK: End of hour
    func testCalculatingEndOfHourFromEndOfHour() {
        let endOf5PM = self.dateFormatter.dateFromString("2015-09-08 17:59:59")!
        
        XCTAssertEqual(endOf5PM, TimeUnit().endOfHour(endOf5PM))
        XCTAssertEqual(endOf5PM, TimeUnit.endOfHour(endOf5PM))
    }
    
    func testCalculatingEndOfHourFromMiddleOfHour() {
        let endOf5PM = self.dateFormatter.dateFromString("2015-09-08 17:59:59")!
        let middleOf5PM = self.dateFormatter.dateFromString("2015-09-08 17:30:00")!
        
        XCTAssertEqual(endOf5PM, TimeUnit().endOfHour(middleOf5PM))
        XCTAssertEqual(endOf5PM, TimeUnit.endOfHour(middleOf5PM))
    }
    
// MARK: End of day
    func testCalculatingEndOfDayFromEndOfDay() {
        let endOfSeptember8_2015 = self.dateFormatter.dateFromString("2015-09-08 23:59:59")!
        
        XCTAssertEqual(endOfSeptember8_2015, TimeUnit().endOfDay(endOfSeptember8_2015))
        XCTAssertEqual(endOfSeptember8_2015, TimeUnit.endOfDay(endOfSeptember8_2015))
    }
    
    func testCalculatingEndOfDayFromMiddleOfDay() {
        let endOfSeptember8_2015 = self.dateFormatter.dateFromString("2015-09-08 23:59:59")!
        let middleOfSeptember8_2015 = self.dateFormatter.dateFromString("2015-09-08 12:00:00")!
        
        XCTAssertEqual(endOfSeptember8_2015, TimeUnit().endOfDay(endOfSeptember8_2015))
        XCTAssertEqual(endOfSeptember8_2015, TimeUnit.endOfDay(middleOfSeptember8_2015))
    }
    
// MARK: End of week
    
    func testCalculatingEndOfWeekFromEndOfWeekWithSundayAsFirstWeekday() {
        let endOfSeptember26_2015 = self.dateFormatter.dateFromString("2015-09-26 23:59:59")!
        
        XCTAssertEqual(endOfSeptember26_2015, self.utilities.timeUnitWithCalendarWithSundayAsFirstWeekday().endOfWeek(endOfSeptember26_2015))
        XCTAssertEqual(endOfSeptember26_2015, TimeUnit.setStaticCalendar(self.utilities.calendarWithSundayAsFirstWeekday()).endOfWeek(endOfSeptember26_2015))
    }
    
    func testCalculatingEndOfWeekFromEndOfWeekWithMondayAsFirstWeekday() {
        let endOfSeptember27_2015 = self.dateFormatter.dateFromString("2015-09-27 23:59:59")!
        
        XCTAssertEqual(endOfSeptember27_2015, self.utilities.timeUnitWithCalendarWithMondayAsFirstWeekday().endOfWeek(endOfSeptember27_2015))
        XCTAssertEqual(endOfSeptember27_2015, TimeUnit.setStaticCalendar(self.utilities.calendarWithMondayAsFirstWeekday()).endOfWeek(endOfSeptember27_2015))
    }
    
    func testCalculatingEndOfWeekFromMiddleOfWeekWithSundayAsFirstWeekday() {
        let endOfSeptember26_2015 = self.dateFormatter.dateFromString("2015-09-26 23:59:59")!
        let middleOfSeptember26_week_2015 = self.dateFormatter.dateFromString("2015-09-23 12:00:00")!
        
        XCTAssertEqual(endOfSeptember26_2015, self.utilities.timeUnitWithCalendarWithSundayAsFirstWeekday().endOfWeek(middleOfSeptember26_week_2015))
        XCTAssertEqual(endOfSeptember26_2015, TimeUnit.setStaticCalendar(self.utilities.calendarWithSundayAsFirstWeekday()).endOfWeek(middleOfSeptember26_week_2015))
    }

    func testCalculatingEndOfWeekWithCalendarWithMondayAsFirstWeekday() {
        let endOfOctober11_2015 = self.dateFormatter.dateFromString("2015-10-11 23:59:59")!
        let beginningOfOctober10_2015 = self.dateFormatter.dateFromString("2015-10-10 00:00:00")!
        
        XCTAssertEqual(endOfOctober11_2015, self.utilities.timeUnitWithCalendarWithMondayAsFirstWeekday().endOfWeek(beginningOfOctober10_2015))
        XCTAssertEqual(endOfOctober11_2015, TimeUnit.setStaticCalendar(self.utilities.calendarWithMondayAsFirstWeekday()).endOfWeek(beginningOfOctober10_2015))
    }
    
// MARK: End of month
    func testCalculatingEndOfMonthFromEndOfMonth() {
        let endOfSeptember_2015 = self.dateFormatter.dateFromString("2015-09-30 23:59:59")!
        
        XCTAssertEqual(endOfSeptember_2015, TimeUnit().endOfMonth(endOfSeptember_2015))
        XCTAssertEqual(endOfSeptember_2015, TimeUnit.endOfMonth(endOfSeptember_2015))
    }
    
    func testCalculatingEndOfMonthFromMiddleOfMonth() {
        let endOfSeptember_2015 = self.dateFormatter.dateFromString("2015-09-30 23:59:59")!
        let middleOfSeptember_2015 = self.dateFormatter.dateFromString("2015-09-15 00:00:00")!
        
        XCTAssertEqual(endOfSeptember_2015, TimeUnit().endOfMonth(middleOfSeptember_2015))
        XCTAssertEqual(endOfSeptember_2015, TimeUnit.endOfMonth(middleOfSeptember_2015))
    }
    
// MARK: End of year
    func testCalculatingEndOfYearFromEndOfYear() {
        let endOf2015 = self.dateFormatter.dateFromString("2015-12-31 23:59:59")!
        
        XCTAssertEqual(endOf2015, TimeUnit().endOfYear(endOf2015))
        XCTAssertEqual(endOf2015, TimeUnit.endOfYear(endOf2015))
    }
    
    func testCalculatingEndOfYearFromMiddleOfYear() {
        let endOf2015 = self.dateFormatter.dateFromString("2015-12-31 23:59:59")!
        let middleOf2015 = self.dateFormatter.dateFromString("2015-07-01 00:00:00")!
        
        XCTAssertEqual(endOf2015, TimeUnit().endOfYear(middleOf2015))
        XCTAssertEqual(endOf2015, TimeUnit.endOfYear(middleOf2015))
    }
    
// MARK: - Creating Time Units
// MARK: minutesOfHours
    
    func testCalculatingMinutesOfAnHour() {
        let minutesIn7AM_September5_2015 = [
            self.dateFormatter.dateFromString("2015-09-05 7:00:00")!,
            self.dateFormatter.dateFromString("2015-09-05 7:01:00")!,
            self.dateFormatter.dateFromString("2015-09-05 7:02:00")!,
            self.dateFormatter.dateFromString("2015-09-05 7:03:00")!,
            self.dateFormatter.dateFromString("2015-09-05 7:04:00")!,
            self.dateFormatter.dateFromString("2015-09-05 7:05:00")!,
            self.dateFormatter.dateFromString("2015-09-05 7:06:00")!,
            self.dateFormatter.dateFromString("2015-09-05 7:07:00")!,
            self.dateFormatter.dateFromString("2015-09-05 7:08:00")!,
            self.dateFormatter.dateFromString("2015-09-05 7:09:00")!,
            self.dateFormatter.dateFromString("2015-09-05 7:10:00")!,
            self.dateFormatter.dateFromString("2015-09-05 7:11:00")!,
            self.dateFormatter.dateFromString("2015-09-05 7:12:00")!,
            self.dateFormatter.dateFromString("2015-09-05 7:13:00")!,
            self.dateFormatter.dateFromString("2015-09-05 7:14:00")!,
            self.dateFormatter.dateFromString("2015-09-05 7:15:00")!,
            self.dateFormatter.dateFromString("2015-09-05 7:16:00")!,
            self.dateFormatter.dateFromString("2015-09-05 7:17:00")!,
            self.dateFormatter.dateFromString("2015-09-05 7:18:00")!,
            self.dateFormatter.dateFromString("2015-09-05 7:19:00")!,
            self.dateFormatter.dateFromString("2015-09-05 7:20:00")!,
            self.dateFormatter.dateFromString("2015-09-05 7:21:00")!,
            self.dateFormatter.dateFromString("2015-09-05 7:22:00")!,
            self.dateFormatter.dateFromString("2015-09-05 7:23:00")!,
            self.dateFormatter.dateFromString("2015-09-05 7:24:00")!,
            self.dateFormatter.dateFromString("2015-09-05 7:25:00")!,
            self.dateFormatter.dateFromString("2015-09-05 7:26:00")!,
            self.dateFormatter.dateFromString("2015-09-05 7:27:00")!,
            self.dateFormatter.dateFromString("2015-09-05 7:28:00")!,
            self.dateFormatter.dateFromString("2015-09-05 7:29:00")!,
            self.dateFormatter.dateFromString("2015-09-05 7:30:00")!,
            self.dateFormatter.dateFromString("2015-09-05 7:31:00")!,
            self.dateFormatter.dateFromString("2015-09-05 7:32:00")!,
            self.dateFormatter.dateFromString("2015-09-05 7:33:00")!,
            self.dateFormatter.dateFromString("2015-09-05 7:34:00")!,
            self.dateFormatter.dateFromString("2015-09-05 7:35:00")!,
            self.dateFormatter.dateFromString("2015-09-05 7:36:00")!,
            self.dateFormatter.dateFromString("2015-09-05 7:37:00")!,
            self.dateFormatter.dateFromString("2015-09-05 7:38:00")!,
            self.dateFormatter.dateFromString("2015-09-05 7:39:00")!,
            self.dateFormatter.dateFromString("2015-09-05 7:40:00")!,
            self.dateFormatter.dateFromString("2015-09-05 7:41:00")!,
            self.dateFormatter.dateFromString("2015-09-05 7:42:00")!,
            self.dateFormatter.dateFromString("2015-09-05 7:43:00")!,
            self.dateFormatter.dateFromString("2015-09-05 7:44:00")!,
            self.dateFormatter.dateFromString("2015-09-05 7:45:00")!,
            self.dateFormatter.dateFromString("2015-09-05 7:46:00")!,
            self.dateFormatter.dateFromString("2015-09-05 7:47:00")!,
            self.dateFormatter.dateFromString("2015-09-05 7:48:00")!,
            self.dateFormatter.dateFromString("2015-09-05 7:49:00")!,
            self.dateFormatter.dateFromString("2015-09-05 7:50:00")!,
            self.dateFormatter.dateFromString("2015-09-05 7:51:00")!,
            self.dateFormatter.dateFromString("2015-09-05 7:52:00")!,
            self.dateFormatter.dateFromString("2015-09-05 7:53:00")!,
            self.dateFormatter.dateFromString("2015-09-05 7:54:00")!,
            self.dateFormatter.dateFromString("2015-09-05 7:55:00")!,
            self.dateFormatter.dateFromString("2015-09-05 7:56:00")!,
            self.dateFormatter.dateFromString("2015-09-05 7:57:00")!,
            self.dateFormatter.dateFromString("2015-09-05 7:58:00")!,
            self.dateFormatter.dateFromString("2015-09-05 7:59:00")!,
        ]
        let minuteIn7AM_September5_2015 = self.dateFormatter.dateFromString("2015-09-05 7:32:12")!
        
        XCTAssertEqual(minutesIn7AM_September5_2015, TimeUnit().minutesOfHour(minuteIn7AM_September5_2015))
        XCTAssertEqual(minutesIn7AM_September5_2015, TimeUnit.minutesOfHour(minuteIn7AM_September5_2015))
    }
    
// MARK: hoursOfDay
    func testCalculatingHoursOfDay() {
        let hoursInSeptember5_2015 = [
            self.dateFormatter.dateFromString("2015-09-05 00:00:00")!,
            self.dateFormatter.dateFromString("2015-09-05 01:00:00")!,
            self.dateFormatter.dateFromString("2015-09-05 02:00:00")!,
            self.dateFormatter.dateFromString("2015-09-05 03:00:00")!,
            self.dateFormatter.dateFromString("2015-09-05 04:00:00")!,
            self.dateFormatter.dateFromString("2015-09-05 05:00:00")!,
            self.dateFormatter.dateFromString("2015-09-05 06:00:00")!,
            self.dateFormatter.dateFromString("2015-09-05 07:00:00")!,
            self.dateFormatter.dateFromString("2015-09-05 08:00:00")!,
            self.dateFormatter.dateFromString("2015-09-05 09:00:00")!,
            self.dateFormatter.dateFromString("2015-09-05 10:00:00")!,
            self.dateFormatter.dateFromString("2015-09-05 11:00:00")!,
            self.dateFormatter.dateFromString("2015-09-05 12:00:00")!,
            self.dateFormatter.dateFromString("2015-09-05 13:00:00")!,
            self.dateFormatter.dateFromString("2015-09-05 14:00:00")!,
            self.dateFormatter.dateFromString("2015-09-05 15:00:00")!,
            self.dateFormatter.dateFromString("2015-09-05 16:00:00")!,
            self.dateFormatter.dateFromString("2015-09-05 17:00:00")!,
            self.dateFormatter.dateFromString("2015-09-05 18:00:00")!,
            self.dateFormatter.dateFromString("2015-09-05 19:00:00")!,
            self.dateFormatter.dateFromString("2015-09-05 20:00:00")!,
            self.dateFormatter.dateFromString("2015-09-05 21:00:00")!,
            self.dateFormatter.dateFromString("2015-09-05 22:00:00")!,
            self.dateFormatter.dateFromString("2015-09-05 23:00:00")!,
        ]
        
        let dateInSeptember5_2015 = self.dateFormatter.dateFromString("2015-09-05 17:23:37")!
        
        XCTAssertEqual(hoursInSeptember5_2015, TimeUnit().hoursOfDay(dateInSeptember5_2015))
        XCTAssertEqual(hoursInSeptember5_2015, TimeUnit.hoursOfDay(dateInSeptember5_2015))
    }
    
    func testCalculatingHoursOfDayWithDaylightSavingTime() {
        self.dateFormatter.timeZone = NSTimeZone(name:"America/Chicago")
        let hoursInMarch8_2015 = [
            self.dateFormatter.dateFromString("2015-03-08 00:00:00")!,
            self.dateFormatter.dateFromString("2015-03-08 01:00:00")!, // daylight savings change occurs at 2:00 AM in US
            self.dateFormatter.dateFromString("2015-03-08 03:00:00")!, // so hour skips from 1:00 to 3:00
            self.dateFormatter.dateFromString("2015-03-08 04:00:00")!,
            self.dateFormatter.dateFromString("2015-03-08 05:00:00")!,
            self.dateFormatter.dateFromString("2015-03-08 06:00:00")!,
            self.dateFormatter.dateFromString("2015-03-08 07:00:00")!,
            self.dateFormatter.dateFromString("2015-03-08 08:00:00")!,
            self.dateFormatter.dateFromString("2015-03-08 09:00:00")!,
            self.dateFormatter.dateFromString("2015-03-08 10:00:00")!,
            self.dateFormatter.dateFromString("2015-03-08 11:00:00")!,
            self.dateFormatter.dateFromString("2015-03-08 12:00:00")!,
            self.dateFormatter.dateFromString("2015-03-08 13:00:00")!,
            self.dateFormatter.dateFromString("2015-03-08 14:00:00")!,
            self.dateFormatter.dateFromString("2015-03-08 15:00:00")!,
            self.dateFormatter.dateFromString("2015-03-08 16:00:00")!,
            self.dateFormatter.dateFromString("2015-03-08 17:00:00")!,
            self.dateFormatter.dateFromString("2015-03-08 18:00:00")!,
            self.dateFormatter.dateFromString("2015-03-08 19:00:00")!,
            self.dateFormatter.dateFromString("2015-03-08 20:00:00")!,
            self.dateFormatter.dateFromString("2015-03-08 21:00:00")!,
            self.dateFormatter.dateFromString("2015-03-08 22:00:00")!,
            self.dateFormatter.dateFromString("2015-03-08 23:00:00")!,
        ]
        
        let tunit = TimeUnit()
        tunit.calendar.timeZone = self.dateFormatter.timeZone
        let dateInMarch8_2015 = self.dateFormatter.dateFromString("2015-03-08 15:07:00")!
        
        XCTAssertEqual(hoursInMarch8_2015, tunit.hoursOfDay(dateInMarch8_2015))
    }
    
// MARK: daysOfWeek
    func testCalculatingDaysOfWeekWithSundayAsFirstDayOfWeek() {
        let daysOfWeekOctober7_2015 = [
            self.dateFormatter.dateFromString("2015-10-04 00:00:00")!,
            self.dateFormatter.dateFromString("2015-10-05 00:00:00")!,
            self.dateFormatter.dateFromString("2015-10-06 00:00:00")!,
            self.dateFormatter.dateFromString("2015-10-07 00:00:00")!,
            self.dateFormatter.dateFromString("2015-10-08 00:00:00")!,
            self.dateFormatter.dateFromString("2015-10-09 00:00:00")!,
            self.dateFormatter.dateFromString("2015-10-10 00:00:00")!,
        ]
        
        let dateInWeekOfOctober7_2015 = self.dateFormatter.dateFromString("2015-10-07 20:26:32")!
        XCTAssertEqual(daysOfWeekOctober7_2015, self.utilities.timeUnitWithCalendarWithSundayAsFirstWeekday().daysOfWeek(dateInWeekOfOctober7_2015))
        XCTAssertEqual(daysOfWeekOctober7_2015, TimeUnit.setStaticCalendar(self.utilities.calendarWithSundayAsFirstWeekday()).daysOfWeek(dateInWeekOfOctober7_2015))
    }
    
    func testCalculatingDaysOfWeekWithMondayAsFirstDayOfWeek() {
        let daysOfWeekOctober10_2015 = [
            self.dateFormatter.dateFromString("2015-10-05 00:00:00")!,
            self.dateFormatter.dateFromString("2015-10-06 00:00:00")!,
            self.dateFormatter.dateFromString("2015-10-07 00:00:00")!,
            self.dateFormatter.dateFromString("2015-10-08 00:00:00")!,
            self.dateFormatter.dateFromString("2015-10-09 00:00:00")!,
            self.dateFormatter.dateFromString("2015-10-10 00:00:00")!,
            self.dateFormatter.dateFromString("2015-10-11 00:00:00")!,
        ]
        
        let dateInWeekOfOctober10_2015 = self.dateFormatter.dateFromString("2015-10-10 17:16:12")!
        XCTAssertEqual(daysOfWeekOctober10_2015, self.utilities.timeUnitWithCalendarWithMondayAsFirstWeekday().daysOfWeek(dateInWeekOfOctober10_2015))
        XCTAssertEqual(daysOfWeekOctober10_2015, TimeUnit.setStaticCalendar(self.utilities.calendarWithMondayAsFirstWeekday()).daysOfWeek(dateInWeekOfOctober10_2015))
    }
    
// MARK: daysOfMonth
    func testCalculatingDaysOfMonth() {
        let daysInFebruary_2015 = [
            self.dateFormatter.dateFromString("2015-02-01 00:00:00")!,
            self.dateFormatter.dateFromString("2015-02-02 00:00:00")!,
            self.dateFormatter.dateFromString("2015-02-03 00:00:00")!,
            self.dateFormatter.dateFromString("2015-02-04 00:00:00")!,
            self.dateFormatter.dateFromString("2015-02-05 00:00:00")!,
            self.dateFormatter.dateFromString("2015-02-06 00:00:00")!,
            self.dateFormatter.dateFromString("2015-02-07 00:00:00")!,
            self.dateFormatter.dateFromString("2015-02-08 00:00:00")!,
            self.dateFormatter.dateFromString("2015-02-09 00:00:00")!,
            self.dateFormatter.dateFromString("2015-02-10 00:00:00")!,
            self.dateFormatter.dateFromString("2015-02-11 00:00:00")!,
            self.dateFormatter.dateFromString("2015-02-12 00:00:00")!,
            self.dateFormatter.dateFromString("2015-02-13 00:00:00")!,
            self.dateFormatter.dateFromString("2015-02-14 00:00:00")!,
            self.dateFormatter.dateFromString("2015-02-15 00:00:00")!,
            self.dateFormatter.dateFromString("2015-02-16 00:00:00")!,
            self.dateFormatter.dateFromString("2015-02-17 00:00:00")!,
            self.dateFormatter.dateFromString("2015-02-18 00:00:00")!,
            self.dateFormatter.dateFromString("2015-02-19 00:00:00")!,
            self.dateFormatter.dateFromString("2015-02-20 00:00:00")!,
            self.dateFormatter.dateFromString("2015-02-21 00:00:00")!,
            self.dateFormatter.dateFromString("2015-02-22 00:00:00")!,
            self.dateFormatter.dateFromString("2015-02-23 00:00:00")!,
            self.dateFormatter.dateFromString("2015-02-24 00:00:00")!,
            self.dateFormatter.dateFromString("2015-02-25 00:00:00")!,
            self.dateFormatter.dateFromString("2015-02-26 00:00:00")!,
            self.dateFormatter.dateFromString("2015-02-27 00:00:00")!,
            self.dateFormatter.dateFromString("2015-02-28 00:00:00")!,
        ]
        
        let dateInFebruary = self.dateFormatter.dateFromString("2015-02-03 11:24:57")!
        XCTAssertEqual(daysInFebruary_2015, TimeUnit().daysOfMonth(dateInFebruary))
        XCTAssertEqual(daysInFebruary_2015, TimeUnit.daysOfMonth(dateInFebruary))
    }
    
    func testCalculatingDaysOfLeapMonth() {
        let daysInFebruary_2012 = [
            self.dateFormatter.dateFromString("2012-02-01 00:00:00")!,
            self.dateFormatter.dateFromString("2012-02-02 00:00:00")!,
            self.dateFormatter.dateFromString("2012-02-03 00:00:00")!,
            self.dateFormatter.dateFromString("2012-02-04 00:00:00")!,
            self.dateFormatter.dateFromString("2012-02-05 00:00:00")!,
            self.dateFormatter.dateFromString("2012-02-06 00:00:00")!,
            self.dateFormatter.dateFromString("2012-02-07 00:00:00")!,
            self.dateFormatter.dateFromString("2012-02-08 00:00:00")!,
            self.dateFormatter.dateFromString("2012-02-09 00:00:00")!,
            self.dateFormatter.dateFromString("2012-02-10 00:00:00")!,
            self.dateFormatter.dateFromString("2012-02-11 00:00:00")!,
            self.dateFormatter.dateFromString("2012-02-12 00:00:00")!,
            self.dateFormatter.dateFromString("2012-02-13 00:00:00")!,
            self.dateFormatter.dateFromString("2012-02-14 00:00:00")!,
            self.dateFormatter.dateFromString("2012-02-15 00:00:00")!,
            self.dateFormatter.dateFromString("2012-02-16 00:00:00")!,
            self.dateFormatter.dateFromString("2012-02-17 00:00:00")!,
            self.dateFormatter.dateFromString("2012-02-18 00:00:00")!,
            self.dateFormatter.dateFromString("2012-02-19 00:00:00")!,
            self.dateFormatter.dateFromString("2012-02-20 00:00:00")!,
            self.dateFormatter.dateFromString("2012-02-21 00:00:00")!,
            self.dateFormatter.dateFromString("2012-02-22 00:00:00")!,
            self.dateFormatter.dateFromString("2012-02-23 00:00:00")!,
            self.dateFormatter.dateFromString("2012-02-24 00:00:00")!,
            self.dateFormatter.dateFromString("2012-02-25 00:00:00")!,
            self.dateFormatter.dateFromString("2012-02-26 00:00:00")!,
            self.dateFormatter.dateFromString("2012-02-27 00:00:00")!,
            self.dateFormatter.dateFromString("2012-02-28 00:00:00")!,
            self.dateFormatter.dateFromString("2012-02-29 00:00:00")!,
        ]
        
        let dateInFebruary = self.dateFormatter.dateFromString("2012-02-27 09:17:03")!
        
        XCTAssertEqual(daysInFebruary_2012, TimeUnit().daysOfMonth(dateInFebruary))
        XCTAssertEqual(daysInFebruary_2012, TimeUnit.daysOfMonth(dateInFebruary))
    }
    
// MARK: monthsOfYear
    func testCalculatingMonthsOfYear() {
        let monthsIn_2015 = [
            self.dateFormatter.dateFromString("2015-01-01 00:00:00")!,
            self.dateFormatter.dateFromString("2015-02-01 00:00:00")!,
            self.dateFormatter.dateFromString("2015-03-01 00:00:00")!,
            self.dateFormatter.dateFromString("2015-04-01 00:00:00")!,
            self.dateFormatter.dateFromString("2015-05-01 00:00:00")!,
            self.dateFormatter.dateFromString("2015-06-01 00:00:00")!,
            self.dateFormatter.dateFromString("2015-07-01 00:00:00")!,
            self.dateFormatter.dateFromString("2015-08-01 00:00:00")!,
            self.dateFormatter.dateFromString("2015-09-01 00:00:00")!,
            self.dateFormatter.dateFromString("2015-10-01 00:00:00")!,
            self.dateFormatter.dateFromString("2015-11-01 00:00:00")!,
            self.dateFormatter.dateFromString("2015-12-01 00:00:00")!,
        ]
        
        let dateIn_2015 = self.dateFormatter.dateFromString("2015-09-05 13:29:18")!
        XCTAssertEqual(monthsIn_2015, TimeUnit().monthsOfYear(dateIn_2015))
        XCTAssertEqual(monthsIn_2015, TimeUnit.monthsOfYear(dateIn_2015))
    }
        
        
// MARK: - Time Unit Contains Date
// MARK: hourContainsDate
    func testDeterminingWhetherBeginningOfHourFallsInHour() {
        let september13_11AM_2015 = self.dateFormatter.dateFromString("2015-09-13 11:00:00")!
        
        XCTAssertTrue(TimeUnit().hourContainsDate(september13_11AM_2015, hour: september13_11AM_2015))
        XCTAssertTrue(TimeUnit.hourContainsDate(september13_11AM_2015, hour: september13_11AM_2015))
    }
    
    func testDeterminingWhetherMiddleOfHourFallsInHour() {
        let september13_11AM_2015 = self.dateFormatter.dateFromString("2015-09-13 11:00:00")!
        let september13_1130AM_2015 = self.dateFormatter.dateFromString("2015-09-13 11:30:00")!
        
        XCTAssertTrue(TimeUnit().hourContainsDate(september13_1130AM_2015, hour: september13_11AM_2015))
        XCTAssertTrue(TimeUnit.hourContainsDate(september13_1130AM_2015, hour: september13_11AM_2015))
    }
    
    func testDeterminingWhetherNextHourFallsInHour() {
        let september13_11AM_2015 = self.dateFormatter.dateFromString("2015-09-13 11:00:00")!
        let september13_12PM_2015 = self.dateFormatter.dateFromString("2015-09-13 12:00:00")!
        
        XCTAssertFalse(TimeUnit().hourContainsDate(september13_12PM_2015, hour: september13_11AM_2015))
        XCTAssertFalse(TimeUnit.hourContainsDate(september13_12PM_2015, hour: september13_11AM_2015))
    }
    
    func testDeterminingWhetherPreviousHourFallsInHour() {
        let september13_11AM_2015 = self.dateFormatter.dateFromString("2015-09-13 11:00:00")!
        let September13_10AM_2015 = self.dateFormatter.dateFromString("2015-09-13 10:59:59")!
        
        XCTAssertFalse(TimeUnit().hourContainsDate(September13_10AM_2015, hour: september13_11AM_2015))
        XCTAssertFalse(TimeUnit.hourContainsDate(September13_10AM_2015, hour: september13_11AM_2015))
    }

// MARK: dayContainsDate
    func testDeterminingWhetherBeginningOfDayFallsInDay() {
        let september13_2015 = self.dateFormatter.dateFromString("2015-09-13 00:00:00")!
        
        XCTAssertTrue(TimeUnit().dayContainsDate(september13_2015, day: september13_2015))
        XCTAssertTrue(TimeUnit.dayContainsDate(september13_2015, day: september13_2015))
    }

    func testDeterminingWhetherMiddleOfDayFallsInDay() {
        let september13_2015 = self.dateFormatter.dateFromString("2015-09-13 00:00:00")!
        let middleOfSeptember13_2015 = self.dateFormatter.dateFromString("2015-09-13 12:00:00")!
        
        XCTAssertTrue(TimeUnit().dayContainsDate(middleOfSeptember13_2015, day: september13_2015))
        XCTAssertTrue(TimeUnit.dayContainsDate(middleOfSeptember13_2015, day: september13_2015))
    }
    
    func testDeterminingWhetherNextDayFallsInDay() {
        let september13_2015 = self.dateFormatter.dateFromString("2015-09-13 00:00:00")!
        let september14_2015 = self.dateFormatter.dateFromString("2015-09-14 00:00:00")!
        
        XCTAssertFalse(TimeUnit().dayContainsDate(september14_2015, day: september13_2015))
        XCTAssertFalse(TimeUnit.dayContainsDate(september14_2015, day: september13_2015))
    }
    
    func testDeterminingWhetherPreviousDayFallsInDay() {
        let september13_2015 = self.dateFormatter.dateFromString("2015-09-13 00:00:00")!
        let september12_2015 = self.dateFormatter.dateFromString("2015-09-12 00:00:00")!
        
        XCTAssertFalse(TimeUnit().dayContainsDate(september12_2015, day: september13_2015))
        XCTAssertFalse(TimeUnit.dayContainsDate(september12_2015, day: september13_2015))
    }
    
// MARK: weekContainsDate
    func testDeterminingWhetherBeginningOfWeekFallsInWeekWithSundayAsFirstWeekday() {
        let september27_2015 = self.dateFormatter.dateFromString("2015-09-27 00:00:00")!
        
        XCTAssertTrue(self.utilities.timeUnitWithCalendarWithSundayAsFirstWeekday().weekContainsDate(september27_2015, week: september27_2015))
        XCTAssertTrue(TimeUnit.setStaticCalendar(self.utilities.calendarWithSundayAsFirstWeekday()).weekContainsDate(september27_2015, week: september27_2015))
    }

    func testDeterminingWhetherBeginningOfWeekFallsInWeekWithMondayAsFirstWeekday() {
        let september28_2015 = self.dateFormatter.dateFromString("2015-09-28 00:00:00")!
        
        XCTAssertTrue(self.utilities.timeUnitWithCalendarWithMondayAsFirstWeekday().weekContainsDate(september28_2015, week: september28_2015))
        XCTAssertTrue(TimeUnit.setStaticCalendar(self.utilities.calendarWithMondayAsFirstWeekday()).weekContainsDate(september28_2015, week: september28_2015))
    }

    func testDeterminingWhetherMiddleOfWeekFallsInWeekWithSundayAsFirstWeekday() {
        let september27_2015 = self.dateFormatter.dateFromString("2015-09-27 00:00:00")!
        let middleOfSeptember30_2015 = self.dateFormatter.dateFromString("2015-09-30 12:00:00")!
        
        XCTAssertTrue(self.utilities.timeUnitWithCalendarWithSundayAsFirstWeekday().weekContainsDate(middleOfSeptember30_2015, week: september27_2015))
        XCTAssertTrue(TimeUnit.setStaticCalendar(self.utilities.calendarWithSundayAsFirstWeekday()).weekContainsDate(middleOfSeptember30_2015, week: september27_2015))
    }
    
    func testDeterminingWhetherMiddleOfWeekFallsInWeekWithMondayAsFirstWeekday() {
        let september28_2015 = self.dateFormatter.dateFromString("2015-09-28 00:00:00")!
        let middleOfSeptember30_2015 = self.dateFormatter.dateFromString("2015-09-30 12:00:00")!
        
        XCTAssertTrue(self.utilities.timeUnitWithCalendarWithMondayAsFirstWeekday().weekContainsDate(middleOfSeptember30_2015, week: september28_2015))
        XCTAssertTrue(TimeUnit.setStaticCalendar(self.utilities.calendarWithMondayAsFirstWeekday()).weekContainsDate(middleOfSeptember30_2015, week: september28_2015))
    }
    
    func testDeterminingWhetherNextWeekFallsInWeekWithSundayAsFirstWeekday() {
        let september27_2015 = self.dateFormatter.dateFromString("2015-09-27 00:00:00")!
        let beginningOfOctober4_2015 = self.dateFormatter.dateFromString("2015-10-04 00:00:00")!
        
        XCTAssertFalse(self.utilities.timeUnitWithCalendarWithSundayAsFirstWeekday().weekContainsDate(beginningOfOctober4_2015, week: september27_2015))
        XCTAssertFalse(TimeUnit.setStaticCalendar(self.utilities.calendarWithSundayAsFirstWeekday()).weekContainsDate(beginningOfOctober4_2015, week: september27_2015))
    }
    
    func testDeterminingWhetherNextWeekFallsInWeekWithMondayAsFirstWeekday() {
        let september28_2015 = self.dateFormatter.dateFromString("2015-09-28 00:00:00")!
        let beginningOfOctober5_2015 = self.dateFormatter.dateFromString("2015-10-05 00:00:00")!
        
        XCTAssertFalse(self.utilities.timeUnitWithCalendarWithMondayAsFirstWeekday().weekContainsDate(beginningOfOctober5_2015, week: september28_2015))
        XCTAssertFalse(TimeUnit.setStaticCalendar(self.utilities.calendarWithMondayAsFirstWeekday()).weekContainsDate(beginningOfOctober5_2015, week: september28_2015))
    }
    
    func testDeterminingWhetherPreviousWeekFallsInWeekWithSundayAsFirstWeekday() {
        let september27_2015 = self.dateFormatter.dateFromString("2015-09-27 00:00:00")!
        let endOfSeptember26_2015 = self.dateFormatter.dateFromString("2015-09-26 23:59:59")!
        
        XCTAssertFalse(self.utilities.timeUnitWithCalendarWithSundayAsFirstWeekday().weekContainsDate(endOfSeptember26_2015, week: september27_2015))
        XCTAssertFalse(TimeUnit.setStaticCalendar(self.utilities.calendarWithSundayAsFirstWeekday()).weekContainsDate(endOfSeptember26_2015, week: september27_2015))
    }
    
    func testDeterminingWhetherPreviousWeekFallsInWeekWithMondayAsFirstWeekday() {
        let september28_2015 = self.dateFormatter.dateFromString("2015-09-28 00:00:00")!
        let endOfSeptember27_2015 = self.dateFormatter.dateFromString("2015-09-27 23:59:59")!
        
        XCTAssertFalse(self.utilities.timeUnitWithCalendarWithMondayAsFirstWeekday().weekContainsDate(endOfSeptember27_2015, week: september28_2015))
        XCTAssertFalse(TimeUnit.setStaticCalendar(self.utilities.calendarWithMondayAsFirstWeekday()).weekContainsDate(endOfSeptember27_2015, week: september28_2015))
    }
    
// MARK: monthContainsDate
    func testDeterminingWhetherBeginningOfMonthFallsInMonth() {
        let september_2015 = self.dateFormatter.dateFromString("2015-09-01 00:00:00")!
        
        XCTAssertTrue(TimeUnit().monthContainsDate(september_2015, month: september_2015))
        XCTAssertTrue(TimeUnit.monthContainsDate(september_2015, month: september_2015))
    }
    
    func testDeterminingWhetherMiddleOfMonthFallsInMonth() {
        let september_2015 = self.dateFormatter.dateFromString("2015-09-01 00:00:00")!
        let middleOfSeptember_2015 = self.dateFormatter.dateFromString("2015-09-15 00:00:00")!
        
        XCTAssertTrue(TimeUnit().monthContainsDate(middleOfSeptember_2015, month: september_2015))
        XCTAssertTrue(TimeUnit.monthContainsDate(middleOfSeptember_2015, month: september_2015))
    }
    
    func testDeterminingWhetherNextMonthFallsInMonth() {
        let september_2015 = self.dateFormatter.dateFromString("2015-09-01 00:00:00")!
        let beginningOfOctober_2015 = self.dateFormatter.dateFromString("2015-10-01 00:00:00")!
        
        XCTAssertFalse(TimeUnit().monthContainsDate(beginningOfOctober_2015, month: september_2015))
        XCTAssertFalse(TimeUnit.monthContainsDate(beginningOfOctober_2015, month: september_2015))
    }
    
    func testDeterminingWhetherPreviousMonthFallsInMonth() {
        let september_2015 = self.dateFormatter.dateFromString("2015-09-01 00:00:00")!
        let endOfAugust_2015 = self.dateFormatter.dateFromString("2015-08-31 23:59:59")!
        
        XCTAssertFalse(TimeUnit().monthContainsDate(endOfAugust_2015, month: september_2015))
        XCTAssertFalse(TimeUnit.monthContainsDate(endOfAugust_2015, month: september_2015))
    }

// MARK: yearContainsDate
    func testDeterminingWhetherBeginningOfYearFallsInYear() {
        let _2015 = self.dateFormatter.dateFromString("2015-01-01 00:00:00")!
        
        XCTAssertTrue(TimeUnit().yearContainsDate(_2015, year: _2015))
        XCTAssertTrue(TimeUnit.yearContainsDate(_2015, year: _2015))
    }
    
    func testDeterminingWhetherMiddleOfYearFallsInYear() {
        let _2015 = self.dateFormatter.dateFromString("2015-01-01 00:00:00")!
        let middle_2015 = self.dateFormatter.dateFromString("2015-07-01 00:00:00")!
        
        XCTAssertTrue(TimeUnit().yearContainsDate(middle_2015, year: _2015))
        XCTAssertTrue(TimeUnit.yearContainsDate(middle_2015, year: _2015))
    }
    
    func testDeterminingWhetherNextYearFallsInYear() {
        let _2015 = self.dateFormatter.dateFromString("2015-01-01 00:00:00")!
        let _2016 = self.dateFormatter.dateFromString("2016-01-01 00:00:00")!
        
        XCTAssertFalse(TimeUnit().yearContainsDate(_2016, year: _2015))
        XCTAssertFalse(TimeUnit.yearContainsDate(_2016, year: _2015))
    }
    
    func testDeterminingWhetherPreviousYearFallsInYear() {
        let _2015 = self.dateFormatter.dateFromString("2015-01-01 00:00:00")!
        let _2014 = self.dateFormatter.dateFromString("2014-01-01 00:00:00")!
        
        XCTAssertFalse(TimeUnit().yearContainsDate(_2014, year: _2015))
        XCTAssertFalse(TimeUnit.yearContainsDate(_2014, year: _2015))
    }
    
// MARK: - Calculating Units Before and After Date
// MARK: Calculating Hour Before And After
    func testCalculatingPreviousHour() {
        let september29_11_2015 = self.dateFormatter.dateFromString("2015-09-29 11:00:00")!
        let september29_10_2015 = self.dateFormatter.dateFromString("2015-09-29 10:00:00")!
        
        XCTAssertEqual(TimeUnit().hourBefore(september29_11_2015), september29_10_2015)
        XCTAssertEqual(TimeUnit.hourBefore(september29_11_2015), september29_10_2015)
    }
    
    func testCalculatingNextHour() {
        let september29_11_2015 = self.dateFormatter.dateFromString("2015-09-29 11:00:00")!
        let september29_12_2015 = self.dateFormatter.dateFromString("2015-09-29 12:00:00")!
        
        XCTAssertEqual(TimeUnit().hourAfter(september29_11_2015), september29_12_2015)
        XCTAssertEqual(TimeUnit.hourAfter(september29_11_2015), september29_12_2015)
    }
    
 // MARK: Calculating Day Before and After
    func testCalculatingNextDay() {
        let september29_2015 = self.dateFormatter.dateFromString("2015-09-29 00:00:00")!
        let september30_2015 = self.dateFormatter.dateFromString("2015-09-30 00:00:00")!
        
        XCTAssertEqual(TimeUnit().dayAfter(september29_2015), september30_2015)
        XCTAssertEqual(TimeUnit.dayAfter(september29_2015), september30_2015)
    }
    
    func testCalculatingPreviousDay() {
        let september29_2015 = self.dateFormatter.dateFromString("2015-09-29 00:00:00")!
        let september28_2015 = self.dateFormatter.dateFromString("2015-09-28 00:00:00")!
        
        XCTAssertEqual(TimeUnit().dayBefore(september29_2015), september28_2015)
        XCTAssertEqual(TimeUnit.dayBefore(september29_2015), september28_2015)
    }
    
// MARK: Calculating Week Before and After
    func testCalculatingNextWeekWithSundayAsFirstWeekday() {
        let september27_2015 = self.dateFormatter.dateFromString("2015-09-27 00:00:00")!
        let october4_2015 = self.dateFormatter.dateFromString("2015-10-04 00:00:00")!
        
        XCTAssertEqual(self.utilities.timeUnitWithCalendarWithSundayAsFirstWeekday().weekAfter(september27_2015), october4_2015)
        XCTAssertEqual(TimeUnit.setStaticCalendar(self.utilities.calendarWithSundayAsFirstWeekday()).weekAfter(september27_2015), october4_2015)
    }
    
    func testCalculatingNextWeekWithMondayAsFirstWeekday() {
        let september28_2015 = self.dateFormatter.dateFromString("2015-09-28 00:00:00")!
        let october5_2015 = self.dateFormatter.dateFromString("2015-10-05 00:00:00")!
        
        XCTAssertEqual(self.utilities.timeUnitWithCalendarWithMondayAsFirstWeekday().weekAfter(september28_2015), october5_2015)
        XCTAssertEqual(TimeUnit.setStaticCalendar(self.utilities.calendarWithMondayAsFirstWeekday()).weekAfter(september28_2015), october5_2015)
    }
    
    func testCalculatingPreviousWeekWithSundayAsFirstWeekday() {
        let september27_2015 = self.dateFormatter.dateFromString("2015-09-27 00:00:00")!
        let september20_2015 = self.dateFormatter.dateFromString("2015-09-20 00:00:00")!
        
        XCTAssertEqual(self.utilities.timeUnitWithCalendarWithSundayAsFirstWeekday().weekBefore(september27_2015), september20_2015)
        XCTAssertEqual(TimeUnit.setStaticCalendar(self.utilities.calendarWithSundayAsFirstWeekday()).weekBefore(september27_2015), september20_2015)
    }
    
    func testCalculatingPreviousWeekWithMondayAsFirstWeekday() {
        let september28_2015 = self.dateFormatter.dateFromString("2015-09-28 00:00:00")!
        let september21_2015 = self.dateFormatter.dateFromString("2015-09-21 00:00:00")!
        
        XCTAssertEqual(self.utilities.timeUnitWithCalendarWithMondayAsFirstWeekday().weekBefore(september28_2015), september21_2015)
        XCTAssertEqual(TimeUnit.setStaticCalendar(self.utilities.calendarWithMondayAsFirstWeekday()).weekBefore(september28_2015), september21_2015)
    }
    
// MARK: Calculating Month Before and After
    func testCalculatingNextMonth() {
        let september1_2015 = self.dateFormatter.dateFromString("2015-09-01 00:00:00")!
        let october1_2015 = self.dateFormatter.dateFromString("2015-10-01 00:00:00")!
        
        XCTAssertEqual(TimeUnit().monthAfter(september1_2015), october1_2015)
        XCTAssertEqual(TimeUnit.monthAfter(september1_2015), october1_2015)
    }
    
    func testCalculatingPreviousMonth() {
        let september1_2015 = self.dateFormatter.dateFromString("2015-09-01 00:00:00")!
        let august1_2015 = self.dateFormatter.dateFromString("2015-08-01 00:00:00")!
        
        XCTAssertEqual(TimeUnit().monthBefore(september1_2015), august1_2015)
        XCTAssertEqual(TimeUnit.monthBefore(september1_2015), august1_2015)
    }
    
// MARK: Calculating Year Before and After
    func testCalculatingNextYear() {
        let _2015 = self.dateFormatter.dateFromString("2015-01-01 00:00:00")!
        let _2016 = self.dateFormatter.dateFromString("2016-01-01 00:00:00")!
        
        XCTAssertEqual(TimeUnit().yearAfter(_2015), _2016)
        XCTAssertEqual(TimeUnit.yearAfter(_2015), _2016)
    }
    
    func testCalculatingPreviousYear() {
        let _2015 = self.dateFormatter.dateFromString("2015-01-01 00:00:00")!
        let _2014 = self.dateFormatter.dateFromString("2014-01-01 00:00:00")!
        
        XCTAssertEqual(TimeUnit().yearBefore(_2015), _2014)
        XCTAssertEqual(TimeUnit.yearBefore(_2015), _2014)
    }
}
