part of '../routes.dart';

class BookRoute extends AppRoute {
  BookRoute(this.id);

  final String id;

  @override
  Widget build(coordinator, context) => const BookScreen();

  @override
  Uri toUri() => Uri.parse('/library/books/$id');

  @override
  List<Object?> get props => [id];

  @override
  late final _Routes _route = _Routes.book;
}
