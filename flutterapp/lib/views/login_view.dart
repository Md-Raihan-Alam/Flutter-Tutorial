// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import '../firebase_options.dart';
import 'dart:developer' as devtools show log;

import 'package:flutterapp/constants/routes.dart';
import 'package:flutterapp/services/auth/auth_exceptions.dart';
import 'package:flutterapp/services/auth/auth_service.dart';

import '../utilities/dialogs/error_dialog.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  get devtools => null;
  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _email,
            enableSuggestions: false,
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: 'Enter you email here',
            ),
          ),
          TextField(
            controller: _password,
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            decoration: const InputDecoration(
              hintText: 'Enter you password here',
            ),
          ),
          TextButton(
            onPressed: () async {
              final email = _email.text;
              final password = _password.text;
              try {
                // final userCredential =
                //     await FirebaseAuth.instance.signInWithEmailAndPassword(
                //   email: email,
                //   password: password,
                // );
                // (userCredential.toString());
                // await FirebaseAuth.instance.signInWithEmailAndPassword(
                //   email: email,
                //   password: password,
                // );
                await AuthService.firebase().logIn(
                  email: email,
                  password: password,
                );
                // final user = FirebaseAuth.instance.currentUser;
                final user = AuthService.firebase().currentUser;
                // (user);
                // if (user?.emailVerified ?? false) {
                if (user?.isEmailVerified ?? false) {
                  //user's email is verified
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    notesRoute,
                    (route) => false,
                  );
                } else {
                  //user's email is not verified
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    verifyEmailRoute,
                    (route) => false,
                  );
                }
              } on UserNotFoundAuthExcption {
                await showErrorDialog(
                  context,
                  "User not found",
                );
              } on WrongPasswordAuthException {
                await showErrorDialog(
                  context,
                  "Wrong Password",
                );
              } on InvalidEmailAuthException {
                await showErrorDialog(
                  context,
                  "Invalid Email",
                );
              } on GenericAuthException {
                await showErrorDialog(
                  context,
                  "Authentication Error",
                );
              }
              // on FirebaseAuthException catch (e) {
              //   if (e.code == "user-not-found") {
              //     // ("user not found");
              //     // await showErrorDialog(
              //     //   context,
              //     //   "User not found",
              //     // );
              //   } else if (e.code == "wrong-password") {
              //     await showErrorDialog(
              //       context,
              //       "Wrong Password",
              //     );
              //     // ("wrong password");
              //   } else if (e.code == "invalid-email") {
              //     await showErrorDialog(
              //       context,
              //       "Invalid Email",
              //     );
              //     // ("Invalid Email");
              //   } else {
              //     await showErrorDialog(
              //       context,
              //       "Error:${e.code}",
              //     );
              //   }
              //   // print(e.code);
              // } catch (e) {
              //   await showErrorDialog(
              //     context,
              //     "Error:${e.toString()}",
              //   );
              // }
            },
            child: const Text("Login"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                registerRoute,
                (route) => false,
              );
            },
            child: const Text("Not registered yet? Register here!"),
          )
        ],
      ),
    );
  }
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //       appBar: AppBar(
  //         title: const Text("Login"),
  //       ),
  //       //supersaiyan033@gmail.com
  //       //raihan12345
  //       body: FutureBuilder(
  //         future: Firebase.initializeApp(
  //           options: DefaultFirebaseOptions.currentPlatform,
  //         ),
  //         builder: (context, snapshot) {
  //           switch (snapshot.connectionState) {
  //             case ConnectionState.done:
  //               return Column(
  //                 children: [
  //                   TextField(
  //                     controller: _email,
  //                     enableSuggestions: false,
  //                     autocorrect: false,
  //                     keyboardType: TextInputType.emailAddress,
  //                     decoration: const InputDecoration(
  //                       hintText: 'Enter you email here',
  //                     ),
  //                   ),
  //                   TextField(
  //                     controller: _password,
  //                     obscureText: true,
  //                     enableSuggestions: false,
  //                     autocorrect: false,
  //                     decoration: const InputDecoration(
  //                       hintText: 'Enter you password here',
  //                     ),
  //                   ),
  //                   TextButton(
  //                     onPressed: () async {
  //                       final email = _email.text;
  //                       final password = _password.text;
  //                       try {
  //                         final userCredential = await FirebaseAuth.instance
  //                             .signInWithEmailAndPassword(
  //                           email: email,
  //                           password: password,
  //                         );
  //                         print(userCredential);
  //                       } on FirebaseAuthException catch (e) {
  //                         if (e.code == "user-not-found") {
  //                           print("user not found");
  //                         } else if (e.code == "wrong-password") {
  //                           print("wrong password");
  //                         } else if (e.code == "invalid-email") {
  //                           print("Invalid Email");
  //                         }
  //                         // print(e.code);
  //                       }
  //                     },
  //                     child: const Text("Login"),
  //                   )
  //                 ],
  //               );
  //             default:
  //               return const Text('Loading...');
  //           }
  //         },
  //       ));
  // }
}
