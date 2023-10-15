// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class UserModel {
  final String name;
  final String email;
  final String profilePic;
  final String uid;
  final bool isAuthenticated;
  final bool isPremium;
  final List<String> upvote;
  final List<String> courses;
  final List<String> posts;
  final String role;

  UserModel({
    required this.name,
    required this.email,
    required this.profilePic,
    required this.uid,
    required this.isAuthenticated,
    required this.isPremium,
    required this.upvote,
    required this.courses,
    required this.posts,
    required this.role,
  });

  UserModel copyWith({
    String? name,
    String? email,
    String? profilePic,
    String? uid,
    bool? isAuthenticated,
    bool? isPremium,
    List<String>? upvote,
    List<String>? courses,
    List<String>? posts,
    String? role,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      profilePic: profilePic ?? this.profilePic,
      uid: uid ?? this.uid,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      isPremium: isPremium ?? this.isPremium,
      upvote: upvote ?? this.upvote,
      courses: courses ?? this.courses,
      posts: posts ?? this.posts,
      role: role ?? this.role,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'profilePic': profilePic,
      'uid': uid,
      'isAuthenticated': isAuthenticated,
      'isPremium': isPremium,
      'upvote': upvote,
      'courses': courses,
      'posts': posts,
      'role': role,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    List<String> upvote = (map['upvote'] as List<dynamic>)
        .map((upvote) => upvote.toString())
        .toList();
    List<String> courses = (map['courses'] as List<dynamic>)
        .map((course) => course.toString())
        .toList();
    List<String> posts =
        (map['posts'] as List<dynamic>).map((post) => post.toString()).toList();
    return UserModel(
      name: map['name'] as String,
      email: map['email'] as String,
      profilePic: map['profilePic'] as String,
      uid: map['uid'] as String,
      isAuthenticated: map['isAuthenticated'] as bool,
      isPremium: map['isPremium'] as bool,
      upvote: upvote,
      courses: courses,
      posts: posts,
      role: map['role'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(name: $name, email: $email, profilePic: $profilePic, uid: $uid, isAuthenticated: $isAuthenticated, isPremium: $isPremium, upvote: $upvote, courses: $courses, posts: $posts, role: $role)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.email == email &&
        other.profilePic == profilePic &&
        other.uid == uid &&
        other.isAuthenticated == isAuthenticated &&
        other.isPremium == isPremium &&
        listEquals(other.upvote, upvote) &&
        listEquals(other.courses, courses) &&
        listEquals(other.posts, posts) &&
        other.role == role;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        email.hashCode ^
        profilePic.hashCode ^
        uid.hashCode ^
        isAuthenticated.hashCode ^
        isPremium.hashCode ^
        upvote.hashCode ^
        courses.hashCode ^
        posts.hashCode ^
        role.hashCode;
  }
}
// / / class UserModel {
//   final String name;
//   final String profilePic;
//   final String banner;
//   final String uid;
//   final bool isAuthenticated;
//   final int karma;
//   final List<String> awards;

//   UserModel({
//     required this.name,
//     required this.profilePic,
//     required this.banner,
//     required this.uid,
//     required this.isAuthenticated,
//     required this.karma,
//     required this.awards,
//   });


//   @override
//   String toString() {
//     return 'UserModel{name: $name, profilePic: $profilePic, banner: $banner, uid: $uid, isAuthenticated: $isAuthenticated, karma: $karma, awards: $awards}';
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'name': this.name,
//       'profilePic': this.profilePic,
//       'banner': this.banner,
//       'uid': this.uid,
//       'isAuthenticated': this.isAuthenticated,
//       'karma': this.karma,
//       'awards': this.awards,
//     };
//   }

//   factory UserModel.fromMap(Map<String, dynamic> map) {
//     List<String> awards = (map['awards'] as List<dynamic>).map((award) => award.toString()).toList();
//     return UserModel(
//       name: map['name'] as String,
//       profilePic: map['profilePic'] as String,
//       banner: map['banner'] as String,
//       uid: map['uid'] as String,
//       isAuthenticated: map['isAuthenticated'] as bool,
//       karma: map['karma'] as int,
//       awards: awards,
//     );
//   }

//   UserModel copyWith({
//     String? name,
//     String? profilePic,
//     String? banner,
//     String? uid,
//     bool? isAuthenticated,
//     int? karma,
//     List<String>? awards,
//   }) {
//     return UserModel(
//       name: name ?? this.name,
//       profilePic: profilePic ?? this.profilePic,
//       banner: banner ?? this.banner,
//       uid: uid ?? this.uid,
//       isAuthenticated: isAuthenticated ?? this.isAuthenticated,
//       karma: karma ?? this.karma,
//       awards: awards ?? this.awards,
//     );
//   }
// }