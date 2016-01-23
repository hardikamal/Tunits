//
//  ArrayExtensionTraversalTests.swift
//  Tunits
//
//  Created by Tom on 1/22/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import XCTest
import Tunits

class ArrayExtensionTraversalTests: XCTestCase {
    
// MARK: - Setup & Teardown
    private var dateFormatter: NSDateFormatter!
    private var utilities: TimeUnitTestsUtilities = TimeUnitTestsUtilities()
    
    override func setUp() {
        super.setUp()
        
        self.dateFormatter = NSDateFormatter()
        self.dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    
// MARK: - Tests
// MARK: minutesBefore
    func testMinutesBeforeReturnsEmptyArrayFromEmptyArray() {
        XCTAssertEqual([], [].minutesBefore(1))
    }
    
    func testMinutesBeforeReturnsCorrectDateFromArray() {
        let _10PM = self.dateFormatter.dateFromString("2015-12-27 22:00:00")!
        let _9_59PM = self.dateFormatter.dateFromString("2015-12-27 21:59:00")!
        
        XCTAssertEqual([_9_59PM], [_10PM].minutesBefore(1))
    }
    
    func testMinutesBeforeHasDefaultDeltaOf1() {
        let _10PM = self.dateFormatter.dateFromString("2015-12-27 22:00:00")!
        let _9_59PM = self.dateFormatter.dateFromString("2015-12-27 21:59:00")!
        
        XCTAssertEqual([_9_59PM], [_10PM].minutesBefore())
    }
    
    // MARK: minutesAfter
    func testMinutesAfterReturnsEmptyArrayFromEmptyArray() {
        XCTAssertEqual([], [].minutesAfter(1))
    }
    
    func testMinutesAfterReturnsCorrectDateFromArray() {
        let _10PM = self.dateFormatter.dateFromString("2015-12-27 22:00:00")!
        let _9_59PM = self.dateFormatter.dateFromString("2015-12-27 21:59:00")!
        
        XCTAssertEqual([_10PM], [_9_59PM].minutesAfter(1))
    }
    
    func testMinutesAfterHasDefaultDeltaOf1() {
        let _10PM = self.dateFormatter.dateFromString("2015-12-27 22:00:00")!
        let _9_59PM = self.dateFormatter.dateFromString("2015-12-27 21:59:00")!
        
        XCTAssertEqual([_10PM], [_9_59PM].minutesAfter())
    }
    
    // MARK: minuteBefore
    func testMinuteBeforeReturnsEmptyArrayFromEmptyArray() {
        XCTAssertEqual([], [].minuteBefore())
    }
    
    func testMinuteBeforeReturnsCorrectDateFromArray() {
        let _10PM = self.dateFormatter.dateFromString("2015-12-27 22:00:00")!
        let _9_59PM = self.dateFormatter.dateFromString("2015-12-27 21:59:00")!
        
        XCTAssertEqual([_9_59PM], [_10PM].minuteBefore())
    }
    
    // MARK: minuteAfter
    func testMinuteAfterReturnsEmptyArrayFromEmptyArray() {
        XCTAssertEqual([], [].minuteAfter())
    }
    
    func testMinuteAfterReturnsCorrectDateFromArray() {
        let _10PM = self.dateFormatter.dateFromString("2015-12-27 22:00:00")!
        let _9_59PM = self.dateFormatter.dateFromString("2015-12-27 21:59:00")!
        
        XCTAssertEqual([_10PM], [_9_59PM].minuteAfter())
    }
    
    // MARK: hoursBefore
    func testHoursBeforeReturnsEmptyArrayFromEmptyArray() {
        XCTAssertEqual([], [].hoursBefore())
    }
    
    func testHoursBeforeReturnsCorrectDatesFromArray() {
        let september29_11_2015 = self.dateFormatter.dateFromString("2015-09-29 11:00:00")!
        let september29_10_2015 = self.dateFormatter.dateFromString("2015-09-29 10:00:00")!
        
        XCTAssertEqual([september29_10_2015], [september29_11_2015].hoursBefore(1))
    }
    
    func testHoursBeforeHasDefaultDeltaOf1() {
        let september29_11_2015 = self.dateFormatter.dateFromString("2015-09-29 11:00:00")!
        let september29_10_2015 = self.dateFormatter.dateFromString("2015-09-29 10:00:00")!
        
        XCTAssertEqual([september29_10_2015], [september29_11_2015].hoursBefore())
    }
    
    // MARK: hoursAfter
    func testHoursAfterReturnsEmptyArrayFromEmptyArray() {
        XCTAssertEqual([], [].hoursAfter())
    }
    
    func testHoursAfterReturnsCorrectDatesFromArray() {
        let september29_11_2015 = self.dateFormatter.dateFromString("2015-09-29 11:00:00")!
        let september29_10_2015 = self.dateFormatter.dateFromString("2015-09-29 10:00:00")!
        
        XCTAssertEqual([september29_11_2015], [september29_10_2015].hoursAfter(1))
    }
    
    func testHoursAfterHasDefaultDeltaOf1() {
        let september29_11_2015 = self.dateFormatter.dateFromString("2015-09-29 11:00:00")!
        let september29_10_2015 = self.dateFormatter.dateFromString("2015-09-29 10:00:00")!
        
        XCTAssertEqual([september29_11_2015], [september29_10_2015].hoursAfter())
    }
    
    // MARK: hourBefore
    func testHourBeforeReturnsEmptyArrayFromEmptyArray() {
        XCTAssertEqual([], [].hourBefore())
    }
    
    func testHourBeforeReturnsCorrectDatesFromArray() {
        let september29_11_2015 = self.dateFormatter.dateFromString("2015-09-29 11:00:00")!
        let september29_10_2015 = self.dateFormatter.dateFromString("2015-09-29 10:00:00")!
        
        XCTAssertEqual([september29_10_2015], [september29_11_2015].hourBefore())
    }
    
    // MARK: hourAfter
    func testHourAfterReturnsEmptyArrayFromEmptyArray() {
        XCTAssertEqual([], [].hourAfter())
    }
    
    func testHourAfterReturnsCorrectDatesFromArray() {
        let september29_11_2015 = self.dateFormatter.dateFromString("2015-09-29 11:00:00")!
        let september29_10_2015 = self.dateFormatter.dateFromString("2015-09-29 10:00:00")!
        
        XCTAssertEqual([september29_11_2015], [september29_10_2015].hourAfter())
    }
    
    // MARK: daysBefore
    func testDaysBeforeReturnsEmptyArrayFromEmptyArray() {
        XCTAssertEqual([], [].daysBefore())
    }
    
    func testDaysBeforeReturnsCorrectDatesFromArray() {
        let september29_2015 = self.dateFormatter.dateFromString("2015-09-29 00:00:00")!
        let september30_2015 = self.dateFormatter.dateFromString("2015-09-30 00:00:00")!
        
        XCTAssertEqual([september29_2015], [september30_2015].daysBefore(1))
    }
    
    func testDaysBeforeHasDefaultDeltaOf1() {
        let september29_2015 = self.dateFormatter.dateFromString("2015-09-29 00:00:00")!
        let september30_2015 = self.dateFormatter.dateFromString("2015-09-30 00:00:00")!
        
        XCTAssertEqual([september29_2015], [september30_2015].daysBefore())
    }
    
    // MARK: daysAfter
    func testDaysAfterReturnsEmptyArrayFromEmptyArray() {
        XCTAssertEqual([], [].daysAfter())
    }
    
    func testDaysAfterReturnsCorrectDatesFromArray() {
        let september29_2015 = self.dateFormatter.dateFromString("2015-09-29 00:00:00")!
        let september30_2015 = self.dateFormatter.dateFromString("2015-09-30 00:00:00")!
        
        XCTAssertEqual([september30_2015], [september29_2015].daysAfter(1))
    }
    
    func testDaysAfterHasDefaultDeltaOf1() {
        let september29_2015 = self.dateFormatter.dateFromString("2015-09-29 00:00:00")!
        let september30_2015 = self.dateFormatter.dateFromString("2015-09-30 00:00:00")!
        
        XCTAssertEqual([september30_2015], [september29_2015].daysAfter())
    }
    
    // MARK: dayBefore
    func testDayBeforeReturnsEmptyArrayFromEmptyArray() {
        XCTAssertEqual([], [].dayBefore())
    }
    
    func testDayBeforeReturnsCorrectDatesFromArray() {
        let september29_2015 = self.dateFormatter.dateFromString("2015-09-29 00:00:00")!
        let september30_2015 = self.dateFormatter.dateFromString("2015-09-30 00:00:00")!
        
        XCTAssertEqual([september29_2015], [september30_2015].dayBefore())
    }
    
    // MARK: dayAfter
    func testDayAfterReturnsEmptyArrayFromEmptyArray() {
        XCTAssertEqual([], [].dayAfter())
    }
    
    func testDayAfterReturnsCorrectDatesFromArray() {
        let september29_2015 = self.dateFormatter.dateFromString("2015-09-29 00:00:00")!
        let september30_2015 = self.dateFormatter.dateFromString("2015-09-30 00:00:00")!
        
        XCTAssertEqual([september30_2015], [september29_2015].dayAfter())
    }
    
    // MARK: weeksBefore
    func testWeeksBeforeReturnsEmptyArrayFromEmptyArray() {
        XCTAssertEqual([], [].weeksBefore())
    }
    
    func testWeeksBeforeReturnsCorrectDatesFromArray() {
        let september27_2015 = self.dateFormatter.dateFromString("2015-09-27 00:00:00")!
        let october4_2015 = self.dateFormatter.dateFromString("2015-10-04 00:00:00")!
        
        TimeUnit.setStaticCalendar(self.utilities.calendarWithSundayAsFirstWeekday())
        XCTAssertEqual([september27_2015], [october4_2015].weeksBefore(1))
    }
    
    func testWeeksBeforeHasDefaultDeltaOf1() {
        let september27_2015 = self.dateFormatter.dateFromString("2015-09-27 00:00:00")!
        let october4_2015 = self.dateFormatter.dateFromString("2015-10-04 00:00:00")!
        
        TimeUnit.setStaticCalendar(self.utilities.calendarWithSundayAsFirstWeekday())
        XCTAssertEqual([september27_2015], [october4_2015].weeksBefore())
    }
    
    // MARK: weeksAfter
    func testWeeksAfterReturnsEmptyArrayFromEmptyArray() {
        XCTAssertEqual([], [].weeksAfter())
    }
    
    func testWeeksAfterReturnsCorrectDatesFromArray() {
        let september27_2015 = self.dateFormatter.dateFromString("2015-09-27 00:00:00")!
        let october4_2015 = self.dateFormatter.dateFromString("2015-10-04 00:00:00")!
        
        TimeUnit.setStaticCalendar(self.utilities.calendarWithSundayAsFirstWeekday())
        XCTAssertEqual([october4_2015], [september27_2015].weeksAfter(1))
    }
    
    func testWeeksAfterHasDefaultDeltaOf1() {
        let september27_2015 = self.dateFormatter.dateFromString("2015-09-27 00:00:00")!
        let october4_2015 = self.dateFormatter.dateFromString("2015-10-04 00:00:00")!
        
        TimeUnit.setStaticCalendar(self.utilities.calendarWithSundayAsFirstWeekday())
        XCTAssertEqual([october4_2015], [september27_2015].weeksAfter())
    }
    
    // MARK: weekBefore
    func testWeekBeforeReturnsEmptyArrayFromEmptyArray() {
        XCTAssertEqual([], [].weekBefore())
    }
    
    func testWeekBeforeReturnsCorrectDatesFromArray() {
        let september27_2015 = self.dateFormatter.dateFromString("2015-09-27 00:00:00")!
        let october4_2015 = self.dateFormatter.dateFromString("2015-10-04 00:00:00")!
        
        TimeUnit.setStaticCalendar(self.utilities.calendarWithSundayAsFirstWeekday())
        XCTAssertEqual([september27_2015], [october4_2015].weekBefore())
    }
    
    // MARK: weekAfter
    func testWeekAfterReturnsEmptyArrayFromEmptyArray() {
        XCTAssertEqual([], [].weekAfter())
    }
    
    func testWeekAfterReturnsCorrectDatesFromArray() {
        let september27_2015 = self.dateFormatter.dateFromString("2015-09-27 00:00:00")!
        let october4_2015 = self.dateFormatter.dateFromString("2015-10-04 00:00:00")!
        
        TimeUnit.setStaticCalendar(self.utilities.calendarWithSundayAsFirstWeekday())
        XCTAssertEqual([october4_2015], [september27_2015].weekAfter())
    }
    
    // MARK: monthsBefore
    func testMonthsBeforeReturnsEmptyArrayFromEmptyArray() {
        XCTAssertEqual([], [].monthsBefore())
    }
    
    func testMonthsBeforeReturnsCorrectDateFromArray() {
        let september1_2015 = self.dateFormatter.dateFromString("2015-09-01 00:00:00")!
        let october1_2015 = self.dateFormatter.dateFromString("2015-10-01 00:00:00")!
        
        XCTAssertEqual([september1_2015], [october1_2015].monthsBefore(1))
    }
    
    func testMonthsBeforeHasDefaultDeltaOf1() {
        let september1_2015 = self.dateFormatter.dateFromString("2015-09-01 00:00:00")!
        let october1_2015 = self.dateFormatter.dateFromString("2015-10-01 00:00:00")!
        
        XCTAssertEqual([september1_2015], [october1_2015].monthsBefore())
    }
    
    // MARK: monthsAfter
    func testMonthsAfterReturnsEmptyArrayFromEmptyArray() {
        XCTAssertEqual([], [].monthsAfter())
    }
    
    func testMonthsAfterReturnsCorrectDateFromArray() {
        let september1_2015 = self.dateFormatter.dateFromString("2015-09-01 00:00:00")!
        let october1_2015 = self.dateFormatter.dateFromString("2015-10-01 00:00:00")!
        
        XCTAssertEqual([october1_2015], [september1_2015].monthsAfter(1))
    }
    
    func testMonthsAfterHasDefaultDeltaOf1() {
        let september1_2015 = self.dateFormatter.dateFromString("2015-09-01 00:00:00")!
        let october1_2015 = self.dateFormatter.dateFromString("2015-10-01 00:00:00")!
        
        XCTAssertEqual([october1_2015], [september1_2015].monthsAfter())
    }
    
    // MARK: monthBefore
    func testMonthBeforeReturnsEmptyArrayFromEmptyArray() {
        XCTAssertEqual([], [].monthBefore())
    }
    
    func testMonthBeforeReturnsCorrectDateFromArray() {
        let september1_2015 = self.dateFormatter.dateFromString("2015-09-01 00:00:00")!
        let october1_2015 = self.dateFormatter.dateFromString("2015-10-01 00:00:00")!
        
        XCTAssertEqual([september1_2015], [october1_2015].monthBefore())
    }
    
    // MARK: monthAfter
    func testMonthAfterReturnsEmptyArrayFromEmptyArray() {
        XCTAssertEqual([], [].monthAfter())
    }
    
    func testMonthAfterReturnsCorrectDateFromArray() {
        let september1_2015 = self.dateFormatter.dateFromString("2015-09-01 00:00:00")!
        let october1_2015 = self.dateFormatter.dateFromString("2015-10-01 00:00:00")!
        
        XCTAssertEqual([october1_2015], [september1_2015].monthAfter())
    }
    
    // MARK: yearsBefore
    func testYearsBeforeReturnsEmptyArrayFromEmptyArray() {
        XCTAssertEqual([], [].yearsBefore())
    }
    
    func testYearsBeforeReturnsCorrectDatesFromArray() {
        let _2015 = self.dateFormatter.dateFromString("2015-01-01 00:00:00")!
        let _2016 = self.dateFormatter.dateFromString("2016-01-01 00:00:00")!
        
        XCTAssertEqual([_2015], [_2016].yearsBefore(1))
    }
    
    func testYearsBeforeHasDefaultDeltaOf1() {
        let _2015 = self.dateFormatter.dateFromString("2015-01-01 00:00:00")!
        let _2016 = self.dateFormatter.dateFromString("2016-01-01 00:00:00")!
        
        XCTAssertEqual([_2015], [_2016].yearsBefore())
    }
    
    // MARK: yearsAfter
    func testYearsAfterReturnsEmptyArrayFromEmptyArray() {
        XCTAssertEqual([], [].yearsAfter())
    }
    
    func testYearsAfterReturnsCorrectDatesFromArray() {
        let _2015 = self.dateFormatter.dateFromString("2015-01-01 00:00:00")!
        let _2016 = self.dateFormatter.dateFromString("2016-01-01 00:00:00")!
        
        XCTAssertEqual([_2016], [_2015].yearsAfter(1))
    }
    
    func testYearsAfterHasDefaultDeltaOf1() {
        let _2015 = self.dateFormatter.dateFromString("2015-01-01 00:00:00")!
        let _2016 = self.dateFormatter.dateFromString("2016-01-01 00:00:00")!
        
        XCTAssertEqual([_2016], [_2015].yearsAfter())
    }
    
    // MARK: yearBefore
    func testYearBeforeReturnsEmptyArrayFromEmptyArray() {
        XCTAssertEqual([], [].yearBefore())
    }
    
    func testYearBeforeReturnsCorrectDatesFromArray() {
        let _2015 = self.dateFormatter.dateFromString("2015-01-01 00:00:00")!
        let _2016 = self.dateFormatter.dateFromString("2016-01-01 00:00:00")!
        
        XCTAssertEqual([_2015], [_2016].yearBefore())
    }
    
    // MARK: yearAfter
    func testYearAfterReturnsEmptyArrayFromEmptyArray() {
        XCTAssertEqual([], [].yearAfter())
    }
    
    func testYearAfterReturnsCorrectDatesFromArray() {
        let _2015 = self.dateFormatter.dateFromString("2015-01-01 00:00:00")!
        let _2016 = self.dateFormatter.dateFromString("2016-01-01 00:00:00")!
        
        XCTAssertEqual([_2016], [_2015].yearAfter())
    }
}
