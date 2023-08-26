part of 'login_bloc.dart';

class LoginState {
  final String email;
  final String password;
  final bool isPasswordCorrect;
  final User? user;

  LoginState({
    required this.email,
    required this.password,
    required this.isPasswordCorrect,
    required this.user,
  });

  factory LoginState.initial() {
    return LoginState(
      email: '',
      password: '',
      isPasswordCorrect: false,
      user: null,
    );
  }

  LoginState copyWith({
    String? email,
    String? password,
    bool? isPasswordCorrect,
    User? user,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      isPasswordCorrect: isPasswordCorrect ?? this.isPasswordCorrect,
      user: user ?? this.user,
    );
  }
}
