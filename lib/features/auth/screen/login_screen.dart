import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reachout2/theme/pallete.dart';
import 'package:reachout2/core/common/loader.dart';
import 'package:reachout2/core/common/sign_in_button.dart';
import 'package:reachout2/core/constants/constants.dart';
import 'package:reachout2/features/auth/controller/auth_controller.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(authControllerProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Pallete.whiteColor,
        elevation: 0,
        clipBehavior: Clip.none,
        centerTitle: true,
        title: const Text("ReachOut", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        actions: [
          TextButton(
              onPressed: () {},
              child: const Text(
                "Skip",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Pallete.whiteColor,
                ),
              ))
        ],
      ),
      body: isLoading
          ? const Loader()
          : Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Dive Into Anything",
                  style: TextStyle(
                    letterSpacing: 0.5,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    Constants.loginEmotePath,
                    height: 400,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const SignInButton(),
              ],
            ),
    );
  }
}
