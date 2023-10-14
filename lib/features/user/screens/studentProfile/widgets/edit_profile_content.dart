import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reachout2/common/error_text.dart';
import 'package:reachout2/common/loader.dart';
import 'package:reachout2/features/auth/controller/auth_controller.dart';
import 'package:reachout2/features/user/user_controller.dart';
import 'package:reachout2/models/user_model.dart';
import 'package:reachout2/utils.dart';
// import ''

// import 'package:hackathon/constants/colors.dart';

// class StudentEditProfile extends ConsumerStatefulWidget {
//   const StudentEditProfile({super.key});

//   @override
//   ConsumerState<StudentEditProfile> createState() => _StudentEditProfileState();
// }

// class _StudentEditProfileState extends ConsumerState<StudentEditProfile> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           TextFormField(
//             decoration: InputDecoration(
//               label: Text(
//                 user!.name,
//                 style: TextStyle(color: Color(0xFF3AD4E1)),
//               ),
//               // hintText: "Name",
//               prefixIcon: const Icon(
//                 Icons.person_outline_outlined,
//                 color: Colors.black,
//               ),
//               border: OutlineInputBorder(
//                 borderSide: BorderSide(
//                   color: Color(0xFF3AD4E1),
//                 ),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderSide: BorderSide(
//                   color: Color(0xFF3AD4E1),
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           GestureDetector(
//             onTap: () {},
//             child: DottedBorder(
//               borderType: BorderType.RRect,
//               radius: const Radius.circular(12),
//               padding: const EdgeInsets.all(6),
//               child: ClipRRect(
//                 borderRadius: const BorderRadius.all(Radius.circular(12)),
//                 child: Container(
//                   height: 200,
//                   width: double.infinity,
//                   // color: Colors.amber,
//                   child: Center(
//                     child: Text(
//                       'Add New Profile Picture',
//                       style: TextStyle(
//                         color: Colors.grey.shade600,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 15,
//           ),
//           Container(
//             width: double.infinity,
//             height: 40,
//             child: ElevatedButton(
//               onPressed: () {},
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Color(0xFF3AD4E1),
//               ),
//               child: const Text(
//                 'Update',
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

class StudentEditProfile extends ConsumerStatefulWidget {
  // final String uid;

  const StudentEditProfile({
    super.key,
    // required this.uid,
  });

  @override
  ConsumerState createState() => _StudentEditProfileState();
}

class _StudentEditProfileState extends ConsumerState<StudentEditProfile> {
  File? profileFile;
  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  //
  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
  }

  void save(UserModel user) {
    ref.watch(userControllerProvider.notifier).editUser(
          user: user,
          profileFile: profileFile,
          context: context,
          name: _nameController.text.trim(),
        );
  }

  void selectProfileImage() async {
    final res = await pickImage();

    if (res != null) {
      setState(() {
        profileFile = File(res.files.first.path!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider);
    final isLoading = ref.watch(userControllerProvider);
    return ref.watch(getUserDataProvider(user!.uid)).when(
          data: (user) {
            return Container(
              child: isLoading
                  ? const Loader()
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            label: Text(
                              "Name",
                              style: TextStyle(color: Color(0xFF3AD4E1)),
                            ),
                            hintText: "Name",
                            prefixIcon: const Icon(
                              Icons.person_outline_outlined,
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF3AD4E1),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF3AD4E1),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () => selectProfileImage(),
                          child: DottedBorder(
                            borderType: BorderType.RRect,
                            dashPattern: const [10, 4],
                            strokeCap: StrokeCap.round,
                            radius: const Radius.circular(10),
                            color: Colors.black,
                            child: Container(
                              // width: double.infinity,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: profileFile != null
                                    ? Image.file(
                                        profileFile!,
                                        fit: BoxFit.fill,
                                      )
                                    : Image.network(
                                        user.profilePic,
                                        fit: BoxFit.fill,
                                      ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: double.infinity,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () => save(user),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF3AD4E1),
                            ),
                            child: const Text(
                              'Update',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
            );
          },
          error: (error, stackTrace) => ErrorText(error: error.toString()),
          loading: () => const Loader(),
        );
  }
}
