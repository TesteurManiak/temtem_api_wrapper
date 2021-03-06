# temtem_api_wrapper

[![Issues](https://img.shields.io/github/issues/TesteurManiak/temtem_api_wrapper)](https://github.com/TesteurManiak/temtem_api_wrapper/issues)
[![Forks](https://img.shields.io/github/forks/TesteurManiak/temtem_api_wrapper)](https://github.com/TesteurManiak/temtem_api_wrapper/network/members)
[![Stars](https://img.shields.io/github/stars/TesteurManiak/temtem_api_wrapper)](https://github.com/TesteurManiak/temtem_api_wrapper/stargazers)
[![Pub Version](https://img.shields.io/pub/v/temtem_api_wrapper?color=blue&logo=dart)](https://pub.dev/packages/temtem_api_wrapper)
[![License](https://img.shields.io/github/license/TesteurManiak/temtem_api_wrapper)]()

Wrapper for the [unofficial Temtem API](https://temtem-api.mael.tech/).

## How to use

Simply instantiate the API class and call the methods you need.

The package currently supports:
* `getTemTem(int number, {List<String> fields, List<String> expand})`
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

* [http](https://pub.dev/packages/http) : Used to make HTTP requests

## TODO

* Add comments
* Add unit tests
* Expand example cases
