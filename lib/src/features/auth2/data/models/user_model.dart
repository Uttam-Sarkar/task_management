import '../../domain/entites/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.name,
    required super.email,
    super.password,
    // super.role = UserRole.member,
    // required super.createdAt,
    super.lastLoginAt,
    super.isActive = true,
  });

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      // createdAt: map['createdAt'] ?? '',
    );
  }

  Map<String, dynamic> toJson(){
    return{
      'id' : id,
      'email':email,
      'name' :name,
      // 'createdAt': createdAt
    };
  }
  //
  // factory UserModel.fromJson(Map<String, dynamic> json) {
  //   return UserModel(
  //     id: json['id'] as String,
  //     name: json['name'] as String,
  //     email: json['email'] as String,
  //     password: json['password'] as String?,
  //     // role: UserRole.fromString(json['role'] as String? ?? 'member'),
  //     // createdAt: DateTime.parse(json['createdAt'] as String),
  //     lastLoginAt: json['lastLoginAt'] != null
  //         ? DateTime.parse(json['lastLoginAt'] as String)
  //         : null,
  //     isActive: json['isActive'] as bool? ?? true,
  //   );
  // }
  //
  // Map<String, dynamic> toJson() {
  //   return {
  //     'id': id,
  //     'name': name,
  //     'email': email,
  //     if (password != null) 'password': password,
  //     // 'role': role.value,
  //     // 'createdAt': createdAt.toIso8601String(),
  //     if (lastLoginAt != null) 'lastLoginAt': lastLoginAt!.toIso8601String(),
  //     'isActive': isActive,
  //   };
  // }
  //
  // factory UserModel.fromEntity(UserEntity user) {
  //   return UserModel(
  //     id: user.id,
  //     name: user.name,
  //     email: user.email,
  //     password: user.password,
  //     // role: user.role,
  //     // createdAt: user.createdAt,
  //     lastLoginAt: user.lastLoginAt,
  //     isActive: user.isActive,
  //   );
  // }
}
