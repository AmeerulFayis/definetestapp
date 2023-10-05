import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'forgot_event.dart';
part 'forgot_state.dart';

class ForgotBloc extends Bloc<ForgotEvent, ForgotState> {
  ForgotBloc() : super(ForgotInitial()) {
    on<ContinueButtonEvent>((event, emit)async {
      try{
        await FirebaseAuth.instance.sendPasswordResetEmail(
          email: event.email,
        );

      } on FirebaseException catch(e){
        log("Failed");

      }catch(e){
        log("message");
        emit(ForgotError());
      }
    });
  }
}
