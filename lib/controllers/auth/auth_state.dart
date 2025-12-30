import 'package:meta/meta.dart';

import '../../generated/enums.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {}

class AuthFailed extends AuthState {
  final String error;
  AuthFailed({required this.error});
}

class ToggleFormType extends AuthState {
  final AuthFormType formType;
  ToggleFormType(this.formType);
}
