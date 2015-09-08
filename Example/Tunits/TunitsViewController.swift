//
//  TunitsViewController.swift
//  Tunits
//
//  Created by Tom on 9/5/15.
//  Copyright (c) 2015 CocoaPods. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//

import UIKit
import Tunits

class TunitsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
// MARK: - Properties and Lifecycle
    
    @IBOutlet weak var tableView : UITableView?
    weak var datePicker : UIDatePicker?
    
    lazy var dateFormatter : NSDateFormatter = {
        var tempFormatter = NSDateFormatter()
        tempFormatter.dateFormat = NSDateFormatter.dateFormatFromTemplate("MMMM dd, yyyy j:mm", options: 0, locale: NSLocale.autoupdatingCurrentLocale())
        return tempFormatter
    }()
    
    var timeUnits : [[NSDate]]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView!.delegate = self
        self.tableView!.dataSource = self
        self.tableView!.setTranslatesAutoresizingMaskIntoConstraints(false)
    }
    
// MARK: - UI Events
    
    func dateChanged(sender:UIDatePicker) {
        let tunits = TimeUnit()
        
        self.timeUnits = [
            tunits.monthsOfYear(sender.date),
            tunits.daysOfMonth(sender.date),
            tunits.hoursOfDay(sender.date),
            tunits.minutesOfHour(sender.date),
        ]
        
        self.tableView!.reloadData()
    }
    
// MARK: - Table View

    let kNumberOfSections =         5
    let kDatePickerSection =        0
    let kMonthsOfYearSection =      1
    let kDaysOfMonthSection =       2
    let kHoursOfDaySection =        3
    let kMinutesOfHourSection =     4
    
    let kDatePickerCellHeight : CGFloat = 216.0
    let kTimeUnitCellHeight : CGFloat = 44.0
    
    let kDatePickerCellIdentifier = "datePickerCell"
    let kTimeUnitCellIdentifier =   "timeUnitCell"
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return kNumberOfSections
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == kDatePickerSection {
            return kDatePickerCellHeight
        } else {
            return kTimeUnitCellHeight
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == kDatePickerSection {
            return 1
        } else {
            if let timeUnits = self.timeUnits {
                return timeUnits[section - 1].count
            } else {
                return 0
            }
        }
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
            case kMonthsOfYearSection:
                return "Months Of Year"
            case kDaysOfMonthSection:
                return "Days Of Month"
            case kHoursOfDaySection:
                return "Hours Of Day"
            case kMinutesOfHourSection:
                return "Minutes Of Hour"
            default:
                return nil
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == kDatePickerSection {
            return self.datePickerCell()
        } else {
            return self.timeUnitCell(indexPath)
        }
    }
    
    private func datePickerCell() -> UITableViewCell {
        let datePickerCell : TunitsDatePickerCell = self.tableView!.dequeueReusableCellWithIdentifier(kDatePickerCellIdentifier) as! TunitsDatePickerCell
        
        if self.datePicker == nil {
            self.datePicker = datePickerCell.datePicker!
            self.datePicker!.addTarget(self, action: "dateChanged:", forControlEvents: .ValueChanged)
            self.datePicker!.date = NSDate()
        }
        
        return datePickerCell
    }
    
    private func timeUnitCell(indexPath:NSIndexPath) -> UITableViewCell {
        let timeUnitCell = self.tableView!.dequeueReusableCellWithIdentifier(kTimeUnitCellIdentifier) as! UITableViewCell
        
        timeUnitCell.textLabel!.text = self.titleForTimeUnitCell(indexPath)
        
        return timeUnitCell
    }
    
    private func titleForTimeUnitCell(indexPath:NSIndexPath) -> String {
        if let timeUnits = self.timeUnits {
            return self.dateFormatter.stringFromDate(timeUnits[indexPath.section - 1][indexPath.row])
        } else {
            return ""
        }
    }
}
