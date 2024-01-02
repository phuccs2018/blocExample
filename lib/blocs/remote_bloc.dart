import 'dart:async';

import 'package:blockexample1/blocs/remote_state.dart';

// import 'remote_state.dart';
import 'remote_event.dart';

class RemoteBloc{
  var state = RemoteState(70);

  final eventController = StreamController<RemoteEvent>();

  final stateController = StreamController<RemoteState>();

  RemoteBloc(){
    eventController.stream.listen((RemoteEvent event) {
        if (event is IncreaseEvent){
          state = RemoteState(state.volume + event.increase);
        }
        else if (event is DecreaseEvent){
          state = RemoteState(state.volume + event.decrease);
        }
        else {
          state = RemoteState(0);
        }

        // thieu dong nay ne thang l
        stateController.sink.add(state);
    });
  }
  void dispose(){
    stateController.close();
    eventController.close();
  }
}