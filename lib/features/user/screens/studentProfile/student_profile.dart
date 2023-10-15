import 'package:flutter/material.dart';
import 'package:reachout2/common/error_text.dart';
import 'package:reachout2/common/loader.dart';
import 'package:reachout2/constants/colors.dart';
import 'package:reachout2/constants/constants.dart';
import 'package:reachout2/features/auth/controller/auth_controller.dart';
import 'package:reachout2/features/experts/teacherProfile/widgets/teacher_courses_List.dart';
import 'package:reachout2/features/home/controller/home_controller.dart';
import 'package:reachout2/features/home/screens/Studenthome_screen/widgets/toggle_button_child.dart';

import 'widgets/blog_card.dart';
import 'widgets/courses_list.dart';
import 'widgets/edit_profile_content.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';

class StudentProfile extends ConsumerStatefulWidget {
  // final String uid;
  const StudentProfile({super.key});

  @override
  ConsumerState<StudentProfile> createState() => _StudentProfileState();
}

class _StudentProfileState extends ConsumerState<StudentProfile> {
  List<bool> isSelected = List.generate(3, (index) => false);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isSelected[1] = true;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final user = ref.watch(userProvider);
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () => Routemaster.of(context).pop(),
            child: const Icon(
              Icons.keyboard_arrow_left,
              color: Colors.black,
            ),
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
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    user!.profilePic,
                  ),
                  // minRadius: 50,
                  radius: 50,
                  backgroundColor: Colors.grey.withOpacity(0.2),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  user!.name,
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
                  'Total Posts: 2 .   Courses Enrolled: 5',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ToggleButtons(
                    selectedColor: Color(0xFF3AD4E1),
                    isSelected: isSelected,
                    children: [
                      toggleButtonChild(
                          isSelected: isSelected, label: 'Posts', index: 0),
                      toggleButtonChild(
                          isSelected: isSelected, label: 'Courses', index: 1),
                      toggleButtonChild(
                          isSelected: isSelected,
                          label: 'Edit Profile',
                          index: 2),
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
              const SizedBox(
                height: 30,
              ),
              ref.watch(userPostsProvider).when(
                  data: (data) {
                    if (isSelected[0]) {
                      return Container(
                        height: 500,
                        child: ListView.separated(
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return BlogCard(
                              imagePath: user.profilePic,
                              authorName: user.name,
                              title: data[index].title,
                              blogImagePath: data[index].banner == ''
                                  ? Constants.avatarDefault
                                  : data[index].banner,
                              tags: [data[index].category],
                              rootContext: context,
                              onremoveTap: () {},
                              takeToAuthorProfile: () {},
                              width: MediaQuery.of(context).size.width,
                            );
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 5,
                          ),
                        ),
                      );
                    }
                    return const SizedBox(
                      height: 0,
                    );
                  },
                  error: (error, stackTrace) =>
                      ErrorText(error: error.toString()),
                  loading: () => const Loader()),
              // Sho

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
                      // Container(
                      //   width: double.infinity,
                      //   height: 40,
                      //   child: ElevatedButton(
                      //     onPressed: () =>
                      //         Routemaster.of(context).push('/new-course'),
                      //     style: ElevatedButton.styleFrom(
                      //       backgroundColor: primaryColor,
                      //     ),
                      //     child: const Text(
                      //       'Add New Course',
                      //       style: TextStyle(fontWeight: FontWeight.bold),
                      //     ),
                      //   ),
                      // )
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
