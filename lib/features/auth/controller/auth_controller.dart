import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reachout2/features/auth/repository/auth_repository.dart';
import 'package:reachout2/models/user_model.dart';
import 'package:reachout2/utils.dart';

final userProvider = StateProvider<UserModel?>((ref) {
  print("Inside userProvider");
  return null;
});

// ref.watch: every time the authRepositoryProvider changes it will update
final authControllerProvider = StateNotifierProvider<AuthController, bool>(
        (ref) {
      print("Inside AuthControllerProvider");
      return AuthController(
          authRepository: ref.watch(authRepositoryProvider), ref: ref);
    });

final authStateChangeProvider = StreamProvider((ref) {
  print("inside authStateChangeProvider");
  final authController = ref.watch(authControllerProvider.notifier);
  return authController.authStateChange;
});

final getUserDataProvider = StreamProvider.family((ref, String uid) {
  print("inside getUserDataProvider");
  final authController = ref.watch(authControllerProvider.notifier);
  return authController.getUserData(uid);
});

class AuthController extends StateNotifier<bool> {
  late final AuthRepository _authRepository;
  final Ref _ref;

  AuthController({required AuthRepository authRepository, required Ref ref})
      : _authRepository = authRepository,
        _ref = ref,
        super(false);

  Stream<User?> get authStateChange => _authRepository.authStateChange;

  void signInWithGoogle(BuildContext context) async {
    print("Inside signInWithGoogle method of auth_controller class");
    state = true;
    print("calling auth_repository signInWithGoogle");
    final user = await _authRepository.signInWithGoogle();
    print(user);
    print("back from auth_repository signInWithGoogle");

    user.fold((l) => showSnackBar(context, l.message), (userModel) {
      print('Reading and updating userProvider with userModel');
      _ref.watch(userProvider.notifier).update((state) => userModel);
    });
    print(_ref.watch(userProvider.notifier).state);
    state = false;
  }

  Stream<UserModel> getUserData(String uid) {
    return _authRepository.getUserData(uid);
  }

  void logOut() {
    _authRepository.logOut();
  }
}