import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reachout2/common/error_text.dart';
import 'package:reachout2/common/loader.dart';
import 'package:reachout2/features/auth/controller/auth_controller.dart';

import 'courses_card.dart';

class CourseList extends ConsumerStatefulWidget {
  const CourseList({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CourseListState();
}

class _CourseListState extends ConsumerState<CourseList> {

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider);
    return ref.watch(getUserDataProvider(user!.uid)).when(
        data: (user) {
          return Expanded(
            child: GridView.builder(
              itemCount: user.courses.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return CoursesCard(
                  idx: index,
                  lessonName: 'Vector Physics',
                  teacherName: 'Muntasir Mamun',
                );
              },
            ),
          );
        },
        error: (error, StackTrace) => ErrorText(error: error.toString()),
        loading: () => const Loader());
  }
}
