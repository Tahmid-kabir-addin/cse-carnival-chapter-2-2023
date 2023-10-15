import 'package:flutter/material.dart';
import 'package:reachout2/common/comments.dart';
import 'package:reachout2/common/comments_student.dart';
import 'package:reachout2/common/post_details.dart';
import 'package:reachout2/common/post_details_teacher.dart';
import 'package:reachout2/features/auth/screen/login_screen.dart';
import 'package:reachout2/features/community/screens/add_mods_screen.dart';
import 'package:reachout2/features/community/screens/community_screen.dart';
import 'package:reachout2/features/community/screens/create_community_screen.dart';
import 'package:reachout2/features/community/screens/edit_community_screen.dart';
import 'package:reachout2/features/community/screens/mod_tools_screen.dart';
import 'package:reachout2/features/experts/addNewCourse/add_new_course.dart';
import 'package:reachout2/features/experts/experts.dart';
import 'package:reachout2/features/experts/post_blogs.dart';
import 'package:reachout2/features/experts/teacherProfile/teacher_profile.dart';
import 'package:reachout2/features/experts/verificationRequest/verification_req.dart';
import 'package:reachout2/features/home/screens/Studenthome_screen/home_screen.dart';
import 'package:reachout2/features/user/screens/edit_user_screen.dart';
import 'package:reachout2/features/user/screens/postQuestion/post_question.dart';
import 'package:reachout2/features/user/screens/studentProfile/student_profile.dart';
import 'package:reachout2/features/user/screens/studentViewTeacherProfile/student_view_teacher_profile.dart';
import 'package:reachout2/features/user/screens/user_profile_screens.dart';
import 'package:routemaster/routemaster.dart';

final loggedOutRoute = RouteMap(routes: {
  '/': (_) => const MaterialPage(child: LoginScreen()),
});

final loggedInRoute = RouteMap(routes: {
  '/': (_) => const MaterialPage(child: HomeScreen()),
  '/student-profile': (_) =>
      const MaterialPage(child: StudentProfile()),
  '/post':(_) => const MaterialPage(child: PostQuestion()),
  '/post-expert':(_) => const MaterialPage(child: PostBlogs()),
  '/post-details/:id':(route) => MaterialPage(child: PostDetails(id: route.pathParameters['id']!)),
  '/post-details-teacher/:id':(route) => MaterialPage(child: PostDetailsTeacher(id: route.pathParameters['id']!)),
  '/comments/:id':(route) => MaterialPage(child: Comments(id: route.pathParameters['id']!)),
  '/comments-student/:id':(route) => MaterialPage(child: CommentsStudent(id: route.pathParameters['id']!)),
  '/teacher-profile':(route) => const MaterialPage(child: TeacherProfile()),
  '/approval':(route) => const MaterialPage(child: VerificationRequest()),
  '/experts':(route) => const MaterialPage(child: ExpertsScreen()),
  '/new-course':(route) => const MaterialPage(child: AddNewCourse()),
  '/student-view-teacher':(route) => const MaterialPage(child: StudentViewTeacherProfile()),
  // '/create-community': (_) =>
  //     const MaterialPage(child: CreateCommunityScreen()),
  // '/r/:name': (route) =>
  //     MaterialPage(child: CommunityScreen(name: route.pathParameters['name']!)),
  // '/mod-tools/:name': (route) =>
  //     MaterialPage(child: ModToolsScreen(name: route.pathParameters['name']!)),
  // '/edit-community/:name': (route) => MaterialPage(
  //     child: EditCommunityScreen(name: route.pathParameters['name']!)),
  // '/add-mods/:name': (route) =>
  //     MaterialPage(child: AddModsScreen(name: route.pathParameters['name']!)),
  // '/user/:uid': (route) =>
  //     MaterialPage(child: UserProfileScreen(uid: route.pathParameters['uid']!)),
  // '/edit-user/:uid': (route) => MaterialPage(
  //       child: EditUserScreen(uid: route.pathParameters['uid']!),
  //     )
});
