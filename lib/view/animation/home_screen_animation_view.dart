import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import '../../controller/animation/home_screen_animation_controller.dart';
import 'hero_animation.dart';
import '../../controller/animation/hero_fly.dart';

class HomeScreenAnimationView extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Curve curve;
  final CreateRectTween createRectTween;

  const HomeScreenAnimationView({
    required this.duration,
    required this.child,
    Key? key,
    this.curve = Curves.linear,
    this.createRectTween = _defaultCreateTweenRect,
  }) : super(key: key);

  @override
  State<HomeScreenAnimationView> createState() =>
      HomeScreenAnimationViewState();

  static RectTween _defaultCreateTweenRect(Rect? begin, Rect? end) {
    return MaterialRectArcTween(begin: begin, end: end);
  }
}

class HomeScreenAnimationViewState extends State<HomeScreenAnimationView>
    with TickerProviderStateMixin<HomeScreenAnimationView>
    implements ScopeRegistrar {
  late ScopeRegistrarImpl _scopeRegistrar;

  @override
  void initState() {
    _scopeRegistrar = ScopeRegistrarImpl(
      duration: widget.duration,
      createRectTween: widget.createRectTween,
      curve: widget.curve,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return HomeScreenAnimationMaker(
      child: Stack(
        children: [
          Positioned.fill(child: widget.child),
          ..._scopeRegistrar.map.values.map((scope) {
            return HeroFly(
              scope: scope,
              key: ValueKey(scope.widget.tag),
            );
          })
        ],
      ),
    );
  }

  @override
  Scope register(HeroAnimation heroAnimation) {
    return _scopeRegistrar.register(heroAnimation);
  }

  @override
  void unregister(HeroAnimation heroAnimation) {
    _scopeRegistrar.unregister(heroAnimation);
    _removeObsoleteHeroFlyIfNeeded(heroAnimation.tag);
  }

  void _removeObsoleteHeroFlyIfNeeded(String tag) {
    if (!_scopeRegistrar.map.containsKey(tag)) {
      ServicesBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          setState(() {});
        }
      });
    }
  }
}

class Scope {
  final HeroAnimation widget;
  final HeroAnimationController controller;
  int count;

  Scope({
    required this.widget,
    required this.controller,
    required this.count,
  });
}

class HomeScreenAnimationMaker extends SingleChildRenderObjectWidget {
  const HomeScreenAnimationMaker({
    required Widget child,
    Key? key,
  }) : super(key: key, child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return HomeScreenAnimationMarkerRenderObject();
  }
}

class HomeScreenAnimationMarkerRenderObject extends RenderProxyBox {}

class ScopeRegistrarImpl implements ScopeRegistrar {
  final Map<String, Scope> _map = <String, Scope>{};

  final Duration _duration;
  final CreateRectTween _createRectTween;
  final Curve _curve;
  final TickerProvider _vsync;

  ScopeRegistrarImpl({
    required Duration duration,
    required CreateRectTween createRectTween,
    required Curve curve,
    required TickerProvider vsync,
  })  : _duration = duration,
        _createRectTween = createRectTween,
        _curve = curve,
        _vsync = vsync;

  Map<String, Scope> get map => _map;

  @override
  Scope register(HeroAnimation heroAnimation) {
    if (!_map.containsKey(heroAnimation.tag)) {
      final controller = HeroAnimationController(
        duration: _duration,
        provideRectTween: _createRectTween,
        curve: _curve,
        vsync: _vsync,
        tag: heroAnimation.tag,
      );
      _map.putIfAbsent(
        heroAnimation.tag,
        () => Scope(
          controller: controller,
          widget: heroAnimation,
          count: 1,
        ),
      );
    } else {
      _map[heroAnimation.tag]?.count++;
    }

    return _map[heroAnimation.tag]!;
  }

  @override
  void unregister(HeroAnimation heroAnimation) {
    final heroScope = _map[heroAnimation.tag];
    if (heroScope != null) {
      heroScope.count--;
      if (heroScope.count == 0) {
        heroScope.controller.dispose();
        _map.remove(heroAnimation.tag);
      }
    }
  }
}

abstract class ScopeRegistrar {
  Scope register(HeroAnimation heroAnimation);

  void unregister(HeroAnimation heroAnimation);
}
