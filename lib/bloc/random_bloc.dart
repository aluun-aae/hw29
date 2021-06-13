import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'random_event.dart';
part 'random_state.dart';

double randomBorderRadius() {
  return Random().nextDouble() * 100;
}

Color randomColor() {
  return Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));
}

Random random = new Random();
double randomNumber1() {
  return Random().nextDouble() * 300;
}

class RandomBloc extends Bloc<RandomEvent, RandomState> {
  RandomBloc()
      : super(RandomState(
          color: Colors.amber,
          borderRadius1: 2.2,
          hewi: 40,
        ));

  @override
  Stream<RandomState> mapEventToState(
    RandomEvent event,
  ) async* {
    if (event is ChangeSizeEvent) {
      yield RandomState(
          color: randomColor(),
          borderRadius1: randomBorderRadius(),
          hewi: randomNumber1());
    }
  }
}
