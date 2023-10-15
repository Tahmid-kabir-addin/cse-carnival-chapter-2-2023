import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:reachout2/constants/colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reachout2/features/auth/controller/auth_controller.dart';
import 'package:reachout2/features/user/user_controller.dart';
import 'package:reachout2/models/post_model.dart';
import 'package:reachout2/models/user_model.dart';
import 'package:reachout2/utils.dart';
import 'package:routemaster/routemaster.dart';

class PostQuestion extends ConsumerStatefulWidget {
  const PostQuestion({super.key});

  @override
  ConsumerState<PostQuestion> createState() => _PostQuestionState();
}

class _PostQuestionState extends ConsumerState<PostQuestion> {
  void dropdownCallback(String? selectedValue) {
    setState(() {
      _dropDownValue = selectedValue!;
    });
  }

  File? bannerFile;

  String _dropDownValue = 'Physics';

  final TextEditingController titleController = TextEditingController();
  final contentController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    contentController.dispose();
  }

  void save(UserModel user, BuildContext context) {
    ref.watch(userControllerProvider.notifier).createPost(
          context,
          titleController.text.trim(),
          contentController.text.trim(),
          bannerFile,
          user,
          _dropDownValue,
        );
  }

  void selectBannerImage() async {
    final res = await pickImage();

    if (res != null) {
      setState(() {
        bannerFile = File(res.files.first.path!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 5.0),
                child: Center(
                  child: Text(
                    'Any Doubt?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Choose Subject',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              DropdownButton(
                isExpanded: true,
                items: const [
                  DropdownMenuItem(
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        'Physics',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    value: 'Physics',
                  ),
                  DropdownMenuItem(
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        'Chemistry',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    value: 'Chemistry',
                  ),
                  DropdownMenuItem(
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        'Biology',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    value: 'Biology',
                  ),
                  DropdownMenuItem(
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        'Math',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    value: 'Math',
                  ),
                ],
                value: _dropDownValue,
                onChanged: dropdownCallback,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: titleController,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  label: Text(
                    "Title",
                    style: TextStyle(
                      color: primaryColor,
                    ),
                  ),
                  hintText: "Title",
                  prefixIcon: Icon(
                    Icons.draw,
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: primaryColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: primaryColor,
                    ),
                  ),
                ),
                maxLength: 30,
                maxLines: null,
                cursorColor: Colors.grey,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Doubt Content',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 180,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: contentController,
                    maxLines: null,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    keyboardType: TextInputType.multiline,
                    cursorWidth: 2,
                    cursorColor: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () => selectBannerImage(),
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
                      child: bannerFile != null
                          ? Image.file(
                              bannerFile!,
                              fit: BoxFit.fill,
                            )
                          : const Icon(Icons.camera_alt_outlined),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                  onPressed: () => save(user!, context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                  ),
                  child: const Text(
                    'Post',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
