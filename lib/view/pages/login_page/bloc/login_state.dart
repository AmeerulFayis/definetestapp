part of 'login_bloc.dart';

@immutable
abstract class LoginState extends Equatable{}

class LoginInitial extends LoginState {
  @override
  List<Object?> get props =>[];
}

class LoginSuccess extends LoginState{
  @override
  // TODO: implement props
  List<Object?> get props =>[];
}

class LoginError extends LoginState{
  @override
  // TODO: implement props
  List<Object?> get props =>[];
}