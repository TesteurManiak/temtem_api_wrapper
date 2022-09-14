# temtem_api_wrapper

[![Test workflow](https://github.com/TesteurManiak/temtem_api_wrapper/actions/workflows/dart.yml/badge.svg)](https://github.com/TesteurManiak/temtem_api_wrapper/actions/workflows/dart.yml)
[![Issues](https://img.shields.io/github/issues/TesteurManiak/temtem_api_wrapper)](https://github.com/TesteurManiak/temtem_api_wrapper/issues)
[![Pub Version](https://img.shields.io/pub/v/temtem_api_wrapper?color=blue&logo=dart)](https://pub.dev/packages/temtem_api_wrapper)
[![License](https://img.shields.io/github/license/TesteurManiak/temtem_api_wrapper)]()

Wrapper for the [unofficial Temtem API](https://temtem-api.mael.tech/).

## How to use

Simply instantiate the API class and call the methods you need.

The package currently supports:

* `getTemTems({List<String> names, List<ExpandableField> expand, bool weaknesses})`
* `getTemtem(String name, int level)`
* `getFreeTem()`
* `getFreeTemRewards()`
* `getTypes()`
* `getConditions()`
* `getTechniques({List<String> names, List<String> fields})`
* `getTrainingCourses()`
* `getTraits({List<String> names, List<String> fields})`
* `getItems()`
* `getGears()`
* `getQuests()`
* `getCharacters()`
* `getSaiparks()`
* `getLocations()`
* `getCosmetics()`
* `getDyes()`
* `getPatches()`
* `getWeaknesses()`
* `calculateWeakness(String attacking, List<String> defending)`
* `getBreeding()`

```dart
import 'package:temtem_api_wrapper/temtem_api_wrapper.dart';

final temtemApi = TemTemApi();

final List<TemTemApiTem> temtemsList = await temtemApi.getTemtems();
final TemTemApiFreeTem freetemRewards = await temtemApi.getFreeTem();

// etc...
```

## Dependencies

* [dio](https://pub.dev/packages/dio) : Used to make HTTP requests
* [collection](https://pub.dev/packages/collection) : Used to manage lists and maps equality

## TODO

* Improve documentation
* Expand example cases
