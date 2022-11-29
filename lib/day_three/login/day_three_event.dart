abstract class DayThreeEvent {
  const DayThreeEvent();
}

class LoginEvent extends DayThreeEvent {
  const LoginEvent();
}

class FillPassword extends DayThreeEvent {
  final String password;

  const FillPassword({required this.password});
}

class FillUsername extends DayThreeEvent {
  final String username;

  const FillUsername({required this.username});
}

class ChangeInformation extends DayThreeEvent {
  const ChangeInformation();
}
