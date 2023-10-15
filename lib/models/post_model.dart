// # your code goes here// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Post {
  final String id;
  final String studentId;
  final String content;
  final String banner;
  final String title;
  final String category;
  final List<String> replies;
  Post({
    required this.id,
    required this.studentId,
    required this.content,
    required this.banner,
    required this.title,
    required this.category,
    required this.replies,
  });

  Post copyWith({
    String? id,
    String? studentId,
    String? content,
    String? banner,
    String? title,
    String? category,
    List<String>? replies,
  }) {
    return Post(
      id: id ?? this.id,
      studentId: studentId ?? this.studentId,
      content: content ?? this.content,
      banner: banner ?? this.banner,
      title: title ?? this.title,
      category: category ?? this.category,
      replies: replies ?? this.replies,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'studentId': studentId,
      'content': content,
      'banner': banner,
      'title': title,
      'category': category,
      'replies': replies,
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    List<String> replies = (map['replies'] as List<dynamic>)
        .map((replies) => replies.toString())
        .toList();
    return Post(
      id: map['id'] as String,
      studentId: map['studentId'] as String,
      content: map['content'] as String,
      banner: map['banner'] as String,
      title: map['title'] as String,
      category: map['category'] as String,
      replies: replies,
    );
  }

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) =>
      Post.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Post(id: $id, studentId: $studentId, content: $content, banner: $banner, title: $title, category: $category, replies: $replies)';
  }

  @override
  bool operator ==(covariant Post other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.studentId == studentId &&
      other.content == content &&
      other.banner == banner &&
      other.title == title &&
      other.category == category &&
      listEquals(other.replies, replies);
  }

  @override
  int get hashCode {
    return id.hashCode ^
      studentId.hashCode ^
      content.hashCode ^
      banner.hashCode ^
      title.hashCode ^
      category.hashCode ^
      replies.hashCode;
  }
}

