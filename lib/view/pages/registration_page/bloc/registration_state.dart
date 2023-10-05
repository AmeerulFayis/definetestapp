part of 'registration_bloc.dart';

@immutable
abstract class RegistrationState extends Equatable{}

class RegistrationInitial extends RegistrationState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class RegistraionSuccess extends RegistrationState {
  @override
  List<Object?> get props => [];
}
class RegistrationErrorState extends RegistrationState{
  @override
  List<Object?> get props => [];

}
