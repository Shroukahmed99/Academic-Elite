class UserEntity {
  final String id;
  final String fullName;
  final String email;
  final String phone;
  final String? token;

  const UserEntity({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phone,
    this.token,
  });
}