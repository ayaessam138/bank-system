part of 'signup_cubit.dart';

@immutable
abstract class SignupState {}

class SignupInitial extends SignupState {}
class SignInLoading extends SignupState {}
class SignInFail extends SignupState {}
class SignInSucess extends SignupState {
  final String uid;

  SignInSucess({required this.uid});
}
