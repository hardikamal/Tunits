# Change Log
All notable changes to this project will be documented in this file
`Tunits` adheres to [Semantic Versioning](http://semver.org/).

## [0.9.0](https://github.com/spitzgoby/Tunits/releases/tag/0.9.0)
### Adds
+ Subunits creation and date traversal methods to date arrays

## [0.8.1](https://github.com/spitzgoby/Tunits/releases/tag/0.8.1) (12-31-2015)
### Adds
+ Multiple date traversal to date extensions, e.g. `date.hoursBefore(2)`

## [0.8.0](https://github.com/spitzgoby/Tunits/releases/tag/0.8.0) (12-28-2015)
### Adds
+ Instance and static plural methods for traversing across dates, e.g. 
  `TimeUnit.hoursBefore(date, 2)` 

## [0.7.0](https://github.com/spitzgoby/Tunits/releases/tag/0.7.0) (12-27-2015)
### Adds
+ TimeUnit now exposes `timeUnits(timeUnit:startDate:endDate:)` for arbitrary 
  date array creation
+ TimeUnit now exposes `dateIsBetween(date:startDate:endDate:)`

## [0.6.3](https://github.com/spitzgoby/Tunits/releases/tag/0.6.3) (12-27-2015)
+ Adds TimeUnit methods for calculating subunits to `NSDate` objects
+ Fixes bug that would incorrectly calculate beginning of week when calendar's
  first weekday was not Sunday
+ More extensive testing added
+ Removed Quick and Nimble testing frameworks for XCode and swift compatibility 
  reasons. [See related issue](https://github.com/CocoaPods/CocoaPods/issues/4056)


## [0.6.2](https://github.com/spitzgoby/Tunits/releases/tag/0.6.2) (10-19-2015)
Removes erroneous import statement from DateExtensions 
