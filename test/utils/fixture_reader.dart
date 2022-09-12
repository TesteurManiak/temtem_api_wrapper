import 'dart:io' show File;

String fixture(String name) => File('test/assets/$name').readAsStringSync();

Future<String> fixtureAsync(String name) =>
    File('test/assets/$name').readAsString();
