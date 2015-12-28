# Change Log
All notable changes to this project will be documented in this file
`Tunits` adheres to [Semantic Versioning](http://semver.org/).

## [0.7.0](https://github.com/spitzgoby/Tunits/releases/tag/0.7.0) (12-27-2015)
### Adds
+ TimeUnit now exposes `timeUnits(timeUnit:startDate:endDate:)` for arbitray 
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
