import 'package:flutter/material.dart';
import 'package:reachout2/common/error_text.dart';
import 'package:reachout2/common/loader.dart';
import 'package:reachout2/constants/constants.dart';
import 'package:reachout2/features/auth/controller/auth_controller.dart';
import 'package:reachout2/features/experts/teacherHomePage/teacher_home_page.dart';
import 'package:reachout2/features/home/controller/home_controller.dart';
import 'package:reachout2/features/user/screens/studentProfile/widgets/blog_card.dart';
import 'widgets/studentAppBar.dart';
import 'widgets/studentDrawer.dart';
import 'widgets/toggle_button_child.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  List<bool> isSelected = List.generate(6, (index) => false);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isSelected[1] = true;
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider);
    if (user?.role != 'student') return TeacherHome();
    return Scaffold(
      appBar: const StudentAppbar(
        isNotificationAvailable: true,
        notificationCount: '2',
      ),
      drawer: studentDrawer(
        userName: user!.name,
        userEmail: user!.email,
        picturePath: user!.profilePic,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: ToggleButtons(
                  selectedColor: Color(0xFF3AD4E1),
                  isSelected: isSelected,
                  children: [
                    toggleButtonChild(
                        isSelected: isSelected, label: 'Blogs', index: 0),
                    toggleButtonChild(
                        isSelected: isSelected, label: 'Posts', index: 1),
                    toggleButtonChild(
                        isSelected: isSelected, label: 'Physics', index: 2),
                    toggleButtonChild(
                        isSelected: isSelected, label: 'Chemistry', index: 3),
                    toggleButtonChild(
                        isSelected: isSelected, label: 'Math', index: 4),
                    toggleButtonChild(
                        isSelected: isSelected, label: 'Biology', index: 5),
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
              ),
              SizedBox(
                height: 10,
              ),
              if (isSelected[0])
                Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: Center(
                    child: ref.watch(allPostsProvider).when(
                          data: (posts) {
                            // print(posts);
                            return ListView.separated(
                              itemCount: posts.length,
                              itemBuilder: (context, index) {
                                final user = ref.watch(getUserDataProvider(
                                    posts[index].studentId));
                                // print();
                                final post = posts[index];
                                // print(post);
                                return BlogCard(
                                    imagePath: user.value!.profilePic,
                                    authorName: user.value!.name,
                                    title: post.title,
                                    blogImagePath: post.banner == ''
                                        ? Constants.scienceBanner
                                        : post.banner,
                                    tags: [post.category],
                                    rootContext: context,
                                    onremoveTap: () {},
                                    takeToAuthorProfile: () {},
                                    width: 80);
                              },
                              separatorBuilder: ((context, index) {
                                return SizedBox(
                                  height: 5,
                                );
                              }),
                            );
                          },
                          error: (error, StackTrace) =>
                              ErrorText(error: error.toString()),
                          loading: () => const Text("loading..."),
                        ),
                  ),
                ),
              if (isSelected[1])
                Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  width: double.infinity,
                  child: Center(
                    child: ref.watch(allPostsProvider).when(
                          data: (posts) {
                            // print(posts);
                            return ListView.separated(
                              itemCount: posts.length,
                              itemBuilder: (context, index) {
                                final user = ref.watch(getUserDataProvider(
                                    posts[index].studentId));
                                // print();
                                final post = posts[index];
                                // print(post);
                                return GestureDetector(
                                  onTap: () {},
                                  child: BlogCard(
                                      imagePath: "user.value!.profilePic",
                                      authorName: "user.value!.name",
                                      title: "post.title",
                                      blogImagePath: post.banner == ''
                                          ? Constants.scienceBanner
                                          : post.banner,
                                      tags: ["post.category"],
                                      rootContext: context,
                                      onremoveTap: () {},
                                      takeToAuthorProfile: () {},
                                      width: 80),
                                );
                              },
                              separatorBuilder: ((context, index) {
                                return SizedBox(
                                  height: 5,
                                );
                              }),
                            );
                          },
                          error: (error, StackTrace) =>
                              ErrorText(error: error.toString()),
                          loading: () => const Text("loading..."),
                        ),
                  ),
                ),
              if (isSelected[2])
                Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: Center(
                    child: Text("Physics Screen"),
                  ),
                ),
              if (isSelected[3])
                Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: Center(
                    child: Text("Chemistry Screen"),
                  ),
                ),
              if (isSelected[4])
                Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: Center(
                    child: Text("Math Screen"),
                  ),
                ),
              if (isSelected[5])
                Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: Center(
                    child: Text("Biology Screen"),
                  ),
                )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Routemaster.of(context).push('/post'),
        child: Icon(
          Icons.add,
        ),
        backgroundColor: Color(0xFF3AD4E1),
      ),
    );
  }
}

////////////////////////////////

/////////////////////
