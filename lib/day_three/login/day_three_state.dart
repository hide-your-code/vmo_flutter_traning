import 'package:day_2/day_three/models/user.dart';
import 'package:equatable/equatable.dart';

class DayThreeState extends Equatable {
  final User user;
  final String username;
  final String password;

  const DayThreeState._({
    this.user = const User.init(),
    this.username = '',
    this.password = '',
  });

  const DayThreeState.unknown() : this._();

  const DayThreeState.getUser(User user) : this._(user: user);

  @override
  List<Object?> get props => [
        user,
        username,
        password,
      ];
}
