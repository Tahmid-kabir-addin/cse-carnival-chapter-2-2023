import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reachout2/constants/constants.dart';
import 'package:reachout2/theme/pallete.dart';
import 'package:reachout2/core/common/error_text.dart';
import 'package:reachout2/core/common/loader.dart';
import 'package:reachout2/core/routers.dart';
import 'package:reachout2/features/auth/controller/auth_controller.dart';
import 'package:reachout2/firebase_options.dart';
import 'package:reachout2/models/user_model.dart';
import 'package:routemaster/routemaster.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  UserModel? userModel;

  void getData(WidgetRef ref, User data) async {
    userModel = await ref
        .watch(authControllerProvider.notifier)
        .getUserData(data.uid)
        .first;
    ref.read(userProvider.notifier).update((state) => userModel);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(authStateChangeProvider).when(
      data: (data) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'reachout2',
        // theme: Pallete.darkModeAppTheme,
        routerDelegate: RoutemasterDelegate(routesBuilder: (context) {
          if (data != null) {
            getData(ref, data);
            if (userModel != null) return loggedInRoute;
          }
          return loggedOutRoute;
        }),
        routeInformationParser: const RoutemasterParser(),
      ),
      error: (error, stackTrace) => ErrorText(
        error: error.toString(),
      ),
      loading: () => const Loader(),
    );
  }
}