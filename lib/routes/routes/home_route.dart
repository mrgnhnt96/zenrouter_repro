part of '../routes.dart';

class HomeRoute extends AppRoute {
  HomeRoute();

  @override
  Widget build(coordinator, context) => const HomeScreen();

  @override
  Uri toUri() => Uri.parse('/home');

  @override
  late final _Routes _route = _Routes.home;
}
