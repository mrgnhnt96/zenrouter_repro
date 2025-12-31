part of '../routes.dart';

class LibraryRoute extends _Stacked {
  LibraryRoute();

  @override
  late final _Routes _route = _Routes.library;

  @override
  _Stacks get _stacks => _Stacks.library;

  @override
  Uri toUri() => Uri.parse('/library');

  @override
  Widget build(AppCoordinator coordinator, BuildContext context) {
    final path = resolvePath(coordinator);

    return Scaffold(
      body: buildPath(coordinator),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'Books'),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Magazine',
          ),
        ],
        currentIndex: path.activeIndex,
        onTap: (index) {
          coordinator.push(path.stack[index]);
        },
      ),
    );
  }
}
