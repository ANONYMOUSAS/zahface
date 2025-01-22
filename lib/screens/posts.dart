// import 'package:flutter/material.dart';
// import 'package:flutter_audio_query/flutter_audio_query.dart';
// import 'package:audio_service/audio_service.dart';
//
// class PostScreen extends StatefulWidget {
//   final Post post;
//   PostScreen({required this.post});
//
//   @override
//   _PostScreenState createState() => _PostScreenState();
// }
//
// class _PostScreenState extends State<PostScreen> {
//   int likes = 0;
//   bool liked = false;
//   bool isLoading = false;
//   bool commentOpen = false;
//   bool showButtons = true;
//   bool isPlaying = false;
//   double position = 0;
//   double duration = 0;
//
//   late AudioPlayer audioPlayer; // Using audio player for handling audio
//
//   @override
//   void initState() {
//     super.initState();
//     // Initialize audio player
//     audioPlayer = AudioPlayer();
//     fetchLikes();
//   }
//
//   Future<void> fetchLikes() async {
//     // Fetch likes from API (just a placeholder function)
//     setState(() {
//       likes = widget.post.likes.length; // Assuming 'likes' is a List
//       liked = widget.post.likes.contains('userId'); // Check if the user liked the post
//     });
//   }
//
//   void handleLike() {
//     if (isLoading) return;
//     setState(() {
//       isLoading = true;
//     });
//
//     if (liked) {
//       // Simulate API call to unlike the post
//       setState(() {
//         likes--;
//         liked = false;
//       });
//     } else {
//       // Simulate API call to like the post
//       setState(() {
//         likes++;
//         liked = true;
//       });
//     }
//
//     setState(() {
//       isLoading = false;
//     });
//   }
//
//   Future<void> playAudio() async {
//     setState(() {
//       isPlaying = true;
//     });
//     // Play the audio (just a placeholder logic)
//     await audioPlayer.play(widget.post.audioUrl); // Assuming audioUrl exists in the post model
//   }
//
//   Future<void> pauseAudio() async {
//     setState(() {
//       isPlaying = false;
//     });
//     // Pause the audio
//     await audioPlayer.pause();
//   }
//
//   void commentSection(String postId) {
//     setState(() {
//       commentOpen = !commentOpen;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView.builder(
//         itemCount: 1, // Just one post here
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // User Info
//                 Row(
//                   children: [
//                     CircleAvatar(
//                       backgroundImage: NetworkImage(widget.post.userProfilePic),
//                     ),
//                     SizedBox(width: 10),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(widget.post.userName, style: TextStyle(fontWeight: FontWeight.bold)),
//                         Text(widget.post.createdAt, style: TextStyle(color: Colors.grey)),
//                       ],
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 10),
//
//                 // Post Description
//                 Text(widget.post.desc),
//                 SizedBox(height: 10),
//
//                 // Post Image
//                 widget.post.image != null
//                     ? Image.network(widget.post.image)
//                     : Container(),
//
//                 // Audio Player Controls
//                 if (widget.post.audioUrl != null) ...[
//                   Row(
//                     children: [
//                       IconButton(
//                         icon: Icon(isPlaying ? Icons.pause_circle_filled : Icons.play_circle_filled),
//                         onPressed: isPlaying ? pauseAudio : playAudio,
//                       ),
//                       Text("${position.toStringAsFixed(0)}s / ${duration.toStringAsFixed(0)}s"),
//                     ],
//                   ),
//                 ],
//
//                 // View Button
//                 if (showButtons) ...[
//                   TextButton(
//                     onPressed: () {
//                       setState(() {
//                         showButtons = false;
//                       });
//                     },
//                     child: Row(
//                       children: [
//                         Text("View"),
//                         SizedBox(width: 10),
//                         Text("Likes: $likes"),
//                       ],
//                     ),
//                   ),
//                 ],
//
//                 // Like and Comment Section
//                 if (!showButtons) ...[
//                   Row(
//                     children: [
//                       TextButton(
//                         onPressed: handleLike,
//                         child: Text(liked ? "Liked ($likes)" : "Like ($likes)"),
//                       ),
//                       TextButton(
//                         onPressed: () => commentSection(widget.post.id),
//                         child: Text("Comments"),
//                       ),
//                     ],
//                   ),
//                   if (isLoading) CircularProgressIndicator(),
//                   if (commentOpen) CommentSection(postId: widget.post.id), // Assuming CommentSection is a widget
//                 ]
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
//
// class Post {
//   final String id;
//   final String userProfilePic;
//   final String userName;
//   final String createdAt;
//   final String desc;
//   final String? image;
//   final String? audioUrl;
//   final List likes;
//
//   Post({
//     required this.id,
//     required this.userProfilePic,
//     required this.userName,
//     required this.createdAt,
//     required this.desc,
//     this.image,
//     this.audioUrl,
//     required this.likes,
//   });
// }
//
// class CommentSection extends StatelessWidget {
//   final String postId;
//   CommentSection({required this.postId});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text("Comments for post: $postId"),
//         // Your comments UI here
//       ],
//     );
//   }
// }
