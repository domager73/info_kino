part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthProcessingState extends AuthState {}

class AuthSuccessState extends AuthState {}

class AuthFailState extends AuthState {}
