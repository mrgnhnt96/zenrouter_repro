part of 'routes.dart';

class AppCoordinator extends Coordinator<AppRoute>
    with CoordinatorDebug<AppRoute> {
  AppCoordinator();

  @override
  AppRoute parseRouteFromUri(Uri uri) {
    final segments = uri.pathSegments;

    for (final route in _Routes.values) {
      if (route.matches(segments) case final route?) {
        return route;
      }
    }

    return NotFoundRoute._uri(uri);
  }

  @override
  List<StackPath<RouteTarget>> get paths {
    return [
      root,
      for (final stack in _Stacks.values) stack.stack(this),
      for (final nested in _NestedNavs.values) nested.stack(this),
    ];
  }

  @override
  void defineLayout() {
    for (final stack in _Stacks.values) {
      RouteLayout.defineLayout(stack.type, stack.create);
    }

    for (final nested in _NestedNavs.values) {
      RouteLayout.defineLayout(nested.type, nested.create);
    }
  }
}

final coordinator = AppCoordinator();
