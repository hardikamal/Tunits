# Tunits

[![CI Status](http://img.shields.io/travis/Thomas Leu/Tunits.svg?style=flat)](https://travis-ci.org/Thomas Leu/Tunits)
[![Version](https://img.shields.io/cocoapods/v/Tunits.svg?style=flat)](http://cocoapods.org/pods/Tunits)
[![License](https://img.shields.io/cocoapods/l/Tunits.svg?style=flat)](http://cocoapods.org/pods/Tunits)
[![Platform](https://img.shields.io/cocoapods/p/Tunits.svg?style=flat)](http://cocoapods.org/pods/Tunits)

## Usage

### Example Project ###

To run the example project, clone the repo, and run `pod install` from the Example directory first.

### Swift ###
`TimeUnit` methods can be used statically or by creating instances.
The `NSCalendar.currentCalendar()` is used by default. `TimeUnit`
instances expose their calendar property so a custom calendar can be
set.
```swift
// Static
let daysOfCurrentMonth = TimeUnit.daysOfMonth(NSDate()) // create array of days

// Instance
let tunit = TimeUnit() // init new TimeUnit object
let daysOfCurrentMonth = tunit.daysOfMonth(NSDate()) // create array of days

// Custom Calendar
let calendar = NSCalendar.currentCalendar()
calendar.firstWeekday = 2 // set first weekday to Monday
let tunit = TimeUnit()
tunit.calendar = calendar
let daysOfCurrentWeek = tunit.daysOfWeek(NSDate())
```

In addition to using `TimeUnit` methods directly, `NSDate` objects have
been extended to use the `TimeUnit` methods that return dates. This
means methods can be chained together for complex date selection.
```swift
// Method chaining
let endOfNextYear = NSDate().yearAfter().endOfYear()
```
## Requirements

Requires XCode 6 and iOS 7+ sdk.

## Installation

Tunits is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "Tunits"
```

## Author

Thomas Leu, tomleu@gmail.com

## License

Tunits is available under the MIT license. See the LICENSE file for more info.
