import 'dart:io';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../API/apis.dart';
import '../API/auth_service.dart';
import '../utills/common.dart';

class PostProvider with ChangeNotifier {
  List<dynamic> _posts = [];
  bool _isLoading = false;

  List<dynamic> get posts => _posts;
  bool get isLoading => _isLoading;

  final Dio _dio = ApiService().dio;

  Future<void> fetchPosts() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await _dio.get(
        '$baseUrl/posts',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'withCredentials': 'true',
          },
        ),
      );
      _posts = response.data['posts'] as List<dynamic>;

      // Print the total number of posts
      print("Total posts: ${_posts.length}");
    } catch (error) {
      print("Error fetching posts: $error");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }


  Future<String?> sharePost({
    required String desc,
    File? imageFile,
    File? audioFile,
    required Function(List<dynamic> posts) updatePosts,
  }) async {
    if (desc.isEmpty) return "Description cannot be empty";

    final formData = FormData();
    formData.fields.add(MapEntry('desc', desc));

    if (imageFile != null) {
      formData.files.add(MapEntry(
        'post',
        await MultipartFile.fromFile(
          imageFile.path,
          filename: imageFile.path.split('/').last,
        ),
      ));
    }

    if (audioFile != null) {
      formData.files.add(MapEntry(
        'audio',
        await MultipartFile.fromFile(
          audioFile.path,
          filename: audioFile.path.split('/').last,
        ),
      ));
    }

    try {
      // Send post request
      await _dio.post(
        imageFile == null
            ? '$baseUrl/audio/new'
            : '$baseUrl/post/new',
        data: formData,
        options: Options(
          headers: {
            'Content-Type': 'multipart/form-data',
            'Authorization': 'Bearer $token',
            'withCredentials': 'true',
          },
        ),
      );

      // Fetch updated posts after sharing
      await fetchPosts();  // This will refresh the posts in your provider
      updatePosts(_posts);  // Update the UI with the latest posts

      return null;  // No error
    } catch (error) {
      print("Error sharing post: $error");
      return "Failed to share content";  // Return an error message
    }
  }

}
