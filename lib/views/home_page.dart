import 'package:flutter/material.dart';
import 'package:forumapp/controllers/post_controller.dart';
import 'package:get/get.dart';
import 'widgets/post_field.dart';
import 'widgets/post_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PostController _postController = Get.put(PostController());
  final TextEditingController _textController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forum App', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            PostField(
              hintText:  'What do you want to ask?',
              controller: _textController,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                elevation: 0,
                padding: const EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 10,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              onPressed: () async {
                await _postController.createPost(
                  content: _textController.text.trim(),
                );
                _textController.clear();
                _postController.getAllPosts();
              },
              child: Obx( () {
                  return _postController.isLoading.value
                      ? const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      )
                      : const Text('Post' , style: TextStyle(color: Colors.white));
                }
              ),
            ),
            const SizedBox(height: 10),
            const Text('Recent Posts', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 10),
            Obx(() {
                return _postController.isLoading.value
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _postController.posts.value.length,
                        itemBuilder: (context, index) {
                          return PostData(
                            post: _postController.posts.value[index],
                          );
              }
            );
            })
            ] ),
        ),
      )
    );  
  }
}
