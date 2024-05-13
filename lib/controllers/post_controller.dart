import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:forumapp/constants/constants.dart';
import 'package:forumapp/models/comment_model.dart';
import 'package:forumapp/models/post_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class PostController extends GetxController {
  Rx<List<PostModel>> posts = Rx<List<PostModel>>([]);
  Rx<List<CommentModel>> comments = Rx<List<CommentModel>>([]);
  final isLoading = false.obs;
  final box = GetStorage();

  @override
  void onInit() {
    getAllPosts();
    super.onInit();
  }

  Future getAllPosts() async {
    try {
      isLoading.value = true;
      posts.value.clear();
      var response = await http.get(
        Uri.parse('$url/feeds'),
        headers: {
          'Accept': 'application',
          'Authorization': 'Bearer ${box.read('token')}',
        },
      );
      if (response.statusCode == 200) {
        isLoading.value = false;
        for (var item in json.decode(response.body)['feeds']) {
          posts.value.add(PostModel.fromJson(item));
        }
      } else {
        isLoading.value = false;
        // print(json.decode(response.body));
        Get.snackbar(
          'Error',
          json.decode(response.body)['message'],
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      isLoading.value = false;
      print(e.toString());
    }
  }

  Future createPost({
    required String content,
  }) async {
    try {
      var data = {
        'content': content,
      };
      var response = await http.post(
        Uri.parse('$url/feed/store'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${box.read('token')}',
          // 'Content-Type': 'application/json',
        },
        body: data,
      );
      if (response.statusCode == 201) {
        Get.snackbar(
          'Success',
          'Post created successfully',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        posts.value
            .insert(0, PostModel.fromJson(json.decode(response.body)['feed']));
      } else {
        // print(json.decode(response.body));
        Get.snackbar(
          'Error',
          json.decode(response.body)['message'],
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future getComments(id) async {
    try {
      isLoading.value = true;
      comments.value.clear();
      var response = await http.get(
        Uri.parse('$url/feed/comments/$id'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${box.read('token')}',
        },
      );
      if (response.statusCode == 200) {
        isLoading.value = false;
        final content = json.decode(response.body)['comments'];
        for (var item in content) {
          comments.value.add(CommentModel.fromJson(item));
        }
      } else {
        isLoading.value = false;
        print(json.decode(response.body));
        Get.snackbar(
          'Error',
          json.decode(response.body)['message'],
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future createComment(id, content) async {
    try {
      isLoading.value = true;
      var data = {
        'body': content,
      };
      var response = await http.post(
        Uri.parse('$url/feed/comment/$id'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${box.read('token')}',
        },
        body: data,
      );
      if (response.statusCode == 201) {
        isLoading.value = false;
        Get.snackbar(
          'Success',
          'Comment created successfully',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        comments.value.insert(
            0, CommentModel.fromJson(json.decode(response.body)['comment']));
      } else {
        isLoading.value = false;
        // print(json.decode(response.body));
        Get.snackbar(
          'Error',
          json.decode(response.body)['message'],
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future likeAndDislike(id) async {
    String res = '';
    try {
      isLoading.value = true;
      var response = await http.post(
        Uri.parse('$url/feed/like/$id'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${box.read('token')}',
        },
      );
      if (response.statusCode == 200 ||
          json.decode(response.body)['message'] == 'Liked') {
        isLoading.value = false;
        res = 'Liked';
        // print(json.decode(response.body));
      } else if (response.statusCode == 200 ||
          json.decode(response.body)['message'] == 'UnLiked') {
        res = 'UnLiked';
        isLoading.value = false;
        // print(json.decode(response.body));
      } else {
        isLoading.value = false;
        // print(json.decode(response.body));
      }
      return res;
    } catch (e) {
      print(e.toString());
    }
  }
}
