//
//  TunitsViewController.swift
//  Tunits
//
//  Created by Tom on 9/5/15.
//  Copyright (c) 2015 CocoaPods. All rights reserved.
//

import UIKit

class TunitsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
// MARK: - Properties
    
    @IBOutlet weak var tableView : UITableView?
    
    weak var datePicker : UIDatePicker?
    
// MARK: - Table View

    let kNumberOfSections = 4
    let kDatePickerSection = 0
    let kMonthsInYearSection = 1
    let kDaysInMonthSection = 2
    let kHoursInDaySection = 3
    let kMinutesInHourSection = 4
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
