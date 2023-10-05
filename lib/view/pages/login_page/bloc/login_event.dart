part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable{}
class LoginClickEvent extends LoginEvent{
  String email;
  String password;

  LoginClickEvent(this.email, this.password);
  @override
  List<Object?> get props => [email,password];
}
