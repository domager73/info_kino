import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;

  AuthCubit({required this.authRepository}) : super(AuthInitial());

  _auth(Future method) async {
    emit(AuthProcessingState());
    try {
      await method;
      emit(AuthSuccessState());
    } catch (e) {
      emit(AuthFailState());
    }
  }

  void loginWithEmail({required String email, required String password}) =>
      _auth(authRepository.loginWithEmail(email, password));

  void registerWIthEmail(
          {required String email,
          required String password,
          required String name}) =>
      _auth(authRepository.registerWithEmail(email, password, name));

  void loginWithGoogle() => _auth(authRepository.loginWithGoogle());
}
