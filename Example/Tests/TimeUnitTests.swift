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
        
        describe("Calculating beginning of time units") {
            var dateFormatter : NSDateFormatter!
            beforeEach {
                dateFormatter = NSDateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            }
            
            it ("can calculate the beginning of an hour for date at the beginning of the hour") {
                let beginningOf7AM = dateFormatter.dateFromString("2015-09-08 7:00:00")!
                expect(TimeUnit().beginningOfHour(beginningOf7AM)).to(equal(beginningOf7AM))
            }
            
            it ("can calculate the beginning of an hour for date in the middle of the hour") {
                let beginningOf7AM = dateFormatter.dateFromString("2015-09-08 7:00:00")!
                let middleOf7AM = dateFormatter.dateFromString("2015-09-08 7:30:00")!
                expect(TimeUnit().beginningOfHour(middleOf7AM)).to(equal(beginningOf7AM))
            }
            
            it ("can calculate the beginning of an hour for random date within the hour") {
                let beginningOf7AM = dateFormatter.dateFromString("2015-09-08 7:00:00")!
                let randomTimeIn7AM = dateFormatter.dateFromString("2015-09-08 7:17:52")!
                expect(TimeUnit().beginningOfHour(randomTimeIn7AM)).to(equal(beginningOf7AM))
            }
            
            it ("can calculate the beginning of a day for date at the beginning of the day") {
                let beginningOfSeptember8_2015 = dateFormatter.dateFromString("2015-09-08 00:00:00")!
                expect(TimeUnit().beginningOfDay(beginningOfSeptember8_2015)).to(equal(beginningOfSeptember8_2015))
            }
            
            it ("can calculate the beginning of a day for date in the middle of the day") {
                let beginningOfSeptember8_2015 = dateFormatter.dateFromString("2015-09-08 00:00:00")!
                let middleOfSeptember8_2015 = dateFormatter.dateFromString("2015-09-08 12:00:00")!
                expect(TimeUnit().beginningOfDay(middleOfSeptember8_2015)).to(equal(beginningOfSeptember8_2015))
            }
            
            it ("can calculate the beginning of a day for a random date within the day") {
                let beginningOfSeptember8_2015 = dateFormatter.dateFromString("2015-09-08 00:00:00")!
                let randomTimeInSeptember8_2015 = dateFormatter.dateFromString("2015-09-08 17:30:27")!
                expect(TimeUnit().beginningOfDay(randomTimeInSeptember8_2015)).to(equal(beginningOfSeptember8_2015))
            }
            
            it ("can calculate the beginning of a month for date at the beginning of the month") {
                let beginningOfSeptember_2015 = dateFormatter.dateFromString("2015-09-01 00:00:00")!
                expect(TimeUnit().beginningOfMonth(beginningOfSeptember_2015)).to(equal(beginningOfSeptember_2015))
            }
            
            it ("can calculate the beginning of a month for date in the middle of the month") {
                let beginningOfSeptember_2015 = dateFormatter.dateFromString("2015-09-01 00:00:00")!
                let middleOfSeptember_2015 = dateFormatter.dateFromString("2015-09-15 12:00:00")!
                expect(TimeUnit().beginningOfMonth(middleOfSeptember_2015)).to(equal(beginningOfSeptember_2015))
            }
            
            it ("can calculate the beginning of a month for random date within the month") {
                let beginningOfSeptember_2015 = dateFormatter.dateFromString("2015-09-01 00:00:00")!
                let randomDateInSeptember_2015 = dateFormatter.dateFromString("2015-09-08 17:34:49")!
                expect(TimeUnit().beginningOfMonth(randomDateInSeptember_2015)).to(equal(beginningOfSeptember_2015))
            }
            
            it ("can calculate the beginning of a year for date at the beginning of the year") {
                let beginningOf2015 = dateFormatter.dateFromString("2015-01-01 00:00:00")!
                expect(TimeUnit().beginningOfYear(beginningOf2015)).to(equal(beginningOf2015))
            }
            
            it ("can calculate the beginning of a year for date in the middle of the year") {
                let beginningOf2015 = dateFormatter.dateFromString("2015-01-01 00:00:00")!
                let middleOf2015 = dateFormatter.dateFromString("2015-07-01 00:00:00")!
                expect(TimeUnit().beginningOfYear(middleOf2015)).to(equal(beginningOf2015))
            }
            
            it ("can calculate the beginning of a year from a random date within the year") {
                let beginningOf2015 = dateFormatter.dateFromString("2015-01-01 00:00:00")!
                let randomDateIn2015 = dateFormatter.dateFromString("2015-09-08 17:38:12")!
                expect(TimeUnit().beginningOfYear(randomDateIn2015)).to(equal(beginningOf2015))
            }
        }
        
        describe("Calculating the end of time units") {
            var dateFormatter : NSDateFormatter!
            beforeEach {
                dateFormatter = NSDateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            }
            
            it ("can calculate the end of an hour for date at the end of the hour") {
                let endOf5PM = dateFormatter.dateFromString("2015-09-08 17:59:59")!
                expect(TimeUnit().endOfHour(endOf5PM)).to(equal(endOf5PM))
            }
            
            it ("can calculate the end of an hour for date in the middle of the hour") {
                let endOf5PM = dateFormatter.dateFromString("2015-09-08 17:59:59")!
                let middleOf5PM = dateFormatter.dateFromString("2015-09-08 17:30:00")!
                expect(TimeUnit().endOfHour(middleOf5PM)).to(equal(endOf5PM))
            }
            
            it ("can calculate the end of an hour for date at random time within the hour") {
                let endOf5PM = dateFormatter.dateFromString("2015-09-08 17:59:59")!
                let randomTimeIn5PM = dateFormatter.dateFromString("2015-09-08 17:46:12")!
                expect(TimeUnit().endOfHour(randomTimeIn5PM)).to(equal(endOf5PM))
            }
            
            it ("can calculate the end of a day for date at the end of the day") {
                let endOfSeptember8_2015 = dateFormatter.dateFromString("2015-09-08 23:59:59")!
                expect(TimeUnit().endOfDay(endOfSeptember8_2015)).to(equal(endOfSeptember8_2015))
            }
            
            it ("can calculate the end of a day for date in the middle of the day") {
                let endOfSeptember8_2015 = dateFormatter.dateFromString("2015-09-08 23:59:59")!
                let middleOfSeptember8_2015 = dateFormatter.dateFromString("2015-09-08 12:00:00")!
                expect(TimeUnit().endOfDay(middleOfSeptember8_2015)).to(equal(endOfSeptember8_2015))
            }
            
            it ("can calculate the end of a day for date at random time within the day") {
                let endOfSeptember8_2015 = dateFormatter.dateFromString("2015-09-08 23:59:59")!
                let randomTimeInSeptember8_2015 = dateFormatter.dateFromString("2015-09-08 17:49:32")!
                expect(TimeUnit().endOfDay(randomTimeInSeptember8_2015)).to(equal(endOfSeptember8_2015))
            }
            
            it ("can calculate the end of a month for date at the end of the month") {
                let endOfSeptember_2015 = dateFormatter.dateFromString("2015-09-30 23:59:59")!
                expect(TimeUnit().endOfMonth(endOfSeptember_2015)).to(equal(endOfSeptember_2015))
            }
            
            it ("can calculate the end of a month for date in the middle of the month") {
                let endOfSeptember_2015 = dateFormatter.dateFromString("2015-09-30 23:59:59")!
                let middleOfSeptember_2105 = dateFormatter.dateFromString("2015-09-15 00:00:00")!
                expect(TimeUnit().endOfMonth(middleOfSeptember_2105)).to(equal(endOfSeptember_2015))
            }
            
            it ("can calculate the end of a month for date in the middle of the month") {
                let endOfSeptember8_2015 = dateFormatter.dateFromString("2015-09-30 23:59:59")!
                let randomDateInSeptember_2015 = dateFormatter.dateFromString("2015-09-08 17:51:01")!
                expect(TimeUnit().endOfMonth(randomDateInSeptember_2015)).to(equal(endOfSeptember8_2015))
            }
            
            it ("can calculate the end of a year for date at the end of the year") {
                let endOf2015 = dateFormatter.dateFromString("2015-12-31 23:59:59")!
                expect(TimeUnit().endOfYear(endOf2015)).to(equal(endOf2015))
            }
            
            it ("can calculate the end of a year for date in the middle of the year") {
                let endOf2015 = dateFormatter.dateFromString("2015-12-31 23:59:59")!
                let middleOf2015 = dateFormatter.dateFromString("2015-07-01 00:00:00")!
                expect(TimeUnit().endOfYear(middleOf2015)).to(equal(endOf2015))
            }
            
            it ("can calculate the end of a year for random date within the year") {
                let endOf2015 = dateFormatter.dateFromString("2015-12-31 23:59:59")!
                let randomDateIn2015 = dateFormatter.dateFromString("2015-09-08 17:54:35")!
                expect(TimeUnit().endOfYear(randomDateIn2015)).to(equal(endOf2015))
            }
            
        }
        
// MARK: - Creating Time Units
        describe("Creating time units") {
            var dateFormatter : NSDateFormatter!
            beforeEach {
                dateFormatter = NSDateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            }
            
// MARK: minutesOfHours
            it ("can create the minutes of 7:00AM September 5, 2015") {
                let minutesIn7AM_September5_2015 = [
                    dateFormatter.dateFromString("2015-09-05 7:00:00")!,
                    dateFormatter.dateFromString("2015-09-05 7:01:00")!,
                    dateFormatter.dateFromString("2015-09-05 7:02:00")!,
                    dateFormatter.dateFromString("2015-09-05 7:03:00")!,
                    dateFormatter.dateFromString("2015-09-05 7:04:00")!,
                    dateFormatter.dateFromString("2015-09-05 7:05:00")!,
                    dateFormatter.dateFromString("2015-09-05 7:06:00")!,
                    dateFormatter.dateFromString("2015-09-05 7:07:00")!,
                    dateFormatter.dateFromString("2015-09-05 7:08:00")!,
                    dateFormatter.dateFromString("2015-09-05 7:09:00")!,
                    dateFormatter.dateFromString("2015-09-05 7:10:00")!,
                    dateFormatter.dateFromString("2015-09-05 7:11:00")!,
                    dateFormatter.dateFromString("2015-09-05 7:12:00")!,
                    dateFormatter.dateFromString("2015-09-05 7:13:00")!,
                    dateFormatter.dateFromString("2015-09-05 7:14:00")!,
                    dateFormatter.dateFromString("2015-09-05 7:15:00")!,
                    dateFormatter.dateFromString("2015-09-05 7:16:00")!,
                    dateFormatter.dateFromString("2015-09-05 7:17:00")!,
                    dateFormatter.dateFromString("2015-09-05 7:18:00")!,
                    dateFormatter.dateFromString("2015-09-05 7:19:00")!,
                    dateFormatter.dateFromString("2015-09-05 7:20:00")!,
                    dateFormatter.dateFromString("2015-09-05 7:21:00")!,
                    dateFormatter.dateFromString("2015-09-05 7:22:00")!,
                    dateFormatter.dateFromString("2015-09-05 7:23:00")!,
                    dateFormatter.dateFromString("2015-09-05 7:24:00")!,
                    dateFormatter.dateFromString("2015-09-05 7:25:00")!,
                    dateFormatter.dateFromString("2015-09-05 7:26:00")!,
                    dateFormatter.dateFromString("2015-09-05 7:27:00")!,
                    dateFormatter.dateFromString("2015-09-05 7:28:00")!,
                    dateFormatter.dateFromString("2015-09-05 7:29:00")!,
                    dateFormatter.dateFromString("2015-09-05 7:30:00")!,
                    dateFormatter.dateFromString("2015-09-05 7:31:00")!,
                    dateFormatter.dateFromString("2015-09-05 7:32:00")!,
                    dateFormatter.dateFromString("2015-09-05 7:33:00")!,
                    dateFormatter.dateFromString("2015-09-05 7:34:00")!,
                    dateFormatter.dateFromString("2015-09-05 7:35:00")!,
                    dateFormatter.dateFromString("2015-09-05 7:36:00")!,
                    dateFormatter.dateFromString("2015-09-05 7:37:00")!,
                    dateFormatter.dateFromString("2015-09-05 7:38:00")!,
                    dateFormatter.dateFromString("2015-09-05 7:39:00")!,
                    dateFormatter.dateFromString("2015-09-05 7:40:00")!,
                    dateFormatter.dateFromString("2015-09-05 7:41:00")!,
                    dateFormatter.dateFromString("2015-09-05 7:42:00")!,
                    dateFormatter.dateFromString("2015-09-05 7:43:00")!,
                    dateFormatter.dateFromString("2015-09-05 7:44:00")!,
                    dateFormatter.dateFromString("2015-09-05 7:45:00")!,
                    dateFormatter.dateFromString("2015-09-05 7:46:00")!,
                    dateFormatter.dateFromString("2015-09-05 7:47:00")!,
                    dateFormatter.dateFromString("2015-09-05 7:48:00")!,
                    dateFormatter.dateFromString("2015-09-05 7:49:00")!,
                    dateFormatter.dateFromString("2015-09-05 7:50:00")!,
                    dateFormatter.dateFromString("2015-09-05 7:51:00")!,
                    dateFormatter.dateFromString("2015-09-05 7:52:00")!,
                    dateFormatter.dateFromString("2015-09-05 7:53:00")!,
                    dateFormatter.dateFromString("2015-09-05 7:54:00")!,
                    dateFormatter.dateFromString("2015-09-05 7:55:00")!,
                    dateFormatter.dateFromString("2015-09-05 7:56:00")!,
                    dateFormatter.dateFromString("2015-09-05 7:57:00")!,
                    dateFormatter.dateFromString("2015-09-05 7:58:00")!,
                    dateFormatter.dateFromString("2015-09-05 7:59:00")!,
                ]
                
                let minuteIn7AM_September5_2015 = dateFormatter.dateFromString("2015-09-05 7:32:12")!
                expect(TimeUnit().minutesOfHour(minuteIn7AM_September5_2015)).to(equal(minutesIn7AM_September5_2015))
            }
            
// MARK: hoursOfDay
            it ("can create the hours of March 8, 2015") {
                dateFormatter.locale = NSLocale(localeIdentifier: "en_US") // March 8th was daylight savings change in the US
                let hoursInMarch8_2015 = [
                    dateFormatter.dateFromString("2015-03-08 00:00:00")!,
                    dateFormatter.dateFromString("2015-03-08 01:00:00")!, // daylight savings change occurs at 2:00 AM in US
                    dateFormatter.dateFromString("2015-03-08 03:00:00")!, // so hour skips from 1:00 to 3:00
                    dateFormatter.dateFromString("2015-03-08 04:00:00")!,
                    dateFormatter.dateFromString("2015-03-08 05:00:00")!,
                    dateFormatter.dateFromString("2015-03-08 06:00:00")!,
                    dateFormatter.dateFromString("2015-03-08 07:00:00")!,
                    dateFormatter.dateFromString("2015-03-08 08:00:00")!,
                    dateFormatter.dateFromString("2015-03-08 09:00:00")!,
                    dateFormatter.dateFromString("2015-03-08 10:00:00")!,
                    dateFormatter.dateFromString("2015-03-08 11:00:00")!,
                    dateFormatter.dateFromString("2015-03-08 12:00:00")!,
                    dateFormatter.dateFromString("2015-03-08 13:00:00")!,
                    dateFormatter.dateFromString("2015-03-08 14:00:00")!,
                    dateFormatter.dateFromString("2015-03-08 15:00:00")!,
                    dateFormatter.dateFromString("2015-03-08 16:00:00")!,
                    dateFormatter.dateFromString("2015-03-08 17:00:00")!,
                    dateFormatter.dateFromString("2015-03-08 18:00:00")!,
                    dateFormatter.dateFromString("2015-03-08 19:00:00")!,
                    dateFormatter.dateFromString("2015-03-08 20:00:00")!,
                    dateFormatter.dateFromString("2015-03-08 21:00:00")!,
                    dateFormatter.dateFromString("2015-03-08 22:00:00")!,
                    dateFormatter.dateFromString("2015-03-08 23:00:00")!,
                ]
                
                let dateInMarch8_2015 = dateFormatter.dateFromString("2015-03-08 15:07:00")!
                expect(TimeUnit().hoursOfDay(dateInMarch8_2015)).to(equal(hoursInMarch8_2015))
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
            
            
// MARK: daysOfMonth
            it ("can create days of February 2015") {
                let daysInFebruary_2015 = [
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
                expect(TimeUnit().daysOfMonth(dateInFebruary)).to(equal(daysInFebruary_2015))
            }
            
            it ("can create days of February 2012") { // February 2012 was a leap month
                let daysInFebruary_2012 = [
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
                expect(TimeUnit().daysOfMonth(dateInFebruary)).to(equal(daysInFebruary_2012))
            }
            
            
// MARK: monthsOfYear
            it ("can create the months of 2015") {
                let monthsIn_2015 = [
                    dateFormatter.dateFromString("2015-01-01 00:00:00")!,
                    dateFormatter.dateFromString("2015-02-01 00:00:00")!,
                    dateFormatter.dateFromString("2015-03-01 00:00:00")!,
                    dateFormatter.dateFromString("2015-04-01 00:00:00")!,
                    dateFormatter.dateFromString("2015-05-01 00:00:00")!,
                    dateFormatter.dateFromString("2015-06-01 00:00:00")!,
                    dateFormatter.dateFromString("2015-07-01 00:00:00")!,
                    dateFormatter.dateFromString("2015-08-01 00:00:00")!,
                    dateFormatter.dateFromString("2015-09-01 00:00:00")!,
                    dateFormatter.dateFromString("2015-10-01 00:00:00")!,
                    dateFormatter.dateFromString("2015-11-01 00:00:00")!,
                    dateFormatter.dateFromString("2015-12-01 00:00:00")!,
                ]
                
                let dateIn_2015 = dateFormatter.dateFromString("2015-09-05 13:29:18")!
                expect(TimeUnit().monthsOfYear(dateIn_2015)).to(equal(monthsIn_2015))
            }
        }
        
        
// MARK: - Time Unit Contains Date
        describe("determining whether date falls within a given time unit") {
            var dateFormatter : NSDateFormatter!
            beforeEach {
                dateFormatter = NSDateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            }
            
// MARK: hourContainsDate
            it("returns true for first second of hour") {
                let september13_11AM_2015 = dateFormatter.dateFromString("2015-09-13 11:00:00")! // beginning of 11:00AM September 13th
                expect(TimeUnit().hourContainsDate(september13_11AM_2015, hour:september13_11AM_2015)).to(beTrue())
            }
            
            it("returns true for last second of hour") {
                let september13_11AM_2015 = dateFormatter.dateFromString("2015-09-13 11:00:00")! // beginning of 11:00AM September 13th
                let endOfSeptember13_11AM_2015 = dateFormatter.dateFromString("2015-09-13 11:59:59")!
                expect(TimeUnit().hourContainsDate(endOfSeptember13_11AM_2015, hour: september13_11AM_2015)).to(beTrue())
            }
            
            it("returns true for date in the middle of hour") {
                let september13_11AM_2015 = dateFormatter.dateFromString("2015-09-13 11:00:00")! // beginning of 11:00AM September 13th
                let middleOfSeptember13_11AM_2015 = dateFormatter.dateFromString("2015-09-13 11:30:00")!
                expect(TimeUnit().hourContainsDate(middleOfSeptember13_11AM_2015, hour: september13_11AM_2015)).to(beTrue())
            }
            
            it ("returns true when month date is not beginning of hour") {
                let september13_1130AM_2015 = dateFormatter.dateFromString("2015-09-13 11:30:00")! // 11:30AM September 13th
                let endOfSeptember13_11AM_2015 = dateFormatter.dateFromString("2015-09-13 11:59:59")!
                expect(TimeUnit().hourContainsDate(endOfSeptember13_11AM_2015, hour: september13_1130AM_2015)).to(beTrue())
            }
            
            it("returns false for date in next hour") {
                let september13_1130AM_2015 = dateFormatter.dateFromString("2015-09-13 11:30:00")! // 11:30AM September 13th
                let beginningOfSeptember13_12PM_2015 = dateFormatter.dateFromString("2015-09-13 12:00:00")!
                expect(TimeUnit().hourContainsDate(beginningOfSeptember13_12PM_2015, hour: september13_1130AM_2015)).to(beFalse())
            }
            
            it("returns false for date in previous hour") {
                let september13_1130AM_2015 = dateFormatter.dateFromString("2015-09-13 11:30:00")! // 11:30AM September 13th
                let endOfSeptember13_10AM_2015 = dateFormatter.dateFromString("2015-09-13 10:59:59")!
                expect(TimeUnit().hourContainsDate(endOfSeptember13_10AM_2015, hour: september13_1130AM_2015)).to(beFalse())
                
            }
            
// MARK: dayContainsDate
            it("returns true for first second of day") {
                let september13_2015 = dateFormatter.dateFromString("2015-09-13 00:00:00")! // beginning of September 13
                expect(TimeUnit().dayContainsDate(september13_2015, day:september13_2015)).to(beTrue())
            }
            
            it("returns true for last second of day") {
                let september13_2015 = dateFormatter.dateFromString("2015-09-13 00:00:00")! // beginning of September 13
                let endOfSeptember13_2015 = dateFormatter.dateFromString("2015-09-13 23:59:59")!
                expect(TimeUnit().dayContainsDate(endOfSeptember13_2015, day: september13_2015)).to(beTrue())
            }
            
            it("returns true for date in the middle of day") {
                let september13_2015 = dateFormatter.dateFromString("2015-09-13 00:00:00")! // beginning of September 13
                let middleOfSeptember13_2015 = dateFormatter.dateFromString("2015-09-13 12:00:00")!
                expect(TimeUnit().dayContainsDate(middleOfSeptember13_2015, day: september13_2015)).to(beTrue())
            }
            
            it ("returns true when month date is not beginning of day") {
                let september13_2015 = dateFormatter.dateFromString("2015-09-13 12:00:00")! // middle of September 13
                let endOfSeptember13_2015 = dateFormatter.dateFromString("2015-09-13 23:59:59")!
                expect(TimeUnit().dayContainsDate(endOfSeptember13_2015, day: september13_2015)).to(beTrue())
            }
            
            it("returns false for date in next day") {
                let september13_2015 = dateFormatter.dateFromString("2015-09-13 12:00:00")! // middle of September 13
                let beginningOfSeptember13_2015 = dateFormatter.dateFromString("2015-09-14 00:00:00")!
                expect(TimeUnit().dayContainsDate(beginningOfSeptember13_2015, day: september13_2015)).to(beFalse())
            }
            
            it("returns false for date in previous day") {
                let september13_2015 = dateFormatter.dateFromString("2015-09-13 12:00:00")! // middle of September 13
                let endOfSeptember13_2015 = dateFormatter.dateFromString("2015-09-12 23:59:59")!
                expect(TimeUnit().dayContainsDate(endOfSeptember13_2015, day: september13_2015)).to(beFalse())
                
            }
            
// MARK: monthContainsDate
            it("returns true for first second of month") {
                let september_2015 = dateFormatter.dateFromString("2015-09-01 00:00:00")! // beginning of September
                expect(TimeUnit().monthContainsDate(september_2015, month:september_2015)).to(beTrue())
            }
            
            it("returns true for last second of month") {
                let september_2015 = dateFormatter.dateFromString("2015-09-01 00:00:00")! // beginning of September
                let endOfSeptember_2015 = dateFormatter.dateFromString("2015-09-30 23:59:59")!
                expect(TimeUnit().monthContainsDate(endOfSeptember_2015, month: september_2015)).to(beTrue())
            }
            
            it("returns true for date in the middle of month") {
                let september_2015 = dateFormatter.dateFromString("2015-09-01 00:00:00")! // beginning of September
                let middleOfSeptember_2015 = dateFormatter.dateFromString("2015-09-15 00:00:00")!
                expect(TimeUnit().monthContainsDate(middleOfSeptember_2015, month: september_2015)).to(beTrue())
            }
            
            it ("returns true when month date is not beginning of month") {
                let september_2015 = dateFormatter.dateFromString("2015-09-15 00:00:00")! // middle of September
                let endOfSeptember_2015 = dateFormatter.dateFromString("2015-09-30 23:59:59")!
                expect(TimeUnit().monthContainsDate(endOfSeptember_2015, month: september_2015)).to(beTrue())
            }
            
            it("returns false for date in next month") {
                let september_2015 = dateFormatter.dateFromString("2015-09-15 00:00:00")! // middle of September
                let beginningOfOctober_2015 = dateFormatter.dateFromString("2015-10-01 00:00:00")!
                expect(TimeUnit().monthContainsDate(beginningOfOctober_2015, month: september_2015)).to(beFalse())
            }
            
            it("returns false for date in previous month") {
                let september_2015 = dateFormatter.dateFromString("2015-09-15 00:00:00")! // middle of September
                let endOfAugust_2015 = dateFormatter.dateFromString("2015-08-31 23:59:59")!
                expect(TimeUnit().monthContainsDate(endOfAugust_2015, month: september_2015)).to(beFalse())
                
            }
            
// MARK: yearContainsDate
            it("returns true for first second of year") {
                let _2015 = dateFormatter.dateFromString("2015-01-01 00:00:00")! // beginning of 2015
                expect(TimeUnit().yearContainsDate(_2015, year:_2015)).to(beTrue())
            }
            
            it("returns true for last second of year") {
                let _2015 = dateFormatter.dateFromString("2015-01-01 00:00:00")! // beginning of 2015
                let endOf2015 = dateFormatter.dateFromString("2015-12-31 23:59:59")!
                expect(TimeUnit().yearContainsDate(endOf2015, year: _2015)).to(beTrue())
            }
            
            it("returns true for date in the middle of year") {
                let _2015 = dateFormatter.dateFromString("2015-01-01 00:00:00")! // beginning of 2015
                let middleOf2015 = dateFormatter.dateFromString("2015-07-01 00:00:00")!
                expect(TimeUnit().yearContainsDate(middleOf2015, year: _2015)).to(beTrue())
            }
            
            it ("returns true when month date is not beginning of year") {
                let middle_2015 = dateFormatter.dateFromString("2015-07-01 00:00:00")! // middle of 2015
                let endOf2015 = dateFormatter.dateFromString("2015-12-31 23:59:59")!
                expect(TimeUnit().yearContainsDate(endOf2015, year: middle_2015)).to(beTrue())
            }
            
            it("returns false for date in next year") {
                let middle_2015 = dateFormatter.dateFromString("2015-07-01 00:00:00")! // middle of 2015
                let beginningOf2016 = dateFormatter.dateFromString("2016-01-01 00:00:00")!
                expect(TimeUnit().yearContainsDate(beginningOf2016, year: middle_2015)).to(beFalse())
            }
            
            it("returns false for date in previous year") {
                let middle_2015 = dateFormatter.dateFromString("2015-07-01 00:00:00")! // middle of 2015
                let endOf2014 = dateFormatter.dateFromString("2014-12-31 23:59:59")!
                expect(TimeUnit().yearContainsDate(endOf2014, year: middle_2015)).to(beFalse())
                
            }
        }
    }
}
