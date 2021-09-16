import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'employee.dart';

class Lesson {
  final List<int> weekNumber;
  final List<String> studentGroup;
  final int numSubgroup;
  final List<String> auditory;
  final String lessonTime;

  final String startLessonTime;
  final String endLessonTime;
  final String subject;
  final String? note;
  final String lessonType;
  final List<Employee> employee;
  final bool zaoch;

  Lesson({
    required this.weekNumber,
    required this.studentGroup,
    required this.numSubgroup,
    required this.auditory,
    required this.lessonTime,
    required this.startLessonTime,
    required this.endLessonTime,
    required this.subject,
    this.note,
    required this.lessonType,
    required this.employee,
    required this.zaoch,
  });

  Lesson copyWith({
    List<int>? weekNumber,
    List<String>? studentGroup,
    int? numSubgroup,
    List<String>? auditory,
    String? lessonTime,
    String? startLessonTime,
    String? endLessonTime,
    String? subject,
    String? note,
    String? lessonType,
    List<Employee>? employee,
    bool? zaoch,
  }) {
    return Lesson(
      weekNumber: weekNumber ?? this.weekNumber,
      studentGroup: studentGroup ?? this.studentGroup,
      numSubgroup: numSubgroup ?? this.numSubgroup,
      auditory: auditory ?? this.auditory,
      lessonTime: lessonTime ?? this.lessonTime,
      startLessonTime: startLessonTime ?? this.startLessonTime,
      endLessonTime: endLessonTime ?? this.endLessonTime,
      subject: subject ?? this.subject,
      note: note ?? this.note,
      lessonType: lessonType ?? this.lessonType,
      employee: employee ?? this.employee,
      zaoch: zaoch ?? this.zaoch,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'weekNumber': weekNumber,
      'studentGroup': studentGroup,
      'numSubgroup': numSubgroup,
      'auditory': auditory,
      'lessonTime': lessonTime,
      'startLessonTime': startLessonTime,
      'endLessonTime': endLessonTime,
      'subject': subject,
      'note': note,
      'lessonType': lessonType,
      'employee': employee.map((x) => x.toMap()).toList(),
      'zaoch': zaoch,
    };
  }

  factory Lesson.fromMap(Map<String, dynamic> map) {
    return Lesson(
      weekNumber: List<int>.from(map['weekNumber']),
      studentGroup: List<String>.from(map['studentGroup']),
      numSubgroup: map['numSubgroup'],
      auditory: List<String>.from(map['auditory']),
      lessonTime: map['lessonTime'],
      startLessonTime: map['startLessonTime'],
      endLessonTime: map['endLessonTime'],
      subject: map['subject'],
      note: map['note'],
      lessonType: map['lessonType'],
      employee:
          List<Employee>.from(map['employee']?.map((x) => Employee.fromMap(x))),
      zaoch: map['zaoch'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Lesson.fromJson(String source) => Lesson.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ScheduleItem(weekNumber: $weekNumber, studentGroup: $studentGroup, numSubgroup: $numSubgroup, auditory: $auditory, lessonTime: $lessonTime, startLessonTime: $startLessonTime, endLessonTime: $endLessonTime, subject: $subject, note: $note, lessonType: $lessonType, employee: $employee, zaoch: $zaoch)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Lesson &&
        listEquals(other.weekNumber, weekNumber) &&
        listEquals(other.studentGroup, studentGroup) &&
        other.numSubgroup == numSubgroup &&
        listEquals(other.auditory, auditory) &&
        other.lessonTime == lessonTime &&
        other.startLessonTime == startLessonTime &&
        other.endLessonTime == endLessonTime &&
        other.subject == subject &&
        other.note == note &&
        other.lessonType == lessonType &&
        listEquals(other.employee, employee) &&
        other.zaoch == zaoch;
  }

  @override
  int get hashCode {
    return weekNumber.hashCode ^
        studentGroup.hashCode ^
        numSubgroup.hashCode ^
        auditory.hashCode ^
        lessonTime.hashCode ^
        startLessonTime.hashCode ^
        endLessonTime.hashCode ^
        subject.hashCode ^
        note.hashCode ^
        lessonType.hashCode ^
        employee.hashCode ^
        zaoch.hashCode;
  }
}
