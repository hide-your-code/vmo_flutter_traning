import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String username;
  final String password;
  final String imageUrl;
  final String gender;
  final String email;
  final String name;
  final String birthday;
  final String phoneNumber;
  final String address;

  const User(
    this.username,
    this.password,
    this.imageUrl,
    this.gender,
    this.email,
    this.name,
    this.birthday,
    this.phoneNumber,
    this.address,
  );

  const User.init({
    this.username = '',
    this.password = '',
    this.imageUrl = '',
    this.gender = '',
    this.email = '',
    this.name = '',
    this.birthday = '',
    this.phoneNumber = '',
    this.address = '',
  });

  @override
  List<Object?> get props => [
        username,
        password,
        imageUrl,
        gender,
        email,
        name,
        birthday,
        phoneNumber,
        address,
      ];
}
