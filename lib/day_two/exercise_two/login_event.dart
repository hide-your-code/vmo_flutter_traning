abstract class LoginEvent {
  const LoginEvent();
}

class LoginFillPassword extends LoginEvent {
  const LoginFillPassword(this.password);
  final String password;
}

class LoginShowHidePassword extends LoginEvent {
  const LoginShowHidePassword();
}
