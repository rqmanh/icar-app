part of 'sign_in_cubit.dart';

abstract class SignInState extends Equatable {
  const SignInState();

  @override
  List<Object?> get props => [];
}

class SignInInitial extends SignInState {}

class SignInLoading extends SignInState {
  final bool isLoading;
  const SignInLoading(this.isLoading);

  @override
  List<Object?> get props => [isLoading];
}

class SignInSuccess extends SignInState {
  final String message;
  const SignInSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class SignInError extends SignInState {
  final String message;
  const SignInError(this.message);

  @override
  List<Object?> get props => [message];
}
