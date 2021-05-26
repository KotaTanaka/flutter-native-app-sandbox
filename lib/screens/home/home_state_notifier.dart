import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';

part 'home_state_notifier.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    @Default(0) int count,
  }) = _HomeState;
}

class HomeStateNotifier extends StateNotifier<HomeState> {
  HomeStateNotifier() : super(const HomeState());
  increment() => state = state.copyWith(count: state.count + 1);
}