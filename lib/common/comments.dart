import 'package:flutter/material.dart';
import 'package:reachout2/common/widgets/comment_card.dart';
import 'package:reachout2/constants/colors.dart';
import 'package:reachout2/core/constants/constants.dart';
import 'package:routemaster/routemaster.dart';

class Comments extends StatefulWidget {
  final String id;
  const Comments({super.key, required this.id});

  @override
  State<Comments> createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  final _commentController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _commentController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Routemaster.of(context).pop(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: const Icon(
              Icons.keyboard_arrow_left,
              color: Colors.black,
            ),
          ),
        ),
        title: const Text(
          'Responses',
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
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                // width: double.infinity,
                height: MediaQuery.of(context).size.height - 220,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Colors.grey.withOpacity(0.5),
                  ),
                ),
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return commentCard(
                      imagePath: Constants.avatarDefault,
                      authorName: 'Nahid',
                      rootContext: context,
                      width: 150,
                      content: 'Hello This is a comment.',
                      upVoteCount: '115',
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 80,
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.grey.withOpacity(0.5),
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 120,
                      width: MediaQuery.of(context).size.width - 90,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: _commentController,
                          maxLines: null,
                          decoration: const InputDecoration(
                            hintText: 'What are your thoughts?',
                            border: InputBorder.none,
                          ),
                          keyboardType: TextInputType.multiline,
                          cursorWidth: 2,
                          cursorColor: Colors.grey,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 3, 0),
                      child: Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: primaryColor,
                        ),
                        child: const Icon(
                          Icons.send,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
