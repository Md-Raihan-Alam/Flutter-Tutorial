import 'package:flutterapp/services/auth/auth_provider.dart';
import 'package:flutterapp/services/auth/auth_user.dart';
import 'package:flutterapp/services/auth/firebase_auth_provider.dart';

class AuthService implements AuthProvider {
  final AuthProvider provider;

  const AuthService(this.provider);

  factory AuthService.firebase() => AuthService(FirebaseAuthProvider());

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

  @override
  Future<void> initialize() =>
      // TODO: implement initialize
      provider.initialize();
}
