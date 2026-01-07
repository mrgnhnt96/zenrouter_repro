import 'dart:async';

import 'package:flutter/material.dart';
import 'package:zenrouter/zenrouter.dart';
import 'package:zenrouter_devtools/zenrouter_devtools.dart';

sealed class AppRoute extends RouteTarget with RouteUnique {}

class AppCoordinator extends Coordinator<AppRoute> with CoordinatorDebug {
  late final homeIndexed = IndexedStackPath<AppRoute>.createWith(
    [FeedLayout(), ProfileLayout()],
    coordinator: this,
    label: 'home',
  );
  late final feedNavigation = NavigationPath<AppRoute>.createWith(
    coordinator: this,
    label: 'feed',
  );
  late final profileNavigation = NavigationPath<AppRoute>.createWith(
    coordinator: this,
    label: 'profile',
  );

  /// IMPORTANT: You must register all your stack paths here!
  /// ZenRouter uses this list to manage navigation state and listeners.
  /// Don't forget to include the 'root' path which is provided by the Coordinator.
  @override
  List<StackPath<RouteTarget>> get paths => [
    root,
    homeIndexed,
    feedNavigation,
    profileNavigation,
  ];

  @override
  void defineLayout() {
    RouteLayout.defineLayout(HomeLayout, HomeLayout.new);
    RouteLayout.defineLayout(FeedLayout, FeedLayout.new);
    RouteLayout.defineLayout(ProfileLayout, ProfileLayout.new);
  }

  @override
  AppRoute parseRouteFromUri(Uri uri) {
    return switch (uri.pathSegments) {
      [] => _IndexRoute(),
      ['post'] => PostList(),
      ['post', final id] => PostDetail(id: id),
      ['profile'] => Profile(),
      ['settings'] => Settings(),
      _ => NotFound(uri: uri),
    };
  }
}

/// No matching route found
class NotFound extends AppRoute {
  NotFound({required this.uri});

  final Uri uri;

  @override
  Uri toUri() => uri;

  @override
  Widget build(AppCoordinator coordinator, BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Not Found')),
      body: Center(child: Text('Route not found: $uri')),
    );
  }
}

class PostList extends AppRoute {
  @override
  Uri toUri() => Uri.parse('/post');

  /// `PostList` will be rendered inside `FeedLayout`
  @override
  Type? get layout => FeedLayout;

  @override
  Widget build(AppCoordinator coordinator, BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: const Text('Post 1'),
          onTap: () => coordinator.push(PostDetail(id: '1')),
        ),
        ListTile(
          title: const Text('Post 2'),
          onTap: () => coordinator.push(PostDetail(id: '2')),
        ),
      ],
    );
  }
}

class PostDetail extends AppRoute {
  PostDetail({required this.id});

  final String id;

  /// `PostDetail` will be rendered inside `FeedLayout`
  /// Add this line in existing `PostDetail` route
  @override
  Type? get layout => FeedLayout;

  /// If the params has involved in `toUri` function, you must add it to `props`
  @override
  List<Object?> get props => [id];

  @override
  Uri toUri() => Uri.parse('/post/$id');

  @override
  Widget build(AppCoordinator coordinator, BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Post $id Detail')),
      body: Center(child: Text('Post ID: $id')),
    );
  }
}

class HomeLayout extends AppRoute with RouteLayout<AppRoute> {
  @override
  IndexedStackPath<AppRoute> resolvePath(AppCoordinator coordinator) =>
      coordinator.homeIndexed;

  @override
  Widget build(AppCoordinator coordinator, BuildContext context) {
    final path = resolvePath(coordinator);

    return Scaffold(
      body: buildPath(coordinator),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: path.activeIndex,
        onTap: (index) {
          coordinator.push(path.stack[index]);

          /// Ensure the selected tab is not empty
          switch (index) {
            case 0:
              if (coordinator.feedNavigation.stack.isEmpty) {
                coordinator.push(PostList());
              }
            case 1:
              if (coordinator.profileNavigation.stack.isEmpty) {
                coordinator.push(Profile());
              }
          }
        },
      ),
    );
  }
}

class FeedLayout extends AppRoute with RouteLayout<AppRoute> {
  @override
  NavigationPath<AppRoute> resolvePath(AppCoordinator coordinator) =>
      coordinator.feedNavigation;

  @override
  Type? get layout => HomeLayout;

  @override
  Widget build(AppCoordinator coordinator, BuildContext context) {
    return buildPath(coordinator);
  }
}

class ProfileLayout extends AppRoute with RouteLayout<AppRoute> {
  @override
  NavigationPath<AppRoute> resolvePath(AppCoordinator coordinator) =>
      coordinator.profileNavigation;

  @override
  Type? get layout => HomeLayout;

  @override
  Widget build(AppCoordinator coordinator, BuildContext context) {
    return buildPath(coordinator);
  }
}

class _IndexRoute extends AppRoute with RouteRedirect<AppRoute> {
  @override
  Uri toUri() => Uri.parse('/');

  @override
  FutureOr<AppRoute?> redirect() {
    return PostList();
  }

  @override
  Widget build(AppCoordinator coordinator, BuildContext context) {
    return const SizedBox.shrink();
  }
}

class Profile extends AppRoute {
  @override
  Uri toUri() => Uri.parse('/profile');

  /// `ProfileView` will be rendered inside `ProfileLayout`
  @override
  Type? get layout => ProfileLayout;

  @override
  Widget build(AppCoordinator coordinator, BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: ListView(
        children: [
          const ListTile(title: Text('Hello, User')),
          ListTile(
            title: const Text('Open Settings'),
            onTap: () => coordinator.push(Settings()),
            trailing: const Icon(Icons.chevron_right),
          ),
        ],
      ),
    );
  }
}

class Settings extends AppRoute {
  @override
  Uri toUri() => Uri.parse('/settings');

  /// `SettingsView` will be rendered inside `ProfileLayout`
  @override
  Type? get layout => ProfileLayout;

  @override
  Widget build(AppCoordinator coordinator, BuildContext context) {
    return const Center(child: Text('Settings View'));
  }
}

final coordinator = AppCoordinator();
