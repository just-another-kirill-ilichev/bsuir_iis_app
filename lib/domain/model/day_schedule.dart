import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:bsuir_iis_app/domain/model/lesson.dart';

class DaySchedule {
  final String weekDay;
  final List<Lesson> schedule;

  DaySchedule({
    required this.weekDay,
    required this.schedule,
  });

  DaySchedule copyWith({
    String? weekDay,
    List<Lesson>? schedule,
  }) {
    return DaySchedule(
      weekDay: weekDay ?? this.weekDay,
      schedule: schedule ?? this.schedule,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'weekDay': weekDay,
      'schedule': schedule.map((x) => x.toMap()).toList(),
    };
  }

  factory DaySchedule.fromMap(Map<String, dynamic> map) {
    return DaySchedule(
      weekDay: map['weekDay'],
      schedule:
          List<Lesson>.from(map['schedule']?.map((x) => Lesson.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory DaySchedule.fromJson(String source) =>
      DaySchedule.fromMap(json.decode(source));

  @override
  String toString() => 'DaySchedule(weekDay: $weekDay, schedule: $schedule)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DaySchedule &&
        other.weekDay == weekDay &&
        listEquals(other.schedule, schedule);
  }

  @override
  int get hashCode => weekDay.hashCode ^ schedule.hashCode;
}
