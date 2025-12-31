part of '../routes.dart';

sealed class AppRoute extends RouteTarget with RouteUnique {
  static HomeRoute get home => HomeRoute();
  static LibraryRoute get library => LibraryRoute();

  _Routes get _route;
}
