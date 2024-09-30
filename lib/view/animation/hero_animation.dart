import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../model/animation/animation_model.dart';
import 'home_screen_animation_view.dart';
import 'hero_still.dart';

typedef HeroAnimationBuilder = Widget Function(
  BuildContext context,
  FlightState state,
  Widget? child,
);

class HeroAnimation extends StatefulWidget {
  final HeroAnimationBuilder? heroBuilder;
  final String tag;
  final Widget? child;

  factory HeroAnimation.builder({
    required HeroAnimationBuilder builder,
    required String tag,
    Key? key,
    Widget? child,
  }) {
    return HeroAnimation._(
      tag: tag,
      key: key,
      heroBuilder: builder,
      child: child,
    );
  }

  factory HeroAnimation.child({
    required String tag,
    required Widget child,
    Key? key,
  }) {
    return HeroAnimation._(tag: tag, key: key, child: child);
  }

  const HeroAnimation._({
    required this.tag,
    Key? key,
    this.child,
    this.heroBuilder,
  }) : super(key: key);

  @override
  HeroAnimationState createState() => HeroAnimationState();
}

class HeroAnimationState extends State<HeroAnimation> {
  late ScopeRegistrar scopeRegistrar;
  late Scope scope;

  @override
  void initState() {
    scopeRegistrar =
        context.findAncestorStateOfType<HomeScreenAnimationViewState>()
            as ScopeRegistrar;
    scope = scopeRegistrar.register(widget);

    ServicesBinding.instance.addPostFrameCallback((_) {
      if (scope.controller.flightState.value.isInitial()) {
        scope.controller.onAppeared();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    scopeRegistrar.unregister(widget);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return HeroStill(scope: scope);
  }
}
