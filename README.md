# temtem_api_wrapper

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
