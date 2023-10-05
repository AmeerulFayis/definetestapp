import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:definetestapp/utils/app_sp.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginClickEvent>((event, emit) async {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: event.email, password: event.password);

        String uid=userCredential.user!.uid;
        String? email=userCredential.user!.email;
        log("===========$email");
        AppSp().setUid(uid);
        AppSp().setEmail(email!);
        emit(LoginSuccess());
      } on FirebaseException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided.');
        }
      } catch (e) {
        emit(LoginError());
      }
    });
  }
}
