import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  final bool isEnableSignInButton;
  final bool isShowPassword;

  const LoginState._({
    this.isEnableSignInButton = false,
    this.isShowPassword = false,
  });

  const LoginState.unknow() : this._();

  const LoginState.enableSignIn(bool isEnableSignInButton, bool isShowPassword)
      : this._(
          isEnableSignInButton: isEnableSignInButton,
          isShowPassword: isShowPassword,
        );

  const LoginState.showPassword(bool isShowPassword, bool isEnableSignInButton)
      : this._(
          isShowPassword: isShowPassword,
          isEnableSignInButton: isEnableSignInButton,
        );

  @override
  List<Object> get props => [isEnableSignInButton, isShowPassword];
}
