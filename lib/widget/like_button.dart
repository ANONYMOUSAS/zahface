import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:zahface/API/apis.dart';
import 'package:zahface/utills/common.dart';

class LikeButton extends StatefulWidget {
  final dynamic postId;

  const LikeButton({Key? key, required this.postId}) : super(key: key);

  @override
  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool isLiked = false;
  int likesCount = 0;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    print(widget.postId);
    fetchLikes();
  }

  // Fetch like status and count from the API
  Future<void> fetchLikes() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/post/${widget.postId}/like'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);
        setState(() {
          likesCount = data['likes'].length;
          isLiked = data['likes'].any((like) => like['userId'] == userId);
        });
      } else {
        print('Failed to fetch likes. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching likes: $e');
    }
  }



// Handle like/unlike action
  Future<void> handleLike() async {
    if (isLoading) return;

    setState(() {
      isLoading = true;
    });

    try {
      if (isLiked) {
        // Unlike the post
        final response = await http.delete(
          Uri.parse('$baseUrl/post/${widget.postId}/like'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        );
        if (response.statusCode == 200) {
          setState(() {
            likesCount -= 1;
            isLiked = false;
          });
        }
      } else {
        // Like the post
        final response = await http.post(
          Uri.parse('$baseUrl/post/${widget.postId}/like'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        );
        if (response.statusCode == 200) {
          setState(() {
            likesCount += 1;
            isLiked = true;
          });
        }
      }
    } catch (e) {
      print('Error handling like/unlike: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(isLiked ? Icons.favorite : Icons.favorite_border),
          onPressed: handleLike,
        ),
        Text('$likesCount Likes'),
      ],
    );
  }
}
