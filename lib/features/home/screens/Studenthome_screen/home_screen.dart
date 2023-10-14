import 'package:flutter/material.dart';
import 'package:reachout2/constants/constants.dart';
import 'package:reachout2/features/auth/controller/auth_controller.dart';
import 'widgets/studentAppBar.dart';
import 'widgets/studentDrawer.dart';
import 'widgets/toggle_button_child.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    isSelected[0] = true;
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider);
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
      body: Padding(
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
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
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









