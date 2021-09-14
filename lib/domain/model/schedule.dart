import 'dart:convert';

import 'package:bsuir_iis_app/domain/model/schedule_item.dart';

import 'package:bsuir_iis_app/domain/model/day_schedule.dart';
import 'package:bsuir_iis_app/domain/model/employee.dart';
import 'package:bsuir_iis_app/domain/model/student_group.dart';
import 'package:flutter/foundation.dart';

class Schedule {
  final Employee? employee;
  final StudentGroup? studentGroup;
  final List<DaySchedule> schedules;
  final List<DaySchedule> examSchedules;
  final String todayDate;
  final List<ScheduleItem> todaySchedules;
  final String tomorrowDate;
  final List<ScheduleItem> tomorrowSchedules;
  final int currentWeekNumber;

  Schedule({
    this.employee,
    this.studentGroup,
    required this.schedules,
    required this.examSchedules,
    required this.todayDate,
    required this.todaySchedules,
    required this.tomorrowDate,
    required this.tomorrowSchedules,
    required this.currentWeekNumber,
  });

  Schedule copyWith({
    Employee? employee,
    StudentGroup? studentGroup,
    List<DaySchedule>? schedules,
    List<DaySchedule>? examSchedules,
    String? todayDate,
    List<ScheduleItem>? todaySchedules,
    String? tomorrowDate,
    List<ScheduleItem>? tomorrowSchedules,
    int? currentWeekNumber,
  }) {
    return Schedule(
      employee: employee ?? this.employee,
      studentGroup: studentGroup ?? this.studentGroup,
      schedules: schedules ?? this.schedules,
      examSchedules: examSchedules ?? this.examSchedules,
      todayDate: todayDate ?? this.todayDate,
      todaySchedules: todaySchedules ?? this.todaySchedules,
      tomorrowDate: tomorrowDate ?? this.tomorrowDate,
      tomorrowSchedules: tomorrowSchedules ?? this.tomorrowSchedules,
      currentWeekNumber: currentWeekNumber ?? this.currentWeekNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'employee': employee?.toMap(),
      'studentGroup': studentGroup?.toMap(),
      'schedules': schedules.map((x) => x.toMap()).toList(),
      'examSchedules': examSchedules.map((x) => x.toMap()).toList(),
      'todayDate': todayDate,
      'todaySchedules': todaySchedules.map((x) => x.toMap()).toList(),
      'tomorrowDate': tomorrowDate,
      'tomorrowSchedules': tomorrowSchedules.map((x) => x.toMap()).toList(),
      'currentWeekNumber': currentWeekNumber,
    };
  }

  factory Schedule.fromMap(Map<String, dynamic> map) {
    return Schedule(
      employee:
          map['employee'] == null ? null : Employee.fromMap(map['employee']),
      studentGroup: map['studentGroup'] == null
          ? null
          : StudentGroup.fromMap(map['studentGroup']),
      schedules: List<DaySchedule>.from(
          map['schedules']?.map((x) => DaySchedule.fromMap(x))),
      examSchedules: List<DaySchedule>.from(
          map['examSchedules']?.map((x) => DaySchedule.fromMap(x))),
      todayDate: map['todayDate'],
      todaySchedules: List<ScheduleItem>.from(
          map['todaySchedules']?.map((x) => ScheduleItem.fromMap(x))),
      tomorrowDate: map['tomorrowDate'],
      tomorrowSchedules: List<ScheduleItem>.from(
          map['tomorrowSchedules']?.map((x) => ScheduleItem.fromMap(x))),
      currentWeekNumber: map['currentWeekNumber'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Schedule.fromJson(String source) =>
      Schedule.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Schedule(employee: $employee, studentGroup: $studentGroup, schedules: $schedules, examSchedules: $examSchedules, todayDate: $todayDate, todaySchedules: $todaySchedules, tomorrowDate: $tomorrowDate, tomorrowSchedules: $tomorrowSchedules, currentWeekNumber: $currentWeekNumber)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Schedule &&
        other.employee == employee &&
        other.studentGroup == studentGroup &&
        listEquals(other.schedules, schedules) &&
        listEquals(other.examSchedules, examSchedules) &&
        other.todayDate == todayDate &&
        listEquals(other.todaySchedules, todaySchedules) &&
        other.tomorrowDate == tomorrowDate &&
        listEquals(other.tomorrowSchedules, tomorrowSchedules) &&
        other.currentWeekNumber == currentWeekNumber;
  }

  @override
  int get hashCode {
    return employee.hashCode ^
        studentGroup.hashCode ^
        schedules.hashCode ^
        examSchedules.hashCode ^
        todayDate.hashCode ^
        todaySchedules.hashCode ^
        tomorrowDate.hashCode ^
        tomorrowSchedules.hashCode ^
        currentWeekNumber.hashCode;
  }
}
