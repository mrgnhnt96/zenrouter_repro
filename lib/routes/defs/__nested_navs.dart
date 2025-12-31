part of '../routes.dart';

enum _NestedNavs {
  books,
  magazine;

  const _NestedNavs();

  Type get type => switch (this) {
    books => BooksRoute,
    magazine => MagazineRoute,
  };

  _Stacks get stacks => switch (this) {
    books => _Stacks.library,
    magazine => _Stacks.library,
  };

  _Nested Function() get create => switch (this) {
    books => BooksRoute.new,
    magazine => MagazineRoute.new,
  };

  static Map<_NestedNavs, StackPath<AppRoute>> _stacks = {};
  T stack<T extends StackPath<AppRoute>>(AppCoordinator coordinator) {
    if (_stacks[this] case final stack?) {
      assert(stack is T, 'Stack for $this is not of type $T');
      return stack as T;
    }

    final StackPath<AppRoute> newStack = switch (this) {
      books => NavigationPath.createWith(
        coordinator: coordinator,
        label: 'books',
      ),
      magazine => NavigationPath.createWith(
        coordinator: coordinator,
        label: 'magazine',
      ),
    };

    assert(newStack is T, 'Stack for $this is not of type $T');

    return _stacks[this] = newStack as T;
  }
}
