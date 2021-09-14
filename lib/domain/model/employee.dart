import 'dart:convert';

import 'package:flutter/foundation.dart';

class Employee {
  final int id;
  final String firstName;
  final String lastName;
  final String middleName;
  final String fio;
  final String? rank;
  final String photoLink;
  final String calendarId;
  final List<String> academicDepartment;

  Employee({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.middleName,
    required this.fio,
    required this.rank,
    required this.photoLink,
    required this.calendarId,
    required this.academicDepartment,
  });

  Employee copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? middleName,
    String? fio,
    String? rank,
    String? photoLink,
    String? calendarId,
    List<String>? academicDepartment,
  }) {
    return Employee(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      middleName: middleName ?? this.middleName,
      fio: fio ?? this.fio,
      rank: rank ?? this.rank,
      photoLink: photoLink ?? this.photoLink,
      calendarId: calendarId ?? this.calendarId,
      academicDepartment: academicDepartment ?? this.academicDepartment,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'middleName': middleName,
      'fio': fio,
      'rank': rank,
      'photoLink': photoLink,
      'calendarId': calendarId,
      'academicDepartment': academicDepartment,
    };
  }

  factory Employee.fromMap(Map<String, dynamic> map) {
    return Employee(
      id: map['id'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      middleName: map['middleName'],
      fio: map['fio'],
      rank: map['rank'],
      photoLink: map['photoLink'],
      calendarId: map['calendarId'],
      academicDepartment: List<String>.from(map['academicDepartment']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Employee.fromJson(String source) =>
      Employee.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Employee(id: $id, firstName: $firstName, lastName: $lastName, middleName: $middleName, fio: $fio, rank: $rank, photoLink: $photoLink, calendarId: $calendarId, academicDepartment: $academicDepartment)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Employee &&
        other.id == id &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.middleName == middleName &&
        other.fio == fio &&
        other.rank == rank &&
        other.photoLink == photoLink &&
        other.calendarId == calendarId &&
        listEquals(other.academicDepartment, academicDepartment);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        middleName.hashCode ^
        fio.hashCode ^
        rank.hashCode ^
        photoLink.hashCode ^
        calendarId.hashCode ^
        academicDepartment.hashCode;
  }
}
