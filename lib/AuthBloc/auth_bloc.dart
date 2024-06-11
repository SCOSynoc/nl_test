import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../repository/Auth_service.dart';
import 'auth_events.dart';
import 'auth_states.dart';


/// Auth bloc for managing auth related states
class AuthBloc extends Bloc<AuthEvents, AuthStates> {
  AuthBloc(): super(AuthInitial()) {
    on<AuthLoginRequested>(_onLoginRequested);
  }


  AuthService authService = AuthService()..initializeInstances();

    Future<void> _onLoginRequested(AuthLoginRequested event, Emitter<AuthStates> emit) async {
      emit(AuthLoading());
      try {
        final email = event.email;
        final password = event.password;

        log("here data added successfully $email");
        await authService.loginInUserWithEmailAndPassword(email: email, password: password);
           emit(AuthSuccess(userUid: email));

      } catch (e) {
        emit(AuthFailure(error:e.toString()));
      }
    }

  }



