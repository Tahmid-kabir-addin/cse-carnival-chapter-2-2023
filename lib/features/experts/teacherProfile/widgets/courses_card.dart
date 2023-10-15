import 'package:flutter/material.dart';
import 'package:reachout2/constants/constants.dart';

Map<int, String> subjectImages = {
  1: Constants.mathsPic,
  2: Constants.sciencePic,
  3: Constants.physicsPic,
  4: Constants.biologyPic,
  5: Constants.physicsPic,
};

class CoursesCard extends StatelessWidget {
  final String lessonName;
  final String teacherName;

  final int idx;

  const CoursesCard({
    super.key,
    required this.lessonName,
    required this.teacherName,
    required this.idx,
  });

  @override
  Widget build(BuildContext context) {
    String subjectImage = subjectImages[idx % 5] ?? Constants.sciencePic;
    return Container(
      decoration: ShapeDecoration(
        color: idx % 2 == 0 ? Color(0x35E8914F) : Color(0x35FB95E1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(18, 18, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              subjectImage,
              height: 40,
              width: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 13.0),
              child: Text(
                lessonName,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                'By ${teacherName}',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
