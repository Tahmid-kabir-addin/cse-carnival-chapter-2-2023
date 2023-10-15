import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reachout2/common/error_text.dart';
import 'package:reachout2/common/loader.dart';
import 'package:reachout2/features/auth/controller/auth_controller.dart';
import 'package:reachout2/features/home/controller/home_controller.dart';
import 'package:routemaster/routemaster.dart';

class PostDetailsTeacher extends ConsumerStatefulWidget {
  final String id;
  const PostDetailsTeacher({super.key, required this.id});

  @override
  ConsumerState<PostDetailsTeacher> createState() => _PostDetailsTeacherState();
}

class _PostDetailsTeacherState extends ConsumerState<PostDetailsTeacher> {
  bool isTapped = false;
  String title = "How Momentum Works?";
  String profilePicPath = "assets/images/image.jpg";
  String profileName = "Shibli Noman Sunny";
  String date = "Oct 15, 2023";
  String blogPicPath = "assets/images/homework1.png";
  String content =
      "In a world filled with technological marvels and scientific breakthroughs, we find ourselves at the crossroads of innovation and progress. The 21st century has brought us unprecedented opportunities and challenges, reshaping the way we live, work, and interact with one another. As we navigate this ever-changing landscape, one cannot help but marvel at the rapid advancements in information technology. The internet, a global network that connects billions of people, has transformed the way we access information, communicate, and conduct business. With a few clicks, we can explore the vast realms of human knowledge, connect with friends and family across the globe, or order groceries for delivery to our doorstep. Artificial intelligence, once the stuff of science fiction, has become an integral part of our daily lives. From virtual personal assistants that can answer our questions to self-driving cars that navigate our streets, AI is pushing the boundaries of what is possible. Machine learning algorithms can analyze vast datasets to make predictions and recommendations, revolutionizing industries like healthcare, finance, and entertainment. But with these advancements come ethical dilemmas and concerns. The collection and use of personal data have raised questions about privacy and surveillance. The potential for job displacement due to automation has led to discussions about the future of work. We must grapple with these complex issues as we harness the power of technology for the betterment of society. Meanwhile, the field of medicine continues to make remarkable strides. Gene editing technologies like CRISPR-Cas9 offer the potential to cure genetic diseases, while telemedicine allows patients to consult with healthcare professionals from the comfort of their homes. The COVID-19 pandemic accelerated the development of vaccines, demonstrating the global scientific community's ability to respond to crises. In the realm of space exploration, we stand on the brink of exciting new discoveries. Private companies are competing to send humans to Mars, and telescopes like the James Webb Space Telescope promise to unveil the mysteries of the cosmos. Our understanding of exoplanets and the search for extraterrestrial life have ignited our imagination and curiosity. Education, too, has undergone a transformation. Online learning platforms provide access to quality education for learners of all ages, regardless of geographic location. The traditional classroom is no longer the sole venue for acquiring knowledge, and the role of educators is evolving to meet the needs of digital learners. Cultural exchange and globalization have created a melting pot of ideas, languages, and traditions. Food, music, and art from every corner of the globe enrich our lives and broaden our perspectives. The ability to connect with people from different cultures fosters mutual understanding and empathy. Environmental concerns loom large in our collective consciousness. Climate change, deforestation, and pollution threaten the delicate balance of our planet. Sustainable practices and renewable energy sources offer hope for a more ecologically responsible future. We must take action to preserve our natural world for generations to come. In the midst of these grand narratives, it's essential not to lose sight of the simple joys of life. A walk in the park, a heartfelt conversation with a friend, or a warm cup of tea on a chilly morning can bring us profound happiness. It's in these small moments that we find meaning and connection. In conclusion, the world we inhabit is a complex tapestry of innovation, challenges, and beauty. As we march forward into the future, let us embrace the opportunities that lie ahead while remaining vigilant in addressing the issues that confront us. With wisdom, compassion, and a shared sense of purpose, we can shape a world that reflects our highest aspirations and values.";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Routemaster.of(context).pop(),
          child: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.black,
          ),
        ),
        elevation: 0,
        title: Text(
          "Post Details",
          style: const TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
      ),
      body: ref.watch(allPostsProvider).when(
          data: (data) {
            final post = data.map((e) {
              if (e.id == widget.id) return e;
            });
            for (var p in post) {
              if (p != null) {
                title = p.title;

                final user = ref.watch(getUserDataProvider(p.studentId));
                profileName = user.value!.name;
                profilePicPath = user.value!.profilePic;
                blogPicPath = p.banner;
                content = p.content;
              }
            }
            return Stack(children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: Text(
                        title,
                        overflow: TextOverflow.visible,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage: NetworkImage(profilePicPath),
                                  radius: 20,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      profileName,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      date,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: Image.network(blogPicPath),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.7,
                        child: SingleChildScrollView(
                          child: Text(
                            content,
                            overflow: TextOverflow.visible,
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () => Routemaster.of(context).push('/comments/${widget.id}'),
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFF3AD4E1),
                      // Set the border radius
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Spacer(),
                          Text(
                            "Comment",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 17),
                          ),
                          Spacer(),
                          Icon(Icons.send)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ]);

            // return Scaffold(

            //   body: ,
            // );
          },
          error: ((error, stackTrace) => ErrorText(error: error.toString())),
          loading: () => const Loader()),
    );
  }
}
