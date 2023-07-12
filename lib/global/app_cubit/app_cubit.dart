import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data/auth_repository.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  final AuthRepository authRepository;

  AppCubit({required this.authRepository}) : super(AppInitial()) {
    authRepository.appState.stream.listen((event) {
      if (event == AppStateEnum.auth) emit(AuthState());
      if (event == AppStateEnum.unAuth) emit(UnAuthState());
    });
  }
}
