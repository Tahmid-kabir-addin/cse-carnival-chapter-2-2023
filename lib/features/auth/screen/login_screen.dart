import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reachout2/theme/pallete.dart';
import 'package:reachout2/core/common/loader.dart';
import 'package:reachout2/core/common/sign_in_button.dart';
import 'package:reachout2/constants/constants.dart';
import 'package:reachout2/features/auth/controller/auth_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  String _role = 'student';
  void setRole(String role) {
    setState(() {
      _role = role;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(authControllerProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Pallete.whiteColor,
        elevation: 0,
        clipBehavior: Clip.none,
        centerTitle: true,
        title: const Text(
          "ReachOut",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () => setRole('student'),
                      child: Container(
                        width: 155,
                        height: 188,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side:
                                BorderSide(width: 2, color: Color(0xFF3AD4E1)),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          shadows: [
                            BoxShadow(
                              color: Colors.white,
                              blurRadius: 4,
                              offset: Offset(0, 0),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 30.0),
                              child: Image.asset(
                                Constants.student,
                                height: 80,
                                width: 80,
                              ),
                            ),
                            SizedBox(
                              height: 05,
                            ),
                            Text(
                              'Student',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => setRole('expert'),
                      child: Container(
                        width: 155,
                        height: 188,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side:
                                BorderSide(width: 2, color: Color(0xFF3AD4E1)),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          shadows: [
                            BoxShadow(
                              color: Colors.white,
                              blurRadius: 4,
                              offset: Offset(0, 0),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 30.0),
                              child: Image.asset(
                                Constants.voiceAssistant,
                                height: 80,
                                width: 80,
                              ),
                            ),
                            SizedBox(
                              height: 05,
                            ),
                            Text(
                              'Experts',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                SignInButton(role: _role),
              ],
            ),
    );
  }
}
