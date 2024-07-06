abstract class SignInEvent {}

class SignInTextChangdEvent extends SignInEvent {
  final String emailValue;
  final String passwordValue;
  SignInTextChangdEvent(this.emailValue, this.passwordValue);
}

class SignInSubmittedEvent extends SignInEvent {
  final String email;
  final String password;
  SignInSubmittedEvent(this.email, this.password);
}
