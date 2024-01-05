// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/constants/routes.dart';
import 'package:flutterapp/services/auth/auth_exceptions.dart';
import 'package:flutterapp/services/auth/auth_service.dart';
import 'package:flutterapp/utilities/dialogs/error_dialog.dart';
// import 'dart:developer' as devtools show log;
// import '../firebase_options.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late final TextEditingController _email;
  late final TextEditingController _password;
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
        title: const Text('Register'),
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
                //supersaiyan033@gmail.com
                //raihan12345
                //davidshank221066@gmail.com
                //david12345
                await AuthService.firebase()
                    .createUser(email: email, password: password);
                // await FirebaseAuth.instance.createUserWithEmailAndPassword(
                //   email: email,
                //   password: password,
                // );
                // final user = FirebaseAuth.instance.currentUser;
                // final user = AuthService.firebase().currentUser;
                // await user?.sendEmailVerification();
                await AuthService.firebase().sendEmailVerification();
                Navigator.of(context).pushNamed(verifyEmailRoute);
                // (userCredential.toString());
              } on WeakPasswordAuthException {
                await showErrorDialog(context, 'Weak password');
              } on EmailAlreadyInUseAuthException {
                await showErrorDialog(context, 'Email is already in use');
              } on InvalidEmailAuthException {
                await showErrorDialog(context, 'Invalid Email');
              } on GenericAuthException {
                // on GenericAuthException catch (e){
                await showErrorDialog(
                  context,
                  "Authentication Error",
                );
              }
              // on FirebaseAuthException catch (e) {
              //   if (e.code == "weak-password") {
              //     await showErrorDialog(context, 'Weak password');
              //     // ("weak password");
              //   } else if (e.code == "email-already-in-use") {
              //     // ("Email already in use");
              //     await showErrorDialog(context, 'Email is already in use');
              //   } else if (e.code == 'invalid-email') {
              //     await showErrorDialog(context, 'Invalid Email');
              //   } else {
              //     await showErrorDialog(context, 'Error ${e.code}');
              //   }
              //   // print(e.code);
              // } catch (e) {
              //   await showErrorDialog(context, e.toString());
              // }
            },
            child: const Text("Register"),
          ),
          TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(loginRoute, (route) => false);
              },
              child: const Text("Already registered? Login here!"))
        ],
      ),
    );
  }
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //       appBar: AppBar(
  //         title: const Text("Register"),
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
  //                             .createUserWithEmailAndPassword(
  //                           email: email,
  //                           password: password,
  //                         );
  //                         print(userCredential);
  //                       } on FirebaseAuthException catch (e) {
  //                         if (e.code == "weak-password") {
  //                           print("weak password");
  //                         } else if (e.code == "email-already-in-use") {
  //                           print("Email already in use");
  //                         }
  //                         // print(e.code);
  //                       }
  //                     },
  //                     child: const Text("Register"),
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
