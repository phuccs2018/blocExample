import 'package:flutter/material.dart';
import 'blocs/remote_bloc.dart';
import 'blocs/remote_event.dart';
import 'blocs/remote_state.dart';


void main() async{

  final bloc = RemoteBloc();

  bloc.stateController.stream.listen((state) {
    print('Âm lượng hiện tại: ${state.volume}');
  });

  await Future.delayed(Duration(seconds: 1));
  bloc.eventController.sink.add(IncreaseEvent(5));

  await Future.delayed(Duration(seconds: 2));
  bloc.eventController.sink.add(DecreaseEvent(10));

  await Future.delayed(Duration(seconds: 3));
  bloc.eventController.sink.add(MuteEvent(0));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc Pattern Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Text")
        ],         
      ),
    );
  }
}
