import 'package:flutter/material.dart';
import 'package:forumapp/controllers/post_controller.dart';
import 'package:forumapp/models/post_model.dart';
import 'package:forumapp/views/post_detials.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


class PostData extends StatefulWidget {
  const PostData({
    super.key,
    required this.post,
  });

  final PostModel post;

  @override
  State<PostData> createState() => _PostDataState();
}

class _PostDataState extends State<PostData> {
  final PostController _postController = Get.put(PostController());
  Color likedPost = Colors.blue;
  Color unLikedPost = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      // constraints: const BoxConstraints(minHeight: 100, maxHeight: 150), // Set min and max height here
      // height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.post.user!.name!,
                  style: GoogleFonts.poppins(),
                ),
                Text(
                  widget.post.user!.email!,
                  style: GoogleFonts.poppins(fontSize: 10),
                ),
                // const SizedBox(height: 10),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.post.content!,
                  style: GoogleFonts.poppins(),
                ),
                Row(
            children: [
              IconButton(
                onPressed: () async {
                  await _postController.likeAndDislike(widget.post.id!);
                  _postController.getAllPosts();
                },
                icon: Icon(Icons.thumb_up,
                    color: widget.post.liked! ? likedPost : unLikedPost),
              ),
              IconButton(
                onPressed: () {
                  Get.to(() => PostDetails(
                        post: widget.post,
                      ));
                },
                icon: const Icon(Icons.message),
              ),
            ],
                        ),
              ],
            ),
          ),
         
        ],
      ),
    );
  }
}
