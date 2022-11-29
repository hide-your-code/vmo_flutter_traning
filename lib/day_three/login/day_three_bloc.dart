import 'package:day_2/day_three/login/day_three_event.dart';
import 'package:day_2/day_three/login/day_three_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/user.dart';

class DayThreeBloc extends Bloc<DayThreeEvent, DayThreeState> {
  DayThreeBloc() : super(const DayThreeState.unknown()) {
    on<FillPassword>(_fillPassword);
    on<FillUsername>(_fillUsername);
    on<LoginEvent>(_login);
  }

  Future<void> _fillPassword(
      FillPassword event, Emitter<DayThreeState> emitter) async {
    var password = event.password;
    
    final user = User.init(
      username: state.user.username,
      password: password,
    );
    return emitter(DayThreeState.getUser(user));
  }

  Future<void> _fillUsername(
      FillUsername event, Emitter<DayThreeState> emitter) async {
    var username = event.username;

    final user = User.init(
      username: username,
      password: state.user.password,
    );
    return emitter(DayThreeState.getUser(user));
  }

  Future<void> _login(LoginEvent event, Emitter<DayThreeState> emitter) async {
    return emitter.call(state);
  }
}
