import 'package:flutter/material.dart';
import '/controllers/post_controller.dart';
import '/views/profile_drawer.dart';
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
  final ScrollController _scrollController = ScrollController();
  Color _appBarBackgroundColor = const Color.fromARGB(255, 39, 39, 39);
  bool _showAppBarText = true;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset >= 100) {
        // Adjust this value as needed
        // Change app bar style to white background and remove text
        setState(() {
          _appBarBackgroundColor = Colors.white;
          _showAppBarText = false;
        });
      } else {
        // Reset app bar style
        setState(() {
          _appBarBackgroundColor = const Color.fromARGB(255, 39, 39, 39);
          _showAppBarText = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: _appBarBackgroundColor,
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 1,
                        color: const Color.fromARGB(255, 161, 161, 161),
                      ),
                      color: _appBarBackgroundColor,
                    ),
                    padding: const EdgeInsets.all(4),
                    child: Container(
                      height: 35,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                      ),
                      child: IconButton(
                        iconSize: 20,
                        icon: const Icon(Icons.person),
                        color: Colors.white,
                        onPressed: () {
                          openDrawer();
                          goToProfilePage();
                        },
                      ),
                    ),
                  ),
                ],
              ),
              if (_showAppBarText)
                const Column(
                  children: [
                    Text('Forum App', style: TextStyle(color: Colors.white)),
                    Text('Post your feeds',
                        style: TextStyle(color: Colors.white, fontSize: 12)),
                  ],
                ),
              if (!_showAppBarText)
                const Text('Forum App', style: TextStyle(color: Colors.black)),
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 1,
                        color: const Color.fromARGB(255, 161, 161, 161),
                      ),
                      color: _appBarBackgroundColor,
                    ),
                    padding: const EdgeInsets.all(4),
                    child: Container(
                      height: 35,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                      ),
                      child: IconButton(
                        iconSize: 20,
                        icon: const Icon(Icons.person),
                        color: Colors.white,
                        onPressed: () {
                          openDrawer();
                          goToProfilePage();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          backgroundColor: _appBarBackgroundColor,
          elevation: 0,
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1), // Height of the border
            child: Container(
              decoration:  BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: _showAppBarText ? const Color.fromARGB(0, 0, 0, 0).withOpacity(0) : Colors.grey, // Color of the border
                    width: _showAppBarText ? 0 : 1, // Width of the border
                  ),
                ),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          controller: _scrollController,
          child: Container(
            margin: const EdgeInsets.only(top: 10),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                )),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PostField(
                        hintText: 'What do you want to ask?',
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
                        child: Obx(() {
                          return _postController.isLoading.value
                              ? const CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white),
                                )
                              : const Text('Post',
                                  style: TextStyle(color: Colors.white));
                        }),
                      ),
                      const SizedBox(height: 10),
                      const Text('Recent Posts',
                          style: TextStyle(fontSize: 20)),
                      const SizedBox(height: 10),
                      Obx(() {
                        return _postController.isLoading.value
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context)
                                        .size
                                        .height, // Set a specific height
                                    child: ListView.separated(
                                      itemBuilder: (context, index) =>
                                          const Skelton(
                                        height: 150,
                                        width: double.infinity,
                                      ),
                                      separatorBuilder: (context, index) =>
                                          const SizedBox(height: 10),
                                      itemCount: 5,
                                    ),
                                  ),
                                ],
                              )
                            : ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: _postController.posts.value.length,
                                itemBuilder: (context, index) {
                                  return PostData(
                                    post: _postController.posts.value[index],
                                  );
                                });
                      })
                    ]),
              ),
            ),
          ),
        ));
  }

  void openDrawer() {
    _scaffoldKey.currentState!.openDrawer();
  }

  void goToProfilePage() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const ProfileDrawer(),
    ));
  }
}

class Skelton extends StatelessWidget {
  const Skelton({
    super.key,
    this.height,
    this.width,
  });

  final double? height, width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      // margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.04),
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
