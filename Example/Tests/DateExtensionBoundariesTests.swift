//
//  DateExtensionBoundariesTests.swift
//  Tunits
//
//  Created by Tom on 12/27/15.
//  Copyright © 2015 CocoaPods. All rights reserved.
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

class DateExtensionBoundariesTests: XCTestCase {
    private var dateFormatter : NSDateFormatter = NSDateFormatter();
    
    private let utilities : TimeUnitTestsUtilities = TimeUnitTestsUtilities()
    
    override func setUp() {
        self.dateFormatter = NSDateFormatter();
        self.dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    }
    
    // MARK: - Beginning of Time Units
    // MARK: Beginning of Minute
    func testCalculatingBeginningOfAMinuteFromBeginningOfMinute() {
        let beginningOf7AM = self.dateFormatter.dateFromString("2015-09-08 7:00:00")!
        
        XCTAssertEqual(beginningOf7AM, beginningOf7AM.beginningOfMinute())
    }
    
    func testCalculatingBeginningOfAMinuteFromMiddleOfMinute() {
        let beginningOf7AM = self.dateFormatter.dateFromString("2015-09-08 7:00:00")!
        let middleOf7_00AM = self.dateFormatter.dateFromString("2015-09-08 7:00:30")!
        
        XCTAssertEqual(beginningOf7AM, middleOf7_00AM.beginningOfMinute())
    }
    
    // MARK: Beginning of hour
    func testCalculatingBeginningOfAnHourFromBeginningOfHour() {
        let beginningOf7AM = self.dateFormatter.dateFromString("2015-09-08 7:00:00")!
        
        XCTAssertEqual(beginningOf7AM, beginningOf7AM.beginningOfHour())
    }
    
    func testCalculatingBeginningOfAnHourFromMiddleOfHour() {
        let beginningOf7AM = self.dateFormatter.dateFromString("2015-09-08 7:00:00")!
        let middleOf7AM = self.dateFormatter.dateFromString("2015-09-08 7:30:00")!
        
        XCTAssertEqual(beginningOf7AM, middleOf7AM.beginningOfHour())
    }
    
    
    // MARK: Beginning of day
    func testCalculatingBeginningOfDayFromBeginningOfDay() {
        let beginningOfSeptember8_2015 = self.dateFormatter.dateFromString("2015-09-08 00:00:00")!
        
        XCTAssertEqual(beginningOfSeptember8_2015 , beginningOfSeptember8_2015.beginningOfDay())
    }
    
    func testCalculatingBeginningOfDayFromMiddleOfDay() {
        let beginningOfSeptember8_2015 = self.dateFormatter.dateFromString("2015-09-08 00:00:00")!
        let middleOfSeptember8_2015 = self.dateFormatter.dateFromString("2015-09-08 12:00:00")!
        
        XCTAssertEqual(beginningOfSeptember8_2015 , middleOfSeptember8_2015.beginningOfDay())
    }
    
    
    // MARK: Beginning of week
    func testCalculatingBeginningOfWeekFromBeginningOfWeekWithSundayAsFirstWeekday() {
        let beginningOfSeptember20_2015 = self.dateFormatter.dateFromString("2015-09-20 00:00:00")!
        
        TimeUnit.setStaticCalendar(self.utilities.calendarWithSundayAsFirstWeekday())
        XCTAssertEqual(beginningOfSeptember20_2015, beginningOfSeptember20_2015.beginningOfWeek())
    }
    
    func testCalculatingBeginningOfWeekFromBeginningOfWeekWithMondayAsFirstWeekday() {
        let beginningOfSeptember21_2015 = self.dateFormatter.dateFromString("2015-09-21 00:00:00")!
        
        TimeUnit.setStaticCalendar(self.utilities.calendarWithMondayAsFirstWeekday())
        XCTAssertEqual(beginningOfSeptember21_2015, beginningOfSeptember21_2015.beginningOfWeek())
    }
    
    func testCalculatingBeginningOfWeekFromMiddleOfWeekWithSundayAsFirstWeekday() {
        let beginningOfSeptember20_2015 = self.dateFormatter.dateFromString("2015-09-20 00:00:00")!
        let middleOfSeptember23_2015 = self.dateFormatter.dateFromString("2015-09-23 12:00:00")!
        
        TimeUnit.setStaticCalendar(self.utilities.calendarWithSundayAsFirstWeekday())
        XCTAssertEqual(beginningOfSeptember20_2015, middleOfSeptember23_2015.beginningOfWeek())
    }
    
    func testCalculatingBeginningOfWeekFromMiddleOfWeekWithMondayAsFirstWeekday() {
        let beginningOfSeptember21_2015 = self.dateFormatter.dateFromString("2015-09-21 00:00:00")!
        let middleOfSeptember23_2015 = self.dateFormatter.dateFromString("2015-09-23 12:00:00")!
        
        TimeUnit.setStaticCalendar(self.utilities.calendarWithMondayAsFirstWeekday())
        XCTAssertEqual(beginningOfSeptember21_2015, middleOfSeptember23_2015.beginningOfWeek())
    }
    
    // MARK: Beginning of month
    func testCalculatingBeginningOfMonthFromBeginningOfMonth() {
        let beginningOfSeptember_2015 = self.dateFormatter.dateFromString("2015-09-01 00:00:00")!
        
        XCTAssertEqual(beginningOfSeptember_2015, beginningOfSeptember_2015.beginningOfMonth())
    }
    
    func testCalculatingBeginningOfMonthFromMiddleOfMonth() {
        let beginningOfSeptember_2015 = self.dateFormatter.dateFromString("2015-09-01 00:00:00")!
        let middleOfSeptember_2015 = self.dateFormatter.dateFromString("2015-09-15 12:00:00")!
        
        XCTAssertEqual(beginningOfSeptember_2015, middleOfSeptember_2015.beginningOfMonth())
    }
    
    // MARK: Beginning of year
    
    func testCalculatingBeginningOfYearFromBeginningOfYear() {
        let beginningOf2015 = self.dateFormatter.dateFromString("2015-01-01 00:00:00")!
        
        XCTAssertEqual(beginningOf2015, beginningOf2015.beginningOfYear())
    }
    
    func testCalculatingBeginningOfYearFromMiddleOfYear() {
        let beginningOf2015 = self.dateFormatter.dateFromString("2015-01-01 00:00:00")!
        let middleOf2015 = self.dateFormatter.dateFromString("2015-07-01 00:00:00")!
        
        XCTAssertEqual(beginningOf2015, middleOf2015.beginningOfYear())
    }
    
    
    // MARK: - End of time units
    // MARK: End of minute
    func testCalculatingEndOfMinuteFromEndOfMinute() {
        let endOf5_00PM = self.dateFormatter.dateFromString("2015-09-08 17:00:59")!
        
        XCTAssertEqual(endOf5_00PM, endOf5_00PM.endOfMinute())
    }
    
    func testCalculatingEndOfMinuteFromMiddleOfMinute() {
        let endOf5_00PM = self.dateFormatter.dateFromString("2015-09-08 17:00:59")!
        let middleOf5_00PM = self.dateFormatter.dateFromString("2015-09-08 17:00:30")!
        
        XCTAssertEqual(endOf5_00PM, middleOf5_00PM.endOfMinute())
    }
    
    // MARK: End of hour
    func testCalculatingEndOfHourFromEndOfHour() {
        let endOf5PM = self.dateFormatter.dateFromString("2015-09-08 17:59:59")!
        
        XCTAssertEqual(endOf5PM, endOf5PM.endOfHour())
    }
    
    func testCalculatingEndOfHourFromMiddleOfHour() {
        let endOf5PM = self.dateFormatter.dateFromString("2015-09-08 17:59:59")!
        let middleOf5PM = self.dateFormatter.dateFromString("2015-09-08 17:30:00")!
        
        XCTAssertEqual(endOf5PM, middleOf5PM.endOfHour())
    }
    
    // MARK: End of day
    func testCalculatingEndOfDayFromEndOfDay() {
        let endOfSeptember8_2015 = self.dateFormatter.dateFromString("2015-09-08 23:59:59")!
        
        XCTAssertEqual(endOfSeptember8_2015, endOfSeptember8_2015.endOfDay())
    }
    
    func testCalculatingEndOfDayFromMiddleOfDay() {
        let endOfSeptember8_2015 = self.dateFormatter.dateFromString("2015-09-08 23:59:59")!
        let middleOfSeptember8_2015 = self.dateFormatter.dateFromString("2015-09-08 12:00:00")!
        
        XCTAssertEqual(endOfSeptember8_2015, middleOfSeptember8_2015.endOfDay())
    }
    
    // MARK: End of week
    
    func testCalculatingEndOfWeekFromEndOfWeekWithSundayAsFirstWeekday() {
        let endOfSeptember26_2015 = self.dateFormatter.dateFromString("2015-09-26 23:59:59")!
        
        TimeUnit.setStaticCalendar(self.utilities.calendarWithSundayAsFirstWeekday())
        XCTAssertEqual(endOfSeptember26_2015, endOfSeptember26_2015.endOfWeek())
    }
    
    func testCalculatingEndOfWeekFromEndOfWeekWithMondayAsFirstWeekday() {
        let endOfSeptember27_2015 = self.dateFormatter.dateFromString("2015-09-27 23:59:59")!
        
        TimeUnit.setStaticCalendar(self.utilities.calendarWithMondayAsFirstWeekday())
        XCTAssertEqual(endOfSeptember27_2015, endOfSeptember27_2015.endOfWeek())
    }
    
    func testCalculatingEndOfWeekFromMiddleOfWeekWithSundayAsFirstWeekday() {
        let endOfSeptember26_2015 = self.dateFormatter.dateFromString("2015-09-26 23:59:59")!
        let middleOfSeptember26_week_2015 = self.dateFormatter.dateFromString("2015-09-23 12:00:00")!
        
        TimeUnit.setStaticCalendar(self.utilities.calendarWithSundayAsFirstWeekday())
        XCTAssertEqual(endOfSeptember26_2015, middleOfSeptember26_week_2015.endOfWeek())
    }
    
    func testCalculatingEndOfWeekFromMiddleOfWeekWithMondayAsFirstWeekday() {
        let endOfSeptember27_2015 = self.dateFormatter.dateFromString("2015-09-27 23:59:59")!
        let middleOfSeptember27_week_2015 = self.dateFormatter.dateFromString("2015-09-23 12:00:00")!
        
        TimeUnit.setStaticCalendar(self.utilities.calendarWithMondayAsFirstWeekday())
        XCTAssertEqual(endOfSeptember27_2015, middleOfSeptember27_week_2015.endOfWeek())
    }
    
    // MARK: End of month
    func testCalculatingEndOfMonthFromEndOfMonth() {
        let endOfSeptember_2015 = self.dateFormatter.dateFromString("2015-09-30 23:59:59")!
        
        XCTAssertEqual(endOfSeptember_2015, endOfSeptember_2015.endOfMonth())
    }
    
    func testCalculatingEndOfMonthFromMiddleOfMonth() {
        let endOfSeptember_2015 = self.dateFormatter.dateFromString("2015-09-30 23:59:59")!
        let middleOfSeptember_2015 = self.dateFormatter.dateFromString("2015-09-15 00:00:00")!
        
        XCTAssertEqual(endOfSeptember_2015, middleOfSeptember_2015.endOfMonth())
    }
    
    // MARK: End of year
    func testCalculatingEndOfYearFromEndOfYear() {
        let endOf2015 = self.dateFormatter.dateFromString("2015-12-31 23:59:59")!
        
        XCTAssertEqual(endOf2015, endOf2015.endOfYear())
    }
    
    func testCalculatingEndOfYearFromMiddleOfYear() {
        let endOf2015 = self.dateFormatter.dateFromString("2015-12-31 23:59:59")!
        let middleOf2015 = self.dateFormatter.dateFromString("2015-07-01 00:00:00")!
        
        XCTAssertEqual(endOf2015, middleOf2015.endOfYear())
    }
}
