//
//  TimeUnitTraversalTests.swift
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

class TimeUnitTraversalTests: XCTestCase {
    private var dateFormatter : NSDateFormatter = NSDateFormatter()
    
    private var utilities : TimeUnitTestsUtilities = TimeUnitTestsUtilities()
    
    override func setUp() {
        self.dateFormatter = NSDateFormatter()
        self.dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
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
