part of '../routes.dart';

enum _Routes {
  none,
  home,
  library,
  magazine,
  books,
  book,
  notFound;

  const _Routes();

  AppRoute? matches(List<String> segments) {
    switch ((this, segments)) {
      case (none, []):
        return IndexRoute();

      case (home, ['home']):
        return HomeRoute();

      case (library, ['library']):
        return LibraryRoute();

      case (magazine, ['magazine']):
        return MagazineRoute();

      case (books, ['library', 'books']):
        return BooksRoute();

      case (book, ['library', 'books', final String id]):
        return BookRoute(id);

      case (notFound, _):
        return NotFoundRoute();
    }

    return null;
  }
}
