import 'package:flutter/material.dart';

//! numbers Extension
extension AppNumberExtension on num {
  //****************  borderRadius ****************** */
  BorderRadius get allBorderRadius => BorderRadius.circular(toDouble());
  //************ Padding *********************/
  EdgeInsets get allPadding => EdgeInsets.all(toDouble());
  BorderRadius get bottomBorderRadius =>
      BorderRadius.vertical(bottom: Radius.circular(toDouble()));

  Widget get horizontalSizedBox => SizedBox(width: toDouble());
  EdgeInsets get hPadding => EdgeInsets.symmetric(horizontal: toDouble());

  BorderRadius get topBorderRadius =>
      BorderRadius.vertical(top: Radius.circular(toDouble()));

  //****************  SizedBox ****************** */
  Widget get verticalSizedBox => SizedBox(height: toDouble());
  EdgeInsets get vPadding => EdgeInsets.symmetric(vertical: toDouble());
}

//! Context Extension
extension ContextExtension on BuildContext {
  // ***Access the scaffold messenger for showing snack bars **
  ScaffoldMessengerState get scaffoldMessenger => ScaffoldMessenger.of(this);

  void pop<T>([T? result]) => Navigator.pop(this, result);
  //**************** Navigation ****************** */
  Future<T?> pushNamed<T>(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<T?> pushNamedAndRemoveUntil<T>(
    String routeName, {
    required RoutePredicate predicate,
    Object? arguments,
  }) {
    return Navigator.of(
      this,
    ).pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  Future<T?> pushReplacementNamed<T>(String routeName, {Object? arguments}) {
    return Navigator.of(
      this,
    ).pushReplacementNamed(routeName, arguments: arguments);
  }
}

//! Widget Extension
extension WidgetExtension on Widget {
  Widget allPadding(double padding) =>
      Padding(padding: EdgeInsets.all(padding), child: this);
  //****************  center ****************** */
  Widget center() => Center(child: this);
  //*** */ Wrap the widget with a ClipRRect ********
  Widget clipRRect({BorderRadius borderRadius = BorderRadius.zero}) =>
      ClipRRect(borderRadius: borderRadius, child: this);
  //************ Padding *********************/
  Widget horizontalPadding(double padding) => Padding(
    padding: EdgeInsets.symmetric(horizontal: padding),
    child: this,
  );
  Widget onlyPadding({
    double topPadding = 0,
    double bottomPadding = 0,
    double rightPadding = 0,
    double leftPadding = 0,
  }) => Padding(
    padding: EdgeInsets.only(
      bottom: bottomPadding,
      left: leftPadding,
      right: rightPadding,
      top: topPadding,
    ),
    child: this,
  );
  Widget onlyPaddingDirectional({
    double topPadding = 0,
    double bottomPadding = 0,
    double startPadding = 0,
    double endPadding = 0,
  }) => Padding(
    padding: EdgeInsetsDirectional.only(
      bottom: bottomPadding,
      end: endPadding,
      start: startPadding,
      top: topPadding,
    ),
    child: this,
  );

  Widget verticalPadding(double padding) => Padding(
    padding: EdgeInsets.symmetric(vertical: padding),
    child: this,
  );
}

extension SizeExtension on BuildContext {
  double get height => MediaQuery.sizeOf(this).height;
  double get width => MediaQuery.sizeOf(this).width;
}
