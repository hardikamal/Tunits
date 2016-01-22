//
//  ArrayExtensionSubunitsTests.swift
//  Tunits
//
//  Created by Tom on 1/22/15.
//  Copyright © 2016 CocoaPods. All rights reserved.
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

import XCTest
import Tunits

class ArrayExtensionSubunitsTests: XCTestCase {
    
// MARK: Setup & Teardown
    
    private var dateFormatter : NSDateFormatter!
    
    override func setUp() {
        super.setUp()

        self.dateFormatter = NSDateFormatter()
        self.dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
// MARK: - Tests
// MARK: minutesOfHour
    func testMinutesOfHourReturnsEmptyArrayFromEmptyArray() {
        XCTAssertEqual([], [].minutesOfHour())
    }
    
    func testMinutesOfHourReturnsMinutesOfHourForArrayWithOneDate() {
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
        
        XCTAssertEqual(minutesIn7AM_September5_2015, [minuteIn7AM_September5_2015].minutesOfHour())
    }
    
    
// MARK: hoursOfDay
    
    func testHoursOfDayReturnsEmptyArrayFromEmptyArray() {
        XCTAssertEqual([], [].hoursOfDay())
    }
    
    func testHoursOfDayReturnsHoursOfDayForArrayWithOneDate() {
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
        
        XCTAssertEqual(hoursInSeptember5_2015, [dateInSeptember5_2015].hoursOfDay())
    }
    
// MARK: daysOfWeek
    
    func testDaysOfWeekReturnsEmptyArrayFromEmptyArray() {
        XCTAssertEqual([], [].daysOfWeek())
    }
    
    func testDaysOfWeekReturnsDaysOfWeekFromArrayWithOneDate() {
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
        
        XCTAssertEqual(daysOfWeekOctober7_2015, [dateInWeekOfOctober7_2015].daysOfWeek())
    }
    
// MARK: daysOfMonth
    
    func testDaysOfMonthReturnsEmptyArrayFromEmptyArray() {
        XCTAssertEqual([], [].daysOfMonth())
    }
    
    func testDaysOfMonthReturnsDaysOfMonthForArrayWithOneDate() {
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
        
        XCTAssertEqual(daysInFebruary_2015, [dateInFebruary].daysOfMonth())
    }

// MARK: monthsOfYear

    func testMonthsOfYearReturnsEmptyArrayFromEmptyArray() {
        XCTAssertEqual([], [].monthsOfYear())
    }
    
    func testMonthsOfYearReturnsMonthsOfYearFromArrayWithOneDate() {
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
        
        XCTAssertEqual(monthsIn_2015, [dateIn_2015].monthsOfYear())
    }
    
}