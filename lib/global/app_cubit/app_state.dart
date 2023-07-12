part of 'app_cubit.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}

class AuthState extends AppState {}

class UnAuthState extends AppState {}