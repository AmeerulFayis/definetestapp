import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc() : super(RegistrationInitial()) {
    on<RegistrationButtonEvent>((event, emit) async{
try{
UserCredential userCredential=await FirebaseAuth.instance.createUserWithEmailAndPassword(email: event.email, password: event.password);
emit(RegistraionSuccess());
}on Exception catch(e){
  log("Failed");

}catch(e){
  log("message");
emit(RegistrationErrorState());
}

    });
  }
}
