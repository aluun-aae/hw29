import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/random_bloc.dart';

const _duration = Duration(seconds: 1);
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("dsad");
    return BlocProvider(
      create: (context) => RandomBloc(),
      child: MaterialApp(
        home: AnimatedContainerApp(),
      ),
    );
  }
}

class AnimatedContainerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedContainer Demo'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<RandomBloc, RandomState>(
            builder: (context, state) {
              return Center(
                  child: SizedBox(
                child: AnimatedContainer(
                  height: state.hewi,
                  width: state.hewi,
                  decoration: BoxDecoration(
                    color: state.color,
                    borderRadius: BorderRadius.circular(state.borderRadius1),
                  ),
                  duration: _duration,
                  curve: Curves.fastOutSlowIn,
                ),
              ));
            },
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                onPressed: () {
                  BlocProvider.of<RandomBloc>(context).add(ChangeSizeEvent());
                },
                child: Icon(Icons.add),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
