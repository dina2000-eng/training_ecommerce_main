import 'package:flutter_bloc/flutter_bloc.dart';
import '../../services/auth.dart';
import '../../generated/enums.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final AuthBase authServices = Auth();
  AuthFormType authFormType = AuthFormType.login;

  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    try {
      final user =
      await authServices.loginWithEmailAndPassword(email, password);

      if (user != null) {
        emit(AuthSuccess());
      } else {
        emit(AuthFailed(error: 'Incorrect credentials!'));
      }
    } catch (e) {
      emit(AuthFailed(error: e.toString()));
    }
  }

  Future<void> signUp(String email, String password) async {
    emit(AuthLoading());
    try {
      final user =
      await authServices.signUpWithEmailAndPassword(email, password);

      if (user != null) {
        emit(AuthSuccess());
      } else {
        emit(AuthFailed(error: 'Incorrect credentials!'));
      }
    } catch (e) {
      emit(AuthFailed(error: e.toString()));
    }
  }

  void authStatus() {
    final user = authServices.currentUser;
    if (user != null) {
      emit(AuthSuccess());
    } else {
      emit(AuthInitial());
    }
  }

  Future<void> logout() async {
    emit(AuthLoading());
    try {
      await authServices.logout();
      emit(AuthInitial());
    } catch (e) {
      emit(AuthFailed(error: e.toString()));
    }
  }

  void toggleFormType() {
    authFormType = authFormType == AuthFormType.login
        ? AuthFormType.register
        : AuthFormType.login;

    emit(ToggleFormType(authFormType));
  }
}
