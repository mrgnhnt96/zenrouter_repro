part of '../routes.dart';

class IndexRoute extends AppRoute with RouteRedirect<AppRoute> {
  IndexRoute();

  @override
  late final _Routes _route = _Routes.none;

  @override
  AppRoute? redirect() {
    return HomeRoute();
  }

  @override
  Widget build(coordinator, context) {
    return const SizedBox.shrink();
  }

  @override
  Uri toUri() => Uri.parse('/');
}
