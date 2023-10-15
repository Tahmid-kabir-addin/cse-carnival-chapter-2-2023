import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reachout2/features/user/repository/user_repository.dart';
import 'package:reachout2/models/post_model.dart';
import 'package:reachout2/models/user_model.dart';
import 'package:routemaster/routemaster.dart';

import '../../core/providers/storage_repositoy.dart';
import '../../utils.dart';
import 'package:uuid/uuid.dart';

final userControllerProvider =
    StateNotifierProvider<UserController, bool>((ref) {
  return UserController(
      userRepository: ref.watch(userRepositoryProvider),
      ref: ref,
      storageRepository: ref.watch(storageRepositoryProvider));
});

class UserController extends StateNotifier<bool> {
  int _id = 0;
  int _imageId = 0;
  final UserRepository _userRepository;
  final StorageRepository _storageRepository;
  final Ref _ref;
  final Uuid uuid = Uuid();



  UserController(
      {required UserRepository userRepository,
      required Ref ref,
      required StorageRepository storageRepository})
      : _userRepository = userRepository,
        _ref = ref,
        _storageRepository = storageRepository,
        super(false);

  void editUser(
      {required UserModel user,
      required File? profileFile,
      required BuildContext context,
      required String name}) async {
    state = true;
    // path: community/profile/{name}
    if (profileFile != null) {
      final res = await _storageRepository.storeFile(
          path: 'user/student/profile', id: user.uid, file: profileFile);
      res.fold((l) => showSnackBar(context, l.message),
          (r) => user = user.copyWith(profilePic: r));
    }

    // // path: community/banner/{name}
    // if (bannerFile != null) {
    //   final res = await _storageRepository.storeFile(
    //       path: 'user/banner', id: user.uid, file: bannerFile);
    //   res.fold((l) => showSnackBar(context, l.message),
    //       (r) => user = user.copyWith(banner: r));
    // }
    if (name.isNotEmpty) user = user.copyWith(name: name);

    final res = await _userRepository.editUser(user);
    state = false;
    res.fold((l) => showSnackBar(context, l.message),
        (r) => showSnackBar(context, "Successfully Updated!"));
  }

  void updateUserPost(
      {required UserModel user,
      required Post post, required context}) async {
    state = true;
    
    user = user.copyWith(posts: [...user.posts, post.id]);

    final res = await _userRepository.editUser(user);
    state = false;
    res.fold((l) => showSnackBar(context, l.message),
        (r) => showSnackBar(context, "Successfully Updated!"));
  }

  void createPost(BuildContext context, String title, String content, File? bannerFile, UserModel user, String category) async {

    state = true;
    // path: community/profile/{name}
    late String _banner = '';
    if (bannerFile != null) {
      final res = await _storageRepository.storeFile(
          path: 'user/student/post', id: uuid.v4(), file: bannerFile);
      res.fold((l) => showSnackBar(context, l.message),
          (r) => _banner= r);
    }
  

    final post = Post(id: uuid.v4(), studentId: user.uid, content: content, banner: _banner, title: title, category: category, replies: []);

    user.copyWith(posts: [...user.posts, post.id]);
    _id++;
    _imageId++;

    final res = await _userRepository.createPost(post);

    state = false;
    updateUserPost(user: user, post: post, context: context);

    res.fold((l) => showSnackBar(context, l.message),
        (r) => Routemaster.of(context).pop());
    
  }
}
