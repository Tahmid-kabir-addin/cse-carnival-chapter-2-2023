import 'package:flutter/material.dart';
import 'package:reachout2/features/experts/teacherProfile/widgets/courses_card.dart';

class TeacherCourseList extends StatefulWidget {
  const TeacherCourseList({super.key});

  @override
  State<TeacherCourseList> createState() => _TeacherCourseListState();
}

class _TeacherCourseListState extends State<TeacherCourseList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: 3,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
  }
}
