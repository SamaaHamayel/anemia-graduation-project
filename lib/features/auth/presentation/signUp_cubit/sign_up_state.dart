abstract class SignUpState {}

class SignUpInitial extends SignUpState {}


final class SignUpLoadingState extends SignUpState {}
final class SignUpErrorState extends SignUpState {
  final String message;

  SignUpErrorState(this.message);
}
final class SignUpSuccessState extends SignUpState {}
final class ChangeSignUpPasswordSuffixIcon extends SignUpState {}