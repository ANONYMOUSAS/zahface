import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../API/apis.dart';

class LikeProvider with ChangeNotifier {
  bool _isLiked = false;
  int _likesCount = 0;

  bool get isLiked => _isLiked;
  int get likesCount => _likesCount;

  // Set the initial values
  void setLikeData(bool isLiked, int likesCount) {
    _isLiked = isLiked;
    _likesCount = likesCount;
    notifyListeners();
  }


  // Fetch like status and count from the API
  Future<void> fetchLikes(String postId, String token, String userId) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/post/$postId/like'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);
        _likesCount = data['likes'].length;
        _isLiked = data['likes'].any((like) => like['userId'] == userId);
        notifyListeners();
      } else {
        print('Failed to fetch likes. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching likes: $e');
    }
  }
}
