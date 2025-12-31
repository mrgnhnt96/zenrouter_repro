part of '../routes.dart';

class BooksRoute extends _Nested {
  BooksRoute();

  @override
  Type get layout => LibraryRoute;

  @override
  Widget build(coordinator, context) => const BooksScreen();

  @override
  Uri toUri() => Uri.parse('/library/books');

  @override
  late final _Routes _route = _Routes.books;

  @override
  _NestedNavs get _nestedNavs => _NestedNavs.books;
}
