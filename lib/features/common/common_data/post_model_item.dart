import 'package:ri_stream/utils/assets_path.dart';

class PostModelItem {
  final String userName;
  final String userImage;
  final String backgroundImage;
  final String title;
  final String subtitle;
  final int likes;
  final int comments;
  final int views;

  PostModelItem({
    required this.userName,
    required this.userImage,
    required this.backgroundImage,
    required this.title,
    required this.subtitle,
    required this.likes,
    required this.comments,
    required this.views,
  });
}





final List<PostModelItem> demoPostList = [
  PostModelItem(
    userName: "Rimu Akter",
    userImage: AssetsPath.logo,
    backgroundImage: "assets/images/live_back_image1.jpg",
    title: "Morning Vibes 🌅",
    subtitle: "Starting my day with some fresh air!",
    likes: 1200,
    comments: 80,
    views: 2500,
  ),
  PostModelItem(
    userName: "Jannat Tuli",
    userImage: AssetsPath.logo,
    backgroundImage: "assets/images/live_back_image1.jpg",
    title: "Travel Mood 🏞️",
    subtitle: "Exploring new places with friends.",
    likes: 980,
    comments: 55,
    views: 1890,
  ),
  PostModelItem(
    userName: "Arif Khan",
    userImage: AssetsPath.logo,
    backgroundImage: "assets/images/live_back_image1.jpg",
    title: "Workout Time 💪",
    subtitle: "Stay strong, stay consistent.",
    likes: 2450,
    comments: 190,
    views: 5600,
  ),
];
