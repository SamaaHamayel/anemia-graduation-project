abstract class SignInState {}

class SignInInitial extends SignInState {}
final class SignInLoadingState extends SignInState {}
final class SignInErrorState extends SignInState {
  final String message;

  SignInErrorState(this.message);
}
final class SignInSuccessState extends SignInState {}
final class ChangeLoginPasswordSuffixIcon extends SignInState {}