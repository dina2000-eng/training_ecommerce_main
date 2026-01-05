import 'package:flutter/material.dart';

import '../generated/constants.dart';
import '../generated/enums.dart';
import '../models/user_data.dart';
import '../services/auth.dart';
import 'database_controller.dart';


class AuthController with ChangeNotifier {
  final AuthBase auth;
  String email;
  String password;
  AuthFormType authFormType;

  late FirestoreDatabase database;

  AuthController({
    required this.auth,
    this.email = '',
    this.password = '',
    this.authFormType = AuthFormType.login,
  }) {
    final user = auth.currentUser;
    if (user != null) {
      database = FirestoreDatabase(user.uid);
    }
  }

  Future<void> submit() async {
    try {
      if (authFormType == AuthFormType.login) {
        final user =
        await auth.loginWithEmailAndPassword(email, password);

        database = FirestoreDatabase(user!.uid);
      } else {
        final user =
        await auth.signUpWithEmailAndPassword(email, password);

        database = FirestoreDatabase(user!.uid);

        await database.setUserData(
          UserData(
            uid: user.uid,
            email: email,
          ),
        );
      }
    } catch (e) {
      rethrow;
    }
  }

  void toggleFormType() {
    final formType = authFormType == AuthFormType.login
        ? AuthFormType.register
        : AuthFormType.login;
    copyWith(
      email: '',
      password: '',
      authFormType: formType,
    );
  }

  void updateEmail(String email) => copyWith(email: email);

  void updatePassword(String password) => copyWith(password: password);

  void copyWith({
    String? email,
    String? password,
    AuthFormType? authFormType,
  }) {
    this.email = email ?? this.email;
    this.password = password ?? this.password;
    this.authFormType = authFormType ?? this.authFormType;
    notifyListeners();
  }

  Future<void> logout() async {
    try {
      await auth.logout();
    } catch (e) {
      rethrow;
    }
  }
}