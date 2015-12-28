//
//  TimeUnitContainsTests.swift
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

class TimeUnitContainsTests: XCTestCase {
    private var dateFormatter : NSDateFormatter = NSDateFormatter()
    
    private var utilities : TimeUnitTestsUtilities = TimeUnitTestsUtilities()
    
    override func setUp() {
        self.dateFormatter = NSDateFormatter()
        self.dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    }
    
    // MARK: - Time Unit Contains Date
    // MARK: Date is between dates
    func testDeterminingWhetherDateIsBetweenItself() {
        let _6PM = self.dateFormatter.dateFromString("2015-12-27 18:00:00")!
        
        XCTAssertTrue(TimeUnit().dateIsBetween(_6PM, startDate: _6PM, endDate: _6PM))
        XCTAssertTrue(TimeUnit.dateIsBetween(_6PM, startDate: _6PM, endDate: _6PM))
    }
    
    func testDeterminingWhetherDateIsBetweenAscendingDates() {
        let _5_30PM = self.dateFormatter.dateFromString("2015-12-27 17:30:00")!
        let _6PM = self.dateFormatter.dateFromString("2015-12-27 18:00:00")!
        let _6_30PM = self.dateFormatter.dateFromString("2015-12-27 18:30:00")!
        
        XCTAssertTrue(TimeUnit().dateIsBetween(_6PM, startDate: _5_30PM, endDate: _6_30PM))
        XCTAssertTrue(TimeUnit.dateIsBetween(_6PM, startDate: _5_30PM, endDate: _6_30PM))
    }
    
    func testDeterminingWhetherDateIsBetweenDescendingDates() {
        let _5_30PM = self.dateFormatter.dateFromString("2015-12-27 17:30:00")!
        let _6PM = self.dateFormatter.dateFromString("2015-12-27 18:00:00")!
        let _6_30PM = self.dateFormatter.dateFromString("2015-12-27 18:30:00")!
        
        XCTAssertTrue(TimeUnit().dateIsBetween(_6PM, startDate: _6_30PM, endDate: _5_30PM))
        XCTAssertTrue(TimeUnit.dateIsBetween(_6PM, startDate: _6_30PM, endDate: _5_30PM))
    }
    
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
}