class UserModel {
  final String email;
  final String password;
  final String? name;
  final String? headline;
  final String? location;
  final String? languages;
  final String? work;
  final int? connection;
  final int? followers;
  UserModel({
    required this.email,
    required this.password,
    this.name,
    this.headline,
    this.location,
    this.languages,
    this.work,
    this.connection,
    this.followers

  });
}