import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:intl/intl.dart';
import 'package:just_audio/just_audio.dart';
import 'package:zahface/API/apis.dart';

import '../API/auth_service.dart';
import '../providers/post_providers.dart';
import '../utills/common.dart';
import '../widget/audio_player_widget.dart';
import '../widget/like_button.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showFooter = false;
  bool showShare = false;
  List<dynamic> _posts = [];

  String desc = "";
  File? imageFile;
  File? audioFile;
  late AudioPlayer audioPlayer;

  dynamic file;
  dynamic selectedFile;
  bool sound = false;

  File? _file;
  File? _selectedFile;
  bool _isLoading = false;
  final TextEditingController _descController = TextEditingController();

  final ApiService _apiService = ApiService();

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final postProvider = Provider.of<PostProvider>(context, listen: false);
      postProvider.fetchPosts();
    });
  }




  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }


  void handleToggleShare() {
    setState(() {
      showShare = !showShare;
    });
  }


  Future<void> _pickFile(bool isAudio) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        if (isAudio) {
          _selectedFile = File(pickedFile.path);
        } else {
          _file = File(pickedFile.path);
        }
      });
    }
  }

  Future<void> _share() async {
    if (!mounted) return;

    final postProvider = Provider.of<PostProvider>(context, listen: false);
    setState(() => _isLoading = true);

    final error = await postProvider.sharePost(
      desc: _descController.text,
      imageFile: _file,
      audioFile: _selectedFile,
      updatePosts: (posts) {
        if (mounted) {
          setState(() => _posts = posts);  // Update posts immediately
        }
      },
    );

    if (mounted) {
      // Show success or error message based on result
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(/*error ?? */"Shared successfully!")),
      );

      setState(() {
        _isLoading = false;
        _descController.clear();
        _file = null;
        _selectedFile = null;
      });
    }
  }

  /*Future<String?> handleShare({required String desc, File? file, File? selectedFile,}) async {
    try {
      if (desc.isEmpty) {
        return "Description cannot be empty";
      }

      final formData = FormData();
      formData.fields.add(MapEntry('desc', desc));

      if (file != null) {
        formData.files.add(MapEntry(
          'post',
          await MultipartFile.fromFile(
            file.path,
            filename: file.path.split('/').last,
          ),
        ));
      }

      if (selectedFile != null) {
        formData.files.add(MapEntry(
          'audio',
          await MultipartFile.fromFile(
            selectedFile.path,
            filename: selectedFile.path.split('/').last,
          ),
        ));
      }

      final Dio dio = _apiService.dio;

      // Assuming you have a function to get the auth token
      if (token == null) {
        return 'Unauthorized: No valid token found';
      }

      try {
        // Post request for image or audio
        if (selectedFile == null) {
          await dio.post(
            '$baseUrl/post/new',
            data: formData,
            options: Options(
              headers: {
                'Content-Type': 'multipart/form-data',
                'Authorization': 'Bearer $token',
              },
            ),
          );
        } else {
          await dio.post(
            '$baseUrl/audio/new',
            data: formData,
            options: Options(
              headers: {
                'Content-Type': 'multipart/form-data',
                'Authorization': 'Bearer $token',
              },
            ),
          );
        }

        // Fetch updated posts using PostProvider
        final postProvider = Provider.of<PostProvider>(context, listen: false);
        await postProvider.fetchPosts();  // Refresh posts after sharing

        return null;
      } catch (error) {
        print('Error occurred while uploading: $error');
        return 'Failed to share content';
      }
    } catch (err) {
      print('Error occurred: $err');
      return 'An unexpected error occurred';
    }
  }*/


  /*Future<String?> handleShare({
    required String desc,
    File? file,
    File? selectedFile,
    required Function(List<dynamic> posts) updatePosts,
  }) async {
    try {
      if (desc.isEmpty) {
        return "Description cannot be empty";
      }

      final formData = FormData();
      formData.fields.add(MapEntry('desc', desc));

      if (file != null) {
        formData.files.add(MapEntry(
          'post',
          await MultipartFile.fromFile(
            file.path,
            filename: file.path.split('/').last,
          ),
        ));
      }

      if (selectedFile != null) {
        formData.files.add(MapEntry(
          'audio',
          await MultipartFile.fromFile(
            selectedFile.path,
            filename: selectedFile.path.split('/').last,
          ),
        ));
      }

      final Dio dio = _apiService.dio;

      // Assuming you have a function to get the auth token
      if (token == null) {
        return 'Unauthorized: No valid token found';
      }

      try {
        if (selectedFile == null) {
          await dio.post(
            '$baseUrl/post/new',
            data: formData,
            options: Options(
              headers: {
                'Content-Type': 'multipart/form-data',
                'Authorization': 'Bearer $token',
              },
            ),
          );
        } else {
          await dio.post(
            '$baseUrl/audio/new',
            data: formData,
            options: Options(
              headers: {
                'Content-Type': 'multipart/form-data',
                'Authorization': 'Bearer $token',
              },
            ),
          );
        }

        // Fetch updated posts
        final response = await dio.get('$baseUrl/posts', options: Options(
            headers: {
              'Authorization': 'Bearer $token',
            }
        ));

        final posts = response.data['posts'] as List<dynamic>;
        updatePosts(posts);

        return null;
      } catch (error) {
        print('Error occurred while uploading: $error');
        return 'Failed to share content';
      }
    } catch (err) {
      print('Error occurred: $err');
      return 'An unexpected error occurred';
    }
  }*/


  Future<void> playAudio() async {
    if (audioFile != null) {
      try {
        await audioPlayer.setFilePath(audioFile!.path);
        audioPlayer.play();
      } catch (e) {
        print("Error playing audio: $e");
      }
    }
  }

  Future<void> stopAudio() async {
    await audioPlayer.stop();
  }

  @override
  Widget build(BuildContext context) {
    final postProvider = Provider.of<PostProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSecondary,
      appBar:AppBar(
        backgroundColor: Theme.of(context).colorScheme.onSecondary,
        title: Image.asset(
          'assets/images/logo.png',
          height: 40,
        ),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)
              ),
              backgroundColor: Colors.green,
              foregroundColor: white,
            ),
              onPressed: (){
              _apiService.handleLogout(context);
              },
              child: Text("Photos", style: TextStyle(fontWeight: FontWeight.bold),))
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 30.0,),
          // Share Section
            Visibility(
              visible: showShare,
              child: Card(
                color: white,
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _descController,
                              onChanged: (text) => setState(() => desc = text),
                              decoration: InputDecoration(
                                hintText: "Hello $username!",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0)
                                ),
                              ),
                            ),
                          ),
                          if (file != null)
                            Image.network(
                              file,
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                          if (selectedFile != null)
                            IconButton(
                              icon: Icon(sound ? Icons.pause_circle : Icons.play_circle_outline),
                              onPressed: () => setState(() => sound = !sound),
                            ),
                        ],
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.image_outlined),
                                onPressed:() => _pickFile(false),
                              ),
                              IconButton(
                                icon: const Icon(Icons.location_on_outlined),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: const Icon(Icons.music_note_outlined),
                                onPressed: () => _pickFile(true),
                              ),
                            ],
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)
                              )
                            ),
                            onPressed: (){
                              if(_descController.text.isEmpty){
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text("Description cannot be empty")),
                                );
                              } else{
                                _isLoading ? null : _share();
                              }
                            },
                            child: _isLoading
                                ? const CircularProgressIndicator()
                                : const Text("Share"),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),

          // Add Button
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)
              ),
              backgroundColor: mainColor,
              foregroundColor: white,
            ),
            onPressed: handleToggleShare,
            child: Text("Add", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
          ),

          // Post List
          Expanded(
            child: postProvider.isLoading
                ? const Center(child: CircularProgressIndicator())
                : postProvider.posts.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
              itemCount: postProvider.posts.length,
              itemBuilder: (context, index) {
                // Reverse the list so that the latest post appears first
                final post = postProvider.posts.reversed.toList()[index];
                return _buildPostCard(post);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPostCard(dynamic post) {
    final user = post['userId'];
    final postId = post['_id'];
    final postCreatedAt = DateTime.parse(post['createdAt']);
    final formattedTime = timeago.format(postCreatedAt);

    return Card(
      color: white,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Info Section
            Row(
              children: [
                // Profile picture with placeholder
                CircleAvatar(
                  backgroundImage: user['profilePic']?['url'] != null
                      ? CachedNetworkImageProvider(user['profilePic']['url'] ?? '')
                      : null,
                  radius: 25,
                  child: user['profilePic']?['url'] == null
                      ? const Icon(Icons.person, color: Colors.white)
                      : null,
                ),
                const SizedBox(width: 12),
                // Name section with truncation if too long
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user['name'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        overflow: TextOverflow.ellipsis, // Truncate long names
                      ),
                      Text(
                        formattedTime,  // Display timeago formatted time
                        style: const TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Post Description
            Text(
              post['desc'] ?? '',
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width > 600 ? 18 : 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),

            // Post Images
            if (post['images'] != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl: post['images']['url'] ?? '',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),

            // Post Audio
            if (post['audio'] != null)
              AudioPlayerWidget(audioUrl: post['audio']['url']),

            // Like and Comment Section
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LikeButton(postId: postId),
                TextButton(
                  onPressed: () {
                    // Open comments section
                  },
                  child: const Text('Comments', style: TextStyle(fontWeight: FontWeight.w600)),
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );;
  }

}
