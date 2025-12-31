part of '../routes.dart';

enum _Stacks {
  library;

  const _Stacks();

  Type get type => switch (this) {
    library => LibraryRoute,
  };

  RouteLayout<AppRoute> Function() get create => switch (this) {
    library => LibraryRoute.new,
  };

  List<_NestedNavs> get nestedNavs {
    Iterable<_NestedNavs> values() sync* {
      for (final value in _NestedNavs.values) {
        if (value.stacks == this) {
          yield value;
        }
      }
    }

    return values().toList();
  }

  static Map<_Stacks, StackPath<AppRoute>> _stacks = {};
  T stack<T extends StackPath<AppRoute>>(AppCoordinator coordinator) {
    if (_stacks[this] case final stack?) {
      assert(stack is T, 'Stack for $this is not of type $T');
      return stack as T;
    }

    final StackPath<AppRoute> newStack = switch (this) {
      library => IndexedStackPath.createWith(
        [for (final nav in nestedNavs) nav.create()],
        coordinator: coordinator,
        label: 'library',
      ),
    };

    assert(newStack is T, 'Stack for $this is not of type $T');

    return _stacks[this] = newStack as T;
  }
}
