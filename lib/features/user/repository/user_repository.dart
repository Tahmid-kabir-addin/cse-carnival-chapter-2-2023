import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:reachout2/core/constants/firebase_constants.dart';
import 'package:reachout2/models/community_model.dart';
import 'package:reachout2/models/post_model.dart';
import 'package:reachout2/models/user_model.dart';

import '../../../core/failure.dart';
import '../../../core/providers/firebase_providers.dart';
import '../../../core/type_defs.dart';

final userRepositoryProvider = Provider((ref) {
  return UserRepository(fireStore: ref.watch(firestoreProvider));
});

class UserRepository {
  int id = 0;
  final _fireStore;

  UserRepository({required FirebaseFirestore fireStore})
      : _fireStore = fireStore;

  CollectionReference get _users =>
      _fireStore.collection(FirebaseConstants.usersCollection);

  FutureVoid editUser(UserModel user) async {
    try {
      return right(_users.doc(user.uid).update(user.toMap()));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  CollectionReference get _posts =>
      _fireStore.collection(FirebaseConstants.postsCollection);

  FutureVoid createPost(Post post) async {
    try {
      // // get the community document based on the name
      // var communityDoc = await _posts.doc(post.id).get();

      // Set the data for the new community in Firestore and return a successful result (Right).
      return Right(_posts.doc(post.id).set(post.toMap()));
    } catch (e) {
      print(e.toString());
      return Left(Failure(e.toString()));
    }
  }
}
