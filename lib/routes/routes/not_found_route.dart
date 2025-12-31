part of '../routes.dart';

class NotFoundRoute extends AppRoute {
  NotFoundRoute._uri(this._uri);
  NotFoundRoute() : _uri = Uri.parse('/not-found');

  final Uri _uri;

  @override
  Widget build(coordinator, context) => const NotFoundScreen();

  @override
  Uri toUri() => _uri;

  @override
  late final _Routes _route = _Routes.notFound;
}
