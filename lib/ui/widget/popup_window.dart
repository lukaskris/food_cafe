import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

const Duration _kWindowDuration = const Duration(milliseconds: 0);
const double _kWindowCloseIntervalEnd = 2.0 / 3.0;
const double _kWindowMinWidth = 48.0;
const double _kWindowVerticalPadding = 0.0;
const double _kWindowScreenPadding = 0.0;
Future<T> showPopupWindow<T>({
  @required BuildContext context,
  RelativeRect position,
  @required Widget child,
  double elevation: 8.0,
  String semanticLabel,
  bool fullWidth,
  bool isShowBg = false,
}) {
  assert(context != null);
  String label = semanticLabel;
  switch (defaultTargetPlatform) {
    case TargetPlatform.iOS:
      label = semanticLabel;
      break;
    case TargetPlatform.android:
      break;
    case TargetPlatform.fuchsia:
      label =
          semanticLabel ?? MaterialLocalizations.of(context)?.popupMenuLabel;
      break;
    case TargetPlatform.linux:
      break;
    case TargetPlatform.macOS:
      break;
    case TargetPlatform.windows:
      break;
  }
  return Navigator.push(
      context,
      new _PopupWindowRoute(
          buildContext: context,
          position: position,
          child: child,
          elevation: elevation,
          semanticLabel: label,
          theme: Theme.of(context, shadowThemeOnly: true),
          barrierLabel:
              MaterialLocalizations.of(context).modalBarrierDismissLabel,
          fullWidth: fullWidth,
          isShowBg: isShowBg));
}

class _PopupWindowRoute<T> extends PopupRoute<T> {
  _PopupWindowRoute({
    BuildContext buildContext,
    RouteSettings settings,
    this.child,
    this.position,
    this.elevation: 8.0,
    this.theme,
    this.barrierLabel,
    this.semanticLabel,
    this.fullWidth,
    this.isShowBg,
  }) : super(settings: settings) {
    assert(child != null);
  }
  final Widget child;
  final RelativeRect position;
  double elevation;
  final ThemeData theme;
  final String semanticLabel;
  final bool fullWidth;
  final bool isShowBg;
  @override
  Color get barrierColor => null;
  @override
  bool get barrierDismissible => true;
  @override
  final String barrierLabel;
  @override
  Duration get transitionDuration => _kWindowDuration;
  @override
  Animation<double> createAnimation() {
    return new CurvedAnimation(
        parent: super.createAnimation(),
        curve: Curves.linear,
        reverseCurve: const Interval(0.0, _kWindowCloseIntervalEnd));
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    Widget win = new _PopupWindow<T>(
      route: this,
      semanticLabel: semanticLabel,
      fullWidth: fullWidth,
    );
    if (theme != null) {
      win = new Theme(data: theme, child: win);
    }
    return new MediaQuery.removePadding(
      context: context,
      removeTop: true,
      removeBottom: true,
      removeLeft: true,
      removeRight: true,
      child: new Builder(
        builder: (BuildContext context) {
          return Material(
            type: MaterialType.transparency,
            child: GestureDetector(
              onTap: () {
                Get.back();
                // NavigatorUtils.goBack(context);
              },
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: isShowBg ? Color(0x99000000) : null,
                child: new CustomSingleChildLayout(
                  delegate: new _PopupWindowLayoutDelegate(
                      position, null, Directionality.of(context)),
                  child: win,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _PopupWindow<T> extends StatelessWidget {
  const _PopupWindow({
    Key key,
    this.route,
    this.semanticLabel,
    this.fullWidth: false,
  }) : super(key: key);
  final _PopupWindowRoute<T> route;
  final String semanticLabel;
  final bool fullWidth;
  @override
  Widget build(BuildContext context) {
    final double length = 10.0;
    final double unit = 1.0 /
        (length + 1.5); // 1.0 for the width and 0.5 for the last item's fade.
    final CurveTween opacity =
        new CurveTween(curve: const Interval(0.0, 1.0 / 3.0));
    final CurveTween width = new CurveTween(curve: new Interval(0.0, unit));
    final CurveTween height =
        new CurveTween(curve: new Interval(0.0, unit * length));
    final Widget child = new ConstrainedBox(
        constraints: new BoxConstraints(
          minWidth: fullWidth ? double.infinity : _kWindowMinWidth,
          maxWidth: fullWidth ? double.infinity : Get.width / 1.15,
        ),
        child: new SingleChildScrollView(
          //padding: EdgeInsets.all(20),
          padding:
              const EdgeInsets.symmetric(vertical: _kWindowVerticalPadding),
          child: route.child,
        ));
    return new AnimatedBuilder(
      animation: route.animation,
      builder: (BuildContext context, Widget child) {
        return new Opacity(
          opacity: opacity.evaluate(route.animation),
          child: new Material(
            type: route.elevation == 0
                ? MaterialType.transparency
                : MaterialType.card,
            elevation: route.elevation,
            child: new Align(
              alignment: AlignmentDirectional.topEnd,
              widthFactor: width.evaluate(route.animation),
              heightFactor: height.evaluate(route.animation),
              child: new Semantics(
                scopesRoute: true,
                namesRoute: true,
                explicitChildNodes: true,
                label: semanticLabel,
                child: child,
              ),
            ),
          ),
        );
      },
      child: child,
    );
  }
}

class _PopupWindowLayoutDelegate extends SingleChildLayoutDelegate {
  _PopupWindowLayoutDelegate(
      this.position, this.selectedItemOffset, this.textDirection);
  final RelativeRect position;
  final double selectedItemOffset;
  final TextDirection textDirection;
  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return new BoxConstraints.loose(constraints.biggest -
        const Offset(_kWindowScreenPadding * 2.0, _kWindowScreenPadding * 2.0));
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    double y;
    if (selectedItemOffset == null) {
      y = position.top;
    } else {
      y = position.top +
          (size.height - position.top - position.bottom) / 2.0 -
          selectedItemOffset;
    }
    // Find the ideal horizontal position.
    double x;
    x = (size.width - childSize.width) / 2;
    //x=10;
    /*if (position.left > position.right) {
      // Menu button is closer to the right edge, so grow to the left, aligned to the right edge.
      x = size.width - position.right - childSize.width;
      //x = size.width - (childSize.width/2);
      print("ABC: $x");
      print("size.width: ${size.width}");
      print("position.right: ${position.right}");
      print("position.left: ${position.left}");
      print("childSize.width: ${childSize.width}");
    } else if (position.left < position.right) {
      // Menu button is closer to the left edge, so grow to the right, aligned to the left edge.
      x = position.left;
      print("ABCD: $x");
    } else {
      // Menu button is equidistant from both edges, so grow in reading direction.
      assert(textDirection != null);
      switch (textDirection) {
        case TextDirection.rtl:
          x = size.width - position.right - childSize.width;
          print("AB: $x");
          break;
        case TextDirection.ltr:
          x = position.left;
          print("A: $x");
          break;
      }
    }*/
    if (x < _kWindowScreenPadding) {
      x = _kWindowScreenPadding;
    } else if (x + childSize.width > size.width - _kWindowScreenPadding) {
      x = size.width - childSize.width - _kWindowScreenPadding;
    }
    if (y < _kWindowScreenPadding)
      y = _kWindowScreenPadding;
    else if (y + childSize.height > size.height - _kWindowScreenPadding)
      y = size.height - childSize.height - _kWindowScreenPadding;
    return new Offset(x, y);
  }

  @override
  bool shouldRelayout(_PopupWindowLayoutDelegate oldDelegate) {
    return position != oldDelegate.position;
  }
}
