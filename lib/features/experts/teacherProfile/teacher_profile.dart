import 'package:flutter/material.dart';
import 'package:reachout2/constants/colors.dart';
import 'package:reachout2/core/constants/constants.dart';
import 'package:reachout2/features/home/screens/Studenthome_screen/widgets/toggle_button_child.dart';
import 'package:reachout2/features/user/screens/studentProfile/widgets/blog_card.dart';

import '../../user/screens/studentProfile/widgets/edit_profile_content.dart';
import 'widgets/teacher_courses_List.dart';
import 'package:routemaster/routemaster.dart';
class TeacherProfile extends StatefulWidget {
  const TeacherProfile({super.key});

  @override
  State<TeacherProfile> createState() => _TeacherProfileState();
}

class _TeacherProfileState extends State<TeacherProfile> {
  List<bool> isSelected = List.generate(3, (index) => false);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isSelected[1] = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Routemaster.of(context).pop(),
          child: const Icon(
            Icons.keyboard_arrow_left,
            color: Colors.black,
          ),
        ),
        title: const Text(
          'Profile',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  minRadius: 50,
                  backgroundColor: Colors.grey.withOpacity(0.2),
                  child: Image.network(
                    Constants.avatarDefault,
                    height: 70,
                    width: 70,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  'Muntasir Mamun ',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  'Total Blogs: 2 .   Total Courses: 5',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ToggleButtons(
                    selectedColor: primaryColor,
                    isSelected: isSelected,
                    children: [
                      toggleButtonChild(
                          isSelected: isSelected, label: 'Blogs', index: 0),
                      toggleButtonChild(
                          isSelected: isSelected, label: 'Courses', index: 1),
                      toggleButtonChild(
                        isSelected: isSelected,
                        label: 'Edit Profile',
                        index: 2,
                      ),
                    ],
                    renderBorder: false,
                    onPressed: (int index) {
                      setState(
                        () {
                          for (int buttonIndex = 0;
                              buttonIndex < isSelected.length;
                              buttonIndex++) {
                            isSelected[buttonIndex] = (buttonIndex == index);
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              if (isSelected[0])
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      BlogCard(
                        imagePath: Constants.avatarDefault,
                        authorName: 'Muntasir Mamun',
                        title: 'Hello Brother',
                        blogImagePath: Constants.scienceDefault,
                        tags: ['Biology'],
                        rootContext: context,
                        onremoveTap: () {},
                        takeToAuthorProfile: () {},
                        width: MediaQuery.of(context).size.width,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: BlogCard(
                          imagePath: Constants.avatarDefault,
                          authorName: 'Tahmid Kabir',
                          title: 'Hello Brother',
                          blogImagePath: Constants.chemistryDefault,
                          tags: ['Physics', 'Chemistry'],
                          rootContext: context,
                          onremoveTap: () {},
                          takeToAuthorProfile: () {},
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                    ],
                  ),
                ), // Sho

              if (isSelected[1])
                Scrollbar(
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.47,
                        child: TeacherCourseList(),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: double.infinity,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () => Routemaster.of(context).push('/new-course'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                          ),
                          child: const Text(
                            'Add New Course',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              // Show Courses content when index is 1
              if (isSelected[2]) StudentEditProfile(),
            ],
          ),
        ),
      ),
    );
  }
}
