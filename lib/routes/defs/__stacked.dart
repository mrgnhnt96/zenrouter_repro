part of '../routes.dart';

abstract class _Stacked extends AppRoute with RouteLayout<AppRoute> {
  @nonVirtual
  @override
  Type? get layout => null;

  @nonVirtual
  @override
  IndexedStackPath<AppRoute> resolvePath(AppCoordinator coordinator) =>
      _stacks.stack(coordinator);

  _Stacks get _stacks;
}

abstract class _Nested extends AppRoute with RouteLayout<AppRoute> {
  @override
  Type get layout;

  @nonVirtual
  @override
  NavigationPath<AppRoute> resolvePath(AppCoordinator coordinator) =>
      _nestedNavs.stack(coordinator);

  _NestedNavs get _nestedNavs;
}
