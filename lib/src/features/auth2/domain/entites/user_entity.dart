
class UserEntity{
  final String id;
  final String name;
  final String email;
  final String? password; // Optional for security reasons
  // final UserRole role;
  // final DateTime createdAt;
  final DateTime? lastLoginAt;
  final bool isActive;

  const UserEntity({
    required this.id,
    required this.name,
    required this.email,
    this.password,
    // this.role = UserRole.member,
    // required this.createdAt,
    this.lastLoginAt,
    this.isActive = true,
  });





  /////
  UserEntity copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
    // UserRole? role,
    DateTime? createdAt,
    DateTime? lastLoginAt,
    bool? isActive,
  }) {
    return UserEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      // role: role ?? this.role,
      // createdAt: createdAt ?? this.createdAt,
      lastLoginAt: lastLoginAt ?? this.lastLoginAt,
      isActive: isActive ?? this.isActive,
    );
  }
}