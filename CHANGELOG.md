# 1.0.0

* Added unit tests
* Added `TemTemApiDojo` model
* Added `TemTemApiPatch.balance` property

## Breaking Changes

* Removed dependency to `flutter`
* Bumped Dart SDK minimum version to `2.15`
* Migration to null-safety
* `TemTemApiRewards.startDate` & `TemTemApiRewards.endDate` are now `DateTime`
* Removed `TemTemApiPatch.pathInfo`, replaced it with `TemTemTemApiPatch.fixes`, `TemTemApiPatch.improvements` & `TemTemApiPatch.features` properties
* `TemTemApiPatch.date` is now `DateTime`

# 0.1.1+3

* Code format to dartfmt

# 0.1.1+2

* Made `TemLocation`, `Technique` and `EvolutionNode` class public

# 0.1.1+1

* Made `Location`, `Place` and `SynergyEffect` class public

# 0.1.1

* Updated `temtem_api_location.dart`
* Added example for locations

# 0.1.0+1

* Added comments to `temtem_api.dart`
* Updated description in `pubspec.yaml`
* Fixed some code formatting

# 0.1.0

* Initial Development release.
