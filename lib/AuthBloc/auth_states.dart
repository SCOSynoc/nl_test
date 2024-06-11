import 'package:flutter/cupertino.dart';

@immutable
sealed class AuthStates{}

class AuthInitial extends AuthStates {}

class AuthSuccess extends AuthStates {
  final String userUid;

  AuthSuccess({required this.userUid});

}

class AuthFailure extends AuthStates  {

  final String error;
  AuthFailure({required this.error});

}

class AuthLoading extends AuthStates {
}