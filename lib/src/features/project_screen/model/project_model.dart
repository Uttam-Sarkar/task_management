import 'package:hive/hive.dart';

part 'project_model.g.dart'; // This must match the filename exactly

@HiveType(typeId: 0)
class Project extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String description;

  @HiveField(3)
  DateTime endDate;

  Project({
    required this.id,
    required this.name,
    required this.description,
    required this.endDate,
  });

  // Firebase serialization
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'endDate': endDate.toIso8601String(),
    };
  }

  factory Project.fromMap(Map<String, dynamic> map) {
    return Project(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      endDate: DateTime.parse(map['endDate']),
    );
  }
}
