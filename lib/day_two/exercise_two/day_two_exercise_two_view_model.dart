import 'package:day_2/day_two/exercise_two/login_event.dart';
import 'package:day_2/day_two/exercise_two/login_state.dart';
import 'package:bloc/bloc.dart';

class DayTwoExerciseTwoBloc extends Bloc<LoginEvent, LoginState> {
  DayTwoExerciseTwoBloc() : super(const LoginState.unknow()) {
    on<LoginFillPassword>(_checkEmptyPassword);
    on<LoginShowHidePassword>(_showHidePassword);
  }

  Future<void> _checkEmptyPassword(
      LoginFillPassword event, Emitter<LoginState> emit) async {
    final isEmptyPassword = event.password.isEmpty;

    return emit(LoginState.enableSignIn(!isEmptyPassword, state.isShowPassword));
  }

  Future<void> _showHidePassword(
      LoginShowHidePassword event, Emitter<LoginState> emit) async {
    return emit(LoginState.showPassword(!state.isShowPassword, state.isEnableSignInButton));
  }
}
