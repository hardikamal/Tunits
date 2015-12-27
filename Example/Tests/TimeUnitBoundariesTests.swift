//
//  TimeUnitBoundariesTests.swift
//  Tunits
//
//  Created by Tom on 12/27/15.
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

class TimeUnitBoundariesTests: XCTestCase {
    private var dateFormatter : NSDateFormatter = NSDateFormatter()
    
    private var utilities : TimeUnitTestsUtilities = TimeUnitTestsUtilities()
    
    override func setUp() {
        self.dateFormatter = NSDateFormatter()
        self.dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
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
}
