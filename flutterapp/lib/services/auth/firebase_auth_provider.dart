import 'package:flutterapp/services/auth/auth_user.dart';
import 'package:flutterapp/services/auth/auth_provider.dart';
import 'package:flutterapp/services/auth/auth_exceptions.dart';

import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthProvider implements AuthProvider {
  @override
  Future<AuthUser> createUser(
      {required String email, required String password}) async {
    // TODO: implement createUser
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      final user = currentUser;
      if (user != null) {
        return user;
      } else {
        throw UserNotFoundAuthExcption();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        throw WeakPasswordAuthException();
        // devtools.log("weak password");
      } else if (e.code == "email-already-in-use") {
        throw EmailAlreadyInUseAuthException();
        // devtools.log("Email already in use");
      } else if (e.code == 'invalid-email') {
        throw InvalidEmailAuthException();
      } else {
        throw GenericAuthException();
      }
    } catch (_) {
      throw GenericAuthException();
    }
  }

  @override
  // TODO: implement currentUser
  AuthUser? get currentUser {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return AuthUser.fromFirebase(user);
    } else {
      return null;
    }
  }

  @override
  Future<AuthUser> logIn({
    required String email,
    required String password,
  }) async {
    // TODO: implement logIn
    try {
      FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      final user = currentUser;
      if (user != null) {
        return user;
      } else {
        throw UserNotFoundAuthExcption();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        throw UserNotFoundAuthExcption();
      } else if (e.code == "wrong-password") {
        throw WrongPasswordAuthException();
        // devtools.log("wrong password");
      } else if (e.code == "invalid-email") {
        throw InvalidEmailAuthException();
        // devtools.log("Invalid Email");
      } else {
        throw GenericAuthException();
      }
    } catch (_) {
      throw GenericAuthException();
    }
  }

  @override
  Future<void> logOut() async {
    // TODO: implement logOut
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await FirebaseAuth.instance.signOut();
    } else {
      throw UserNotLoggedInAuthException();
    }
  }

  @override
  Future<void> sendEmailVerification() async {
    // TODO: implement sendEmailVerification
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await user.sendEmailVerification();
    } else {
      throw UserNotFoundAuthExcption();
    }
  }
}
