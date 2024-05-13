import 'package:flutter/material.dart';
import 'package:forumapp/controllers/post_controller.dart';
import 'package:forumapp/models/post_model.dart';
import 'package:forumapp/views/widgets/input_field.dart';
import 'package:forumapp/views/widgets/post_data.dart';
import 'package:get/get.dart';

class PostDetails extends StatefulWidget {
  const PostDetails({super.key, required this.post});

  final PostModel post;

  @override
  State<PostDetails> createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  final TextEditingController _commentController = TextEditingController();
  final PostController _postController = Get.put(PostController());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _postController.getComments(widget.post.id!);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(widget.post.user!.name!),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: PostData(post: widget.post),
              ),
              const SizedBox(height: 10),
              SizedBox(
                  width: double.infinity,
                  height: 500,
                  child: Obx( () {
                      return _postController.isLoading.value
                          ? const Center(child: CircularProgressIndicator())
                          : ListView.builder(
                          shrinkWrap: true,
                          itemCount: _postController.comments.value.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(_postController.comments.value[index].user!.name!),
                              subtitle: Text(_postController.comments.value[index].body!),
                            );
                          });
                    }
                  )),
              InputWidget(
                hintText: 'Write a comment...',
                controller: _commentController,
                obscureText: false,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 60,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                onPressed: () async {
                  await _postController.createComment(
                    widget.post.id!,
                    _commentController.text.trim(),
                  );
                  _commentController.clear();
                  _postController.getComments(widget.post.id!);
                },
                child: const Text('Comment'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
