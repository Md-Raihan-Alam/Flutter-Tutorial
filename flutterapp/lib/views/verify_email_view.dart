// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/constants/routes.dart';
import 'package:flutterapp/services/auth/auth_service.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Email'),
      ),
      body: Column(children: [
        const Text(
            "We've sent you an email verification. Pleast open it to verify your account!"),
        const Text(
            "If you haven't reveived a verification email yet, press the button below"),
        TextButton(
          onPressed: () async {
            // final user = FirebaseAuth.instance.currentUser;
            // AuthService.firebase().currentUser;
            // await user?.sendEmailVerification();
            await AuthService.firebase().sendEmailVerification();
          },
          child: const Text("Send email verification"),
        ),
        TextButton(
          onPressed: () async {
            // await FirebaseAuth.instance.signOut();
            await AuthService.firebase().logOut();
            Navigator.of(context)
                .pushNamedAndRemoveUntil(registerRoute, (route) => false);
          },
          child: const Text('Restart'),
        )
      ]),
    );
  }
}
