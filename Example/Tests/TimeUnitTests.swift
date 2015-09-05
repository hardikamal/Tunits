//
//  TimeUnitTests.swift
//  Tunits
//
//  Created by Tom on 9/4/15.
//  Copyright (c) 2015 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import Tunits

class TimeUnitTests: QuickSpec {
    override func spec() {
        describe("Initialization") {
            it ("can be initialized") {
                expect(TimeUnit()).toNot(beNil())
            }
        }
        
        describe("Creating time units") {
            var dateFormatter : NSDateFormatter!
            beforeEach {
                dateFormatter = NSDateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            }
            
            it ("can create the hours of September 5, 2015") {
                let hoursInSeptember5_2015 = [
                    dateFormatter.dateFromString("2015-09-05 00:00:00")!,
                    dateFormatter.dateFromString("2015-09-05 01:00:00")!,
                    dateFormatter.dateFromString("2015-09-05 02:00:00")!,
                    dateFormatter.dateFromString("2015-09-05 03:00:00")!,
                    dateFormatter.dateFromString("2015-09-05 04:00:00")!,
                    dateFormatter.dateFromString("2015-09-05 05:00:00")!,
                    dateFormatter.dateFromString("2015-09-05 06:00:00")!,
                    dateFormatter.dateFromString("2015-09-05 07:00:00")!,
                    dateFormatter.dateFromString("2015-09-05 08:00:00")!,
                    dateFormatter.dateFromString("2015-09-05 09:00:00")!,
                    dateFormatter.dateFromString("2015-09-05 10:00:00")!,
                    dateFormatter.dateFromString("2015-09-05 11:00:00")!,
                    dateFormatter.dateFromString("2015-09-05 12:00:00")!,
                    dateFormatter.dateFromString("2015-09-05 13:00:00")!,
                    dateFormatter.dateFromString("2015-09-05 14:00:00")!,
                    dateFormatter.dateFromString("2015-09-05 15:00:00")!,
                    dateFormatter.dateFromString("2015-09-05 16:00:00")!,
                    dateFormatter.dateFromString("2015-09-05 17:00:00")!,
                    dateFormatter.dateFromString("2015-09-05 18:00:00")!,
                    dateFormatter.dateFromString("2015-09-05 19:00:00")!,
                    dateFormatter.dateFromString("2015-09-05 20:00:00")!,
                    dateFormatter.dateFromString("2015-09-05 21:00:00")!,
                    dateFormatter.dateFromString("2015-09-05 22:00:00")!,
                    dateFormatter.dateFromString("2015-09-05 23:00:00")!,
                ]
                
                let dateInSeptember5_2015 = dateFormatter.dateFromString("2015-09-05 17:23:37")!
                expect(TimeUnit().hoursOfDay(dateInSeptember5_2015)).to(equal(hoursInSeptember5_2015))
            }
            
            it ("can create days of February 2015") {
                let daysInFebruary15 = [
                    dateFormatter.dateFromString("2015-02-01 00:00:00")!,
                    dateFormatter.dateFromString("2015-02-02 00:00:00")!,
                    dateFormatter.dateFromString("2015-02-03 00:00:00")!,
                    dateFormatter.dateFromString("2015-02-04 00:00:00")!,
                    dateFormatter.dateFromString("2015-02-05 00:00:00")!,
                    dateFormatter.dateFromString("2015-02-06 00:00:00")!,
                    dateFormatter.dateFromString("2015-02-07 00:00:00")!,
                    dateFormatter.dateFromString("2015-02-08 00:00:00")!,
                    dateFormatter.dateFromString("2015-02-09 00:00:00")!,
                    dateFormatter.dateFromString("2015-02-10 00:00:00")!,
                    dateFormatter.dateFromString("2015-02-11 00:00:00")!,
                    dateFormatter.dateFromString("2015-02-12 00:00:00")!,
                    dateFormatter.dateFromString("2015-02-13 00:00:00")!,
                    dateFormatter.dateFromString("2015-02-14 00:00:00")!,
                    dateFormatter.dateFromString("2015-02-15 00:00:00")!,
                    dateFormatter.dateFromString("2015-02-16 00:00:00")!,
                    dateFormatter.dateFromString("2015-02-17 00:00:00")!,
                    dateFormatter.dateFromString("2015-02-18 00:00:00")!,
                    dateFormatter.dateFromString("2015-02-19 00:00:00")!,
                    dateFormatter.dateFromString("2015-02-20 00:00:00")!,
                    dateFormatter.dateFromString("2015-02-21 00:00:00")!,
                    dateFormatter.dateFromString("2015-02-22 00:00:00")!,
                    dateFormatter.dateFromString("2015-02-23 00:00:00")!,
                    dateFormatter.dateFromString("2015-02-24 00:00:00")!,
                    dateFormatter.dateFromString("2015-02-25 00:00:00")!,
                    dateFormatter.dateFromString("2015-02-26 00:00:00")!,
                    dateFormatter.dateFromString("2015-02-27 00:00:00")!,
                    dateFormatter.dateFromString("2015-02-28 00:00:00")!,
                ]
                
                let dateInFebruary = dateFormatter.dateFromString("2015-02-03 11:24:57")!
                expect(TimeUnit().daysOfMonth(dateInFebruary)).to(equal(daysInFebruary15))
            }
            
            it ("can create days of February 2012") { // test leap year
                let daysInFebruary12 = [
                    dateFormatter.dateFromString("2012-02-01 00:00:00")!,
                    dateFormatter.dateFromString("2012-02-02 00:00:00")!,
                    dateFormatter.dateFromString("2012-02-03 00:00:00")!,
                    dateFormatter.dateFromString("2012-02-04 00:00:00")!,
                    dateFormatter.dateFromString("2012-02-05 00:00:00")!,
                    dateFormatter.dateFromString("2012-02-06 00:00:00")!,
                    dateFormatter.dateFromString("2012-02-07 00:00:00")!,
                    dateFormatter.dateFromString("2012-02-08 00:00:00")!,
                    dateFormatter.dateFromString("2012-02-09 00:00:00")!,
                    dateFormatter.dateFromString("2012-02-10 00:00:00")!,
                    dateFormatter.dateFromString("2012-02-11 00:00:00")!,
                    dateFormatter.dateFromString("2012-02-12 00:00:00")!,
                    dateFormatter.dateFromString("2012-02-13 00:00:00")!,
                    dateFormatter.dateFromString("2012-02-14 00:00:00")!,
                    dateFormatter.dateFromString("2012-02-15 00:00:00")!,
                    dateFormatter.dateFromString("2012-02-16 00:00:00")!,
                    dateFormatter.dateFromString("2012-02-17 00:00:00")!,
                    dateFormatter.dateFromString("2012-02-18 00:00:00")!,
                    dateFormatter.dateFromString("2012-02-19 00:00:00")!,
                    dateFormatter.dateFromString("2012-02-20 00:00:00")!,
                    dateFormatter.dateFromString("2012-02-21 00:00:00")!,
                    dateFormatter.dateFromString("2012-02-22 00:00:00")!,
                    dateFormatter.dateFromString("2012-02-23 00:00:00")!,
                    dateFormatter.dateFromString("2012-02-24 00:00:00")!,
                    dateFormatter.dateFromString("2012-02-25 00:00:00")!,
                    dateFormatter.dateFromString("2012-02-26 00:00:00")!,
                    dateFormatter.dateFromString("2012-02-27 00:00:00")!,
                    dateFormatter.dateFromString("2012-02-28 00:00:00")!,
                    dateFormatter.dateFromString("2012-02-29 00:00:00")!,
                ]
                
                let dateInFebruary = dateFormatter.dateFromString("2012-02-27 09:17:03")!
                expect(TimeUnit().daysOfMonth(dateInFebruary)).to(equal(daysInFebruary12))
            }
        }
    }
}
