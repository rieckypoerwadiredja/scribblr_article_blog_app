import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:scribblr_article_blog_app/onboarding_screen.dart';
import 'package:scribblr_article_blog_app/page/article_screen.dart';
import 'package:scribblr_article_blog_app/page/bookmark_screen.dart';
import 'package:scribblr_article_blog_app/page/home_screen.dart';
import 'package:scribblr_article_blog_app/page/notification_screen.dart';
import 'package:scribblr_article_blog_app/page/writter_profile_screen.dart';
import 'package:scribblr_article_blog_app/splash_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/splash',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
        name: "splash",
        path: '/splash',
        builder: (context, state) => const SplashScreen()),
    GoRoute(
        name: "on-boarding",
        path: '/on-boarding',
        builder: (context, state) => const OnBoardingScreen()),
    GoRoute(
      name: "home",
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      name: "me",
      path: '/me',
      builder: (context, state) => const WritterProfileScreen(),
    ),
    GoRoute(
      name: "bookmarks",
      path: '/bookmarks',
      builder: (context, state) => const BookmarkScreen(),
    ),
    GoRoute(
      name: "notification",
      path: '/notification',
      builder: (context, state) => const NotificationScreen(),
    ),
    GoRoute(
      name: "writer",
      path: '/:name',
      builder: (context, state) => const WritterProfileScreen(),
    ),
    GoRoute(
      name: "article",
      path: '/:writer/:titleId', // path tetap boleh dipakai buat URL cantik
      builder: (context, state) {
        final titleId = state.pathParameters['titleId'] ?? '';
        final id = int.tryParse(titleId.split('-').last) ?? 0;
        return ArticleScreen(
          id: id,
        );
      },
    ),
  ],
);
