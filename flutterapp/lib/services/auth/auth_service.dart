import 'package:flutterapp/services/auth/auth_provider.dart';
import 'package:flutterapp/services/auth/auth_user.dart';

class AuthService implements AuthProvider {
  final AuthProvider provider;

  AuthService(this.provider);

  @override
  Future<AuthUser> createUser({
    required String email,
    required String password,
  }) =>
      // TODO: implement createUser
      provider.createUser(email: email, password: password);

  @override
  // TODO: implement currentUser
  AuthUser? get currentUser => provider.currentUser;

  @override
  Future<AuthUser> logIn({
    required String email,
    required String password,
  }) =>
      // TODO: implement logIn
      provider.logIn(email: email, password: password);

  @override
  Future<void> logOut() =>
      // TODO: implement logOut
      provider.logOut();

  @override
  Future<void> sendEmailVerification() =>
      // TODO: implement sendEmailVerification
      provider.sendEmailVerification();
}
