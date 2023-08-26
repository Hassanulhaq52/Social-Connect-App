import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task/models/post.dart';
import 'package:task/models/user.dart';
import 'package:task/services/user_service.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState.initial()) {
    on<OnEmailChanged>((event, emit) => emit(state.copyWith(email: event.email)));
    on<OnPasswordChanged>((event, emit) => emit(state.copyWith(password: event.password)));
    on<OnLoginPressed>((event, emit) async {
      final List<User> users = await UserService().getUsers();
      for (User user in users) {
        if (user.email == state.email) {
          checkPassword(user, emit);
          break;
        }
      }
    });
  }
  void checkPassword(User user, emit) {
    bool isCorrectPassword = user.username == state.password;
    emit(state.copyWith(isPasswordCorrect: isCorrectPassword));
    if (isCorrectPassword == true) {
      emit(state.copyWith(user: user));
    }
  }
}
