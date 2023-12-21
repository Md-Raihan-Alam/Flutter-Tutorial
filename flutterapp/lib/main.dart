// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/constants/routes.dart';
import 'package:flutterapp/services/auth/auth_service.dart';
import 'package:flutterapp/views/login_view.dart';
import 'package:flutterapp/views/notes/new_note_view.dart';
import 'package:flutterapp/views/notes/notes_view.dart';
import 'package:flutterapp/views/register_view.dart';
import 'package:flutterapp/views/verify_email_view.dart';
// import 'firebase_options.dart';
// import 'dart:developer' as devtools show log;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // useMaterial3: true,
        primaryColor: Colors.blue[800],
      ),
      home: const HomePage(),
      routes: {
        loginRoute: (context) => const LoginView(),
        registerRoute: (context) => const RegisterView(),
        notesRoute: (context) => const NoteView(),
        verifyEmailRoute: (context) => const VerifyEmailView(),
        newNoteRouter: (context) => const NewNoteView(),
      },
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    //supersaiyan033@gmail.com
    //raihan12345
    return FutureBuilder(
      // future: Firebase.initializeApp(
      //   options: DefaultFirebaseOptions.currentPlatform,
      // ),
      future: AuthService.firebase().initialize(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            // final user = FirebaseAuth.instance.currentUser;
            final user = AuthService.firebase().currentUser;
            if (user != null) {
              // if (user.emailVerified) {
              if (user.isEmailVerified) {
                return const NoteView();
              } else {
                return const VerifyEmailView();
              }
            } else {
              return const LoginView();
            }

          // // final emailVerified = user?.emailVerified ?? false;
          // if (user?.emailVerified ?? false) {
          //   // print("You are a verified user");
          // } else {
          //   return const VerifyEmailView();
          //   // print("You are not a veritfied user");
          //   // Navigator.of(context).push(MaterialPageRoute(
          //   //   builder: (context) => const VerifyEmailView(),
          //   // ));
          // }
          // return const Text("Done");
          default:
            // return const Text('Loading...');
            return const CircularProgressIndicator();
        }
      },
    );
  }
}
