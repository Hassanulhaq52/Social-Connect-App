part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class OnEmailChanged extends LoginEvent {
  final String email;

  OnEmailChanged({required this.email});
}

class OnPasswordChanged extends LoginEvent {
  final String password;

  OnPasswordChanged({required this.password});
}

class OnGetPosts extends LoginEvent {}

class OnLoginPressed extends LoginEvent {}
