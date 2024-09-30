import 'dart:ui';

class FlightState {
  final FlightMode _mode;
  final int _flightCount;

  FlightState._(this._mode, {required int flightCount})
      : _flightCount = flightCount;

  int get flightCount => _flightCount;
  bool isInitial() => _mode == FlightMode.initial;
  bool isAppeared() => _mode == FlightMode.appeared;
  bool isFlightStarted() => _mode == FlightMode.flightStarted;
  bool isFlightEnded() => _mode == FlightMode.flightEnded;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FlightState &&
          runtimeType == other.runtimeType &&
          _mode == other._mode &&
          _flightCount == other._flightCount;

  @override
  int get hashCode => _mode.hashCode ^ _flightCount.hashCode;

  @override
  String toString() {
    return 'FlightState: $_mode, flightCount: $flightCount';
  }
}

extension FlightStateFactory on FlightState {
  static FlightState initial() {
    return FlightState._(FlightMode.initial, flightCount: 0);
  }

  FlightState onFlightStarted() {
    return FlightState._(FlightMode.flightStarted, flightCount: flightCount);
  }

  FlightState onAppeared() {
    return FlightState._(FlightMode.appeared, flightCount: flightCount);
  }

  FlightState onFlightEnded() {
    return FlightState._(FlightMode.flightEnded, flightCount: flightCount + 1);
  }
}

extension FlightStateProperties on FlightState {
  bool firstFlightStarted() => isFlightStarted() || flightCount > 0;

  bool firstFlightEnded() => isFlightEnded() || flightCount > 0;
}

enum FlightMode {
  initial,
  appeared,
  flightStarted,
  flightEnded,
}

class Event {
  final FlightState flightState;
  final Rect layoutRect;

  Event({
    required this.flightState,
    required this.layoutRect,
  });

  @override
  String toString() {
    return 'Event{flightState: $flightState, layoutRect: $layoutRect}';
  }

  Event copyWith({FlightState? flightState, Rect? layoutRect}) {
    return Event(
      flightState: flightState ?? this.flightState,
      layoutRect: layoutRect ?? this.layoutRect,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Event &&
          runtimeType == other.runtimeType &&
          flightState == other.flightState &&
          layoutRect == other.layoutRect;

  @override
  int get hashCode => flightState.hashCode ^ layoutRect.hashCode;
}
