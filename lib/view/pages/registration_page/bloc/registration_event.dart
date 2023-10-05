part of 'registration_bloc.dart';

@immutable
abstract class RegistrationEvent extends Equatable{}

class RegistrationButtonEvent extends RegistrationEvent{
  String email;
  String password;

  RegistrationButtonEvent(this.email, this.password);

  @override
  List<Object?> get props => [email,password];
}
