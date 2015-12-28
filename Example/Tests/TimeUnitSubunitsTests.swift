//
//  TimeUnitSubunitTests.swift
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

class TimeUnitSubunitTests: XCTestCase {
    private var dateFormatter : NSDateFormatter = NSDateFormatter()
    
    private var utilities : TimeUnitTestsUtilities = TimeUnitTestsUtilities()
    
    override func setUp() {
        self.dateFormatter = NSDateFormatter()
        self.dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    }
    
    // MARK: - Creating Time Units
    // MARK: arbitrary subunits
    func testCalculatingHourBetweenSingleDateIncludesDate() {
        let hoursBetween6PM = [
            self.dateFormatter.dateFromString("2015-12-27 18:00:00")!,
        ]
        
        let _6PM = self.dateFormatter.dateFromString("2015-12-27 18:00:00")!
        
        XCTAssertEqual(hoursBetween6PM, TimeUnit().timeUnits(.Hour, fromDate: _6PM, toDate: _6PM))
        XCTAssertEqual(hoursBetween6PM, TimeUnit.timeUnits(.Hour, fromDate: _6PM, toDate: _6PM))
    }
    
    func testCalculatingHoursBetweenDatesIsNotInclusiveOfToDate() {
        let hoursBetween6PM_And_8PM = [
            self.dateFormatter.dateFromString("2015-12-27 18:00:00")!,
            self.dateFormatter.dateFromString("2015-12-27 19:00:00")!,
        ]
        
        let _6PM = self.dateFormatter.dateFromString("2015-12-27 18:00:00")!
        let _8PM = self.dateFormatter.dateFromString("2015-12-27 20:00:00")!
        
        XCTAssertEqual(hoursBetween6PM_And_8PM, TimeUnit().timeUnits(.Hour, fromDate: _6PM, toDate: _8PM))
        XCTAssertEqual(hoursBetween6PM_And_8PM, TimeUnit.timeUnits(.Hour, fromDate: _6PM, toDate: _8PM))
    }
    
    func testCalculatingHoursBetweenAscendingDates() {
        let hoursBetween5_30PM_And_8_30PM = [
            self.dateFormatter.dateFromString("2015-12-27 17:30:00")!,
            self.dateFormatter.dateFromString("2015-12-27 18:30:00")!,
            self.dateFormatter.dateFromString("2015-12-27 19:30:00")!,
        ]
        
        let _5_30PM = self.dateFormatter.dateFromString("2015-12-27 17:30:00")!
        let _8_30PM = self.dateFormatter.dateFromString("2015-12-27 20:30:00")!
        XCTAssertEqual(hoursBetween5_30PM_And_8_30PM, TimeUnit().timeUnits(.Hour, fromDate: _5_30PM, toDate: _8_30PM))
        XCTAssertEqual(hoursBetween5_30PM_And_8_30PM, TimeUnit.timeUnits(.Hour, fromDate: _5_30PM, toDate: _8_30PM))
    }
    
    func testCalculatingHoursBetweenDescendingDates() {
        let hoursBetween8_30PM_And_5_30PM = [
            self.dateFormatter.dateFromString("2015-12-27 20:30:00")!,
            self.dateFormatter.dateFromString("2015-12-27 19:30:00")!,
            self.dateFormatter.dateFromString("2015-12-27 18:30:00")!,
        ]
        
        let _5_30PM = self.dateFormatter.dateFromString("2015-12-27 17:30:00")!
        let _8_30PM = self.dateFormatter.dateFromString("2015-12-27 20:30:00")!
        XCTAssertEqual(hoursBetween8_30PM_And_5_30PM, TimeUnit().timeUnits(.Hour, fromDate: _8_30PM, toDate: _5_30PM))
        XCTAssertEqual(hoursBetween8_30PM_And_5_30PM, TimeUnit.timeUnits(.Hour, fromDate: _8_30PM, toDate: _5_30PM))
    }
    
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
}
