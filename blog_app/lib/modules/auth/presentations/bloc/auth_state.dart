part of 'auth_cubit.dart';

class AuthState extends Equatable {
  const AuthState();
  @override
  List<Object?> get props => throw UnimplementedError();
}

class InitState extends AuthState {}

class LoggedInState extends AuthState {
  final AuthModel? authModel;
  const LoggedInState(this.authModel);
}

class FailureState extends AuthState {
  final String? failureMessage;

  const FailureState([this.failureMessage]);
}
