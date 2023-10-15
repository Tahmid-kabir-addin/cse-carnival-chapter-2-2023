// Model creation always in controller class
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reachout2/core/constants/constants.dart';
import 'package:reachout2/core/providers/storage_repositoy.dart';
import 'package:reachout2/features/auth/controller/auth_controller.dart';
import 'package:reachout2/features/community/repository/community_repository.dart';
import 'package:reachout2/features/home/repository/home_repository.dart';
import 'package:reachout2/models/community_model.dart';
import 'package:reachout2/models/post_model.dart';
import 'package:reachout2/utils.dart';
import 'package:routemaster/routemaster.dart';

// final searchCommunityProvider = StreamProvider.family((ref, String query) {
//   return ref.watch(communityControllerProvider.notifier).searchCommunity(query);
// });

final userPostsProvider = StreamProvider((ref) {
  return ref.watch(homeControllerProvider.notifier).getUserPosts();
});

final allPostsProvider = StreamProvider((ref) {
  return ref.watch(homeControllerProvider.notifier).getAllPosts();
});

// final allBlogsrovider = StreamProvider((ref) {
//   return ref.watch(homeControllerProvider.notifier).getAllBlogs();
// });
// final getCommunityByNameProvider = StreamProvider.family((ref, String name) {
//   return ref
//       .watch(communityControllerProvider.notifier)
//       .getCommunityByName(name);
// });

final homeControllerProvider =
    StateNotifierProvider<HomeController, bool>((ref) {
  return HomeController(
      homeRepository: ref.watch(homeRepositoryProvider),
      ref: ref,
      storageRepository: ref.watch(storageRepositoryProvider));
});

class HomeController extends StateNotifier<bool> {
  final HomeRepository _homeRepository;
  final StorageRepository _storageRepository;
  final Ref _ref;

  HomeController(
      {required HomeRepository homeRepository,
      required Ref ref,
      required StorageRepository storageRepository})
      : _homeRepository = homeRepository,
        _ref = ref,
        _storageRepository = storageRepository,
        super(false);

  // void createCommunity(String name, BuildContext context) async {
  //   state = true;
  //   final uid = _ref.watch(userProvider)?.uid ?? '';

  //   Community community = Community(
  //       id: name,
  //       name: name,
  //       banner: Constants.bannerDefault,
  //       avatar: Constants.avatarDefault,
  //       members: [uid],
  //       mods: [uid]);

  //   final res = await _communityRepository.createCommunity(community);

  //   res.fold((l) {
  //     showSnackBar(context, l.message);
  //     state = false;
  //   }, (r) {
  //     Routemaster.of(context).pop();
  //     showSnackBar(context, "Community Created Successfully");
  //     state = false;
  //   });
  // }

  Stream<List<Post>> getAllPosts() {
    final res = _homeRepository.getAllPosts();
    // print(res.first);
    return res;
  }
  // Stream<List<Post>> getAllBlogs() {
  //   final res = _homeRepository.getAllBlogs();
  //   // print(res.first);
  //   return res;
  // }

  // Stream<List<Community>> getUserCommunities() {
  //   final uid = _ref.read(userProvider)!.uid;
  //   print(uid);
  //   return _communityRepository.getUserCommunities(uid);
  // }

  Stream<List<Post>> getUserPosts() {
    final uid = _ref.read(userProvider)!.uid;
    // print(uid);
    return _homeRepository.getUserPosts(uid);
  }

  // Stream<Community> getCommunityByName(String name) {
  //   return _communityRepository.getCommunityByName(name);
  // }

  // Stream<List<Community>> searchCommunity(String query) {
  //   return _communityRepository.searchCommunity(query);
  // }

  // void editCommunity(
  //     {required Community community,
  //     required File? profileFile,
  //     required File? bannerFile,
  //     required BuildContext context}) async {
  //   state = true;
  //   // path: community/profile/{name}
  //   if (profileFile != null) {
  //     final res = await _storageRepository.storeFile(
  //         path: 'community/profile', id: community.name, file: profileFile);
  //     res.fold((l) => showSnackBar(context, l.message),
  //         (r) => community = community.copyWith(avatar: r));
  //   }

  //   // path: community/banner/{name}
  //   if (bannerFile != null) {
  //     final res = await _storageRepository.storeFile(
  //         path: 'community/banner', id: community.name, file: bannerFile);
  //     res.fold((l) => showSnackBar(context, l.message),
  //         (r) => community = community.copyWith(banner: r));
  //   }
  //   final res = await _communityRepository.editCommunity(community);
  //   state = false;
  //   res.fold((l) => showSnackBar(context, l.message),
  //       (r) => Routemaster.of(context).pop());
  // }

  // void joinCommunity(BuildContext context, Community community) async {
  //   final uid = _ref.watch(userProvider)?.uid;
  //   if (!community.members.contains(uid)) {
  //     print("${community.name} ${uid!}");
  //     final res = await _communityRepository.joinCommunity(community.name, uid);
  //     res.fold((l) => showSnackBar(context, l.message),
  //         (r) => showSnackBar(context, 'Community Joined Successfully!'));
  //   } else {
  //     final res =
  //         await _communityRepository.leaveCommunity(community.name, uid!);
  //     res.fold((l) => showSnackBar(context, l.message),
  //         (r) => showSnackBar(context, "Community Left Successfully!"));
  //   }
  // }

  // void addModsToCommunity(BuildContext context, String communityName, List<String> uids) async {
  //   final res = await _communityRepository.addModsToCommunity(communityName, uids);
  //   res.fold((l) => showSnackBar(context, l.message), (r) => Routemaster.of(context).pop());
  // }
}
