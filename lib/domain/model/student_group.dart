import 'dart:convert';

class StudentGroup {
  final int id;
  final String name;
  final int facultyId;
  final int specialityDepartmentEducationFormId;
  final int course;
  final String calendarId;
  StudentGroup({
    required this.id,
    required this.name,
    required this.facultyId,
    required this.specialityDepartmentEducationFormId,
    required this.course,
    required this.calendarId,
  });

  StudentGroup copyWith({
    int? id,
    String? name,
    int? facultyId,
    int? specialityDepartmentEducationFormId,
    int? course,
    String? calendarId,
  }) {
    return StudentGroup(
      id: id ?? this.id,
      name: name ?? this.name,
      facultyId: facultyId ?? this.facultyId,
      specialityDepartmentEducationFormId:
          specialityDepartmentEducationFormId ??
              this.specialityDepartmentEducationFormId,
      course: course ?? this.course,
      calendarId: calendarId ?? this.calendarId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'facultyId': facultyId,
      'specialityDepartmentEducationFormId':
          specialityDepartmentEducationFormId,
      'course': course,
      'calendarId': calendarId,
    };
  }

  factory StudentGroup.fromMap(Map<String, dynamic> map) {
    return StudentGroup(
      id: map['id'],
      name: map['name'],
      facultyId: map['facultyId'],
      specialityDepartmentEducationFormId:
          map['specialityDepartmentEducationFormId'],
      course: map['course'],
      calendarId: map['calendarId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentGroup.fromJson(String source) =>
      StudentGroup.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SrudentGroup(id: $id, name: $name, facultyId: $facultyId, specialityDepartmentEducationFormId: $specialityDepartmentEducationFormId, course: $course, calendarId: $calendarId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is StudentGroup &&
        other.id == id &&
        other.name == name &&
        other.facultyId == facultyId &&
        other.specialityDepartmentEducationFormId ==
            specialityDepartmentEducationFormId &&
        other.course == course &&
        other.calendarId == calendarId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        facultyId.hashCode ^
        specialityDepartmentEducationFormId.hashCode ^
        course.hashCode ^
        calendarId.hashCode;
  }
}
