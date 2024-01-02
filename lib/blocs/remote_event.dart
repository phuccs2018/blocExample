import 'dart:async';

abstract class RemoteEvent{
}
class IncreaseEvent extends RemoteEvent {
  final int increase;
  IncreaseEvent(this.increase);
}
class DecreaseEvent extends RemoteEvent {
  final int decrease;
  DecreaseEvent(this.decrease);
}
class MuteEvent extends RemoteEvent {
  final int mute;
  MuteEvent(this.mute);
}

