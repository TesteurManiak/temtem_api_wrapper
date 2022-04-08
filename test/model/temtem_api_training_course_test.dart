import 'dart:convert';

import 'package:temtem_api_wrapper/src/model/temtem_api_training_course.dart';
import 'package:test/test.dart';

import '../utils/fixture_reader.dart';

void main() {
  group('TemTemApiTrainingCourse', () {
    final tJson = (jsonDecode(fixture('training_courses.json')) as Iterable)
        .cast<Map<String, dynamic>>();

    group('fromJson', () {
      test('parse training_courses.json', () {
        final courses = tJson.map(TemTemApiTrainingCourse.fromJson);
        expect(courses.length, 2);

        final course = courses.first;
        expect(course.number, 'TC001');
        expect(course.technique, 'Tsunami');
        expect(course.type, 'Water');
        expect(
          course.location,
          'Complete Gone with the Sillaro. Requires the Surfboard.',
        );
        expect(course.locationType, 'quest');
      });
    });
  });
}
