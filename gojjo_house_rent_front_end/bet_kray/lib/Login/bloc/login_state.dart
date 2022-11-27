part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class UserLoginSuccessState extends LoginState {
  final String email;
  final String name;
    const UserLoginSuccessState(this.name, this.email);

  @override
  List<Object> get props => [name,email];

}

class AdminLoginSuccesState extends LoginState {
  final String email;
  final String name;
  const AdminLoginSuccesState(this.name, this.email);

  @override
  List<Object> get props => [name,email];

}

class LoginErrorState extends LoginState {
  final String message;
  LoginErrorState(this.message);
}

class logoutState extends LoginState {}