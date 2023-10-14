import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reachout2/theme/pallete.dart';
import 'package:reachout2/core/constants/constants.dart';
import 'package:reachout2/features/auth/controller/auth_controller.dart';

import '../../features/auth/controller/auth_controller.dart';

class SignInButton extends ConsumerWidget {
  const SignInButton({super.key});
  
  void signInWithGoogle(BuildContext context, WidgetRef ref) {
    print("Inside SignInWithGoogle sign_in_button class");
    ref.read(authControllerProvider.notifier).signInWithGoogle(context);
  }
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: ElevatedButton.icon(
        onPressed: () => {
          print("SignIn button Clicked"),
          signInWithGoogle(context, ref)
        },
        icon: Image.asset(
          Constants.googlePath,
          width: 35,
        ),
        label: const Text(
          "Continue With Google",
          style: TextStyle(fontSize: 18, color: Pallete.whiteColor),
        ),
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 50),
        ),
      ),
    );
  }
}