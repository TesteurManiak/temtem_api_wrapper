import 'dart:convert';

import 'package:temtem_api_wrapper/src/model/temtem_api_training_course.dart';
import 'package:test/test.dart';

import '../utils/fixture_reader.dart';

void main() {
  group('TemTemApiTrainingCourse', () {
    group('fromJson', () {
      test('parse training_courses.json', () {
        final json = (jsonDecode(fixture('training_courses.json')) as Iterable)
            .cast<Map<String, dynamic>>();
        final courses = json.map(TemTemApiTrainingCourse.fromJson);
        expect(courses.length, 2);
      });
    });
  });
}
