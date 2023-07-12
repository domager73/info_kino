import 'package:info_kino/services/auth_service.dart';
import 'package:rxdart/rxdart.dart';

enum AppStateEnum { auth, unAuth, wait }

class AuthRepository {
  final AuthService _authService;

  AuthRepository({required AuthService authService})
      : _authService = authService {
    checkLogin();
  }

  BehaviorSubject<AppStateEnum> appState =
      BehaviorSubject<AppStateEnum>.seeded(AppStateEnum.wait);

  Future checkLogin() async {
    try {
      await _authService.checkLogin();
      appState.add(AppStateEnum.auth);
    } catch (e) {
      appState.add(AppStateEnum.unAuth);
    }
  }

  Future signOut() async => await _authService
      .logout()
      .then((value) => appState.add(AppStateEnum.unAuth));

  Future _auth(Future method) async {
    try {
      await method;
      appState.add(AppStateEnum.auth);
    } catch (e) {
      rethrow;
    }
  }

  Future loginWithEmail(String email, String password) async =>
      await _auth(_authService.sighInWithEmailAndPassword(email, password));

  Future loginWithGoogle() async =>
      await _auth(_authService.signInWithGoogle());

  Future registerWithEmail(String email, String password, String name) async =>
      await _auth(
          _authService.registerWithEmailAndPassword(email, password, name));
}
