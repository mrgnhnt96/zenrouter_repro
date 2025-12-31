part of '../routes.dart';

class MagazineRoute extends _Nested {
  MagazineRoute();

  @override
  Type get layout => LibraryRoute;

  @override
  Widget build(coordinator, context) => const MagazineScreen();

  @override
  Uri toUri() => Uri.parse('/magazine');

  @override
  late final _Routes _route = _Routes.magazine;

  @override
  _NestedNavs get _nestedNavs => _NestedNavs.magazine;
}
