part of 'register_bloc.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterFinish extends RegisterState {
  final RegisterResponseModel model;

  RegisterFinish({required this.model});
}
