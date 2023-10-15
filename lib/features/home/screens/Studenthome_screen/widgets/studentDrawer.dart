import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reachout2/features/auth/controller/auth_controller.dart';
import 'package:routemaster/routemaster.dart';

class studentDrawer extends ConsumerWidget {
  final String userName;
  final String userEmail;
  final String picturePath;
  const studentDrawer({
    super.key,
    required this.userName,
    required this.userEmail,
    required this.picturePath,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);

    void navigateToProfile(BuildContext context) {
      Routemaster.of(context).push('/student-profile');
    }

    return Drawer(
      width: 250,
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              accountName: Text(
                userName,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              accountEmail: Text(
                userEmail,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(picturePath),
              ),
            ),
            ListTile(
              onTap: () => navigateToProfile(context),
              leading: const Icon(Icons.person),
              title: const Text(
                'Profile',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.school),
              title: Text(
                'Experts',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.question_mark),
              title: Text(
                'Questions',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 450,
            ),
            ListTile(
              onTap: () => ref.watch(authControllerProvider.notifier).logOut(),
              leading: Icon(
                Icons.exit_to_app,
                color: Colors.red,
              ),
              title: Text(
                'Logout',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
