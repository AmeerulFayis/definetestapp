part of 'forgot_bloc.dart';

@immutable
abstract class ForgotEvent extends Equatable{}

class ContinueButtonEvent extends ForgotEvent{
  String email;
  ContinueButtonEvent(this.email);
  @override
  List<Object?> get props =>[email];

}
