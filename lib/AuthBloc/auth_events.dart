import 'package:flutter/cupertino.dart';

@immutable
sealed class AuthEvents {}

/// login and login check
class AuthLoginRequested extends AuthEvents {
  final String email;
  final String password;
  AuthLoginRequested( {required this.email,required this.password,});

}

class AuthLogout extends AuthEvents {}