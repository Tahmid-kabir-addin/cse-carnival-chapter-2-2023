import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:reachout2/core/constants/firebase_constants.dart';
import 'package:reachout2/core/failure.dart';
import 'package:reachout2/core/providers/firebase_providers.dart';
import 'package:reachout2/core/type_defs.dart';
import 'package:reachout2/models/community_model.dart';
import 'package:reachout2/models/post_model.dart';

// Define a provider for the CommunityRepository.
final homeRepositoryProvider = Provider((ref) {
  return HomeRepository(fireStore: ref.watch(firestoreProvider));
});

class HomeRepository {
  final FirebaseFirestore _fireStore;

  HomeRepository({required FirebaseFirestore fireStore})
      : _fireStore = fireStore;

  // Reference to the 'communities' collection in Firestore.
  CollectionReference get _posts =>
      _fireStore.collection(FirebaseConstants.postsCollection);

  Stream<List<Post>> getUserPosts(String uid) {
  return _posts
      .where('studentId', isEqualTo: uid)
      .snapshots()
      .map((event) {
        List<Post> userPosts = [];
        for (var doc in event.docs) {
          userPosts.add(Post.fromMap(doc.data() as Map<String, dynamic>));
        }
        return userPosts;
      });
}

  Stream<List<Post>> getAllPosts() {
    return _posts.snapshots().map((event) {
      List<Post> posts = [];
      for (var doc in event.docs) {
        posts.add(Post.fromMap(doc.data() as Map<String, dynamic>));
      }
      // print(posts);
      return posts;
    });
  }

  // Stream<Community> getCommunityByName(String name) {
  //   return _communities.doc(name).snapshots().map((event) {
  //     return Community.fromMap(event.data() as Map<String, dynamic>);
  //   });
  // }

  // FutureVoid editCommunity(Community community) async {
  //   try {
  //     return right(_communities.doc(community.name).update(community.toMap()));
  //   } catch (e) {
  //     return left(Failure(e.toString()));
  //   }
  // }

  // FutureVoid addModsToCommunity(String communityName, List<String> uids) async {
  //   try {
  //     return right(_communities.doc(communityName).update({
  //       'mods': uids,
  //     }));
  //   } catch (e) {
  //     return left(Failure(e.toString()));
  //   }
  // }

  // Stream<List<Community>> searchCommunity(String query) {
  //   return _communities
  //       .where('name',
  //           isGreaterThanOrEqualTo: query.isEmpty ? 0 : query,
  //           isLessThan: query.isEmpty
  //               ? null
  //               : query.substring(0, query.length - 1) +
  //                   String.fromCharCode(query.codeUnitAt(query.length - 1) + 1))
  //       .snapshots()
  //       .map((event) {
  //     List<Community> communities = [];
  //     for (var doc in event.docs) {
  //       communities.add(Community.fromMap(doc.data() as Map<String, dynamic>));
  //     }
  //     return communities;
  //   });
  // }

  // FutureVoid joinCommunity(String communityName, String uid) async {
  //   try {
  //     return right(_communities.doc(communityName).update({
  //       'members': FieldValue.arrayUnion([uid]),
  //     }));
  //   } catch (e) {
  //     return left(Failure(e.toString()));
  //   }
  // }

  // FutureVoid leaveCommunity(String communityName, String uid) async {
  //   try {
  //     return right(_communities.doc(communityName).update({
  //       'members': FieldValue.arrayRemove([uid]),
  //     }));
  //   } catch (e) {
  //     return left(Failure(e.toString()));
  //   }
  // }
}
