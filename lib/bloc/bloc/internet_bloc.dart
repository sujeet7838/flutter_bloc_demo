import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';
import 'package:meta/meta.dart';

part 'internet_event.dart';
part 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  Connectivity _connectivity = Connectivity();

  StreamSubscription? connectivitySubscription;

  InternetBloc() : super(InternetInitial()) {
    // on<InternetEvent>((event, emit) {});
    on<InternetlossEvent>((event, emit) => emit(InternetlossState()));
    on<InternetGainEvent>((event, emit) => emit(InternetGainState()));

    connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((results) {
      if (results == ConnectivityResult.mobile ||
          results == ConnectivityResult.wifi) {
        add(InternetGainEvent());
      } else {
        add(InternetlossEvent());
      }
    });
  }

  @override
  Future<void> close() {
    connectivitySubscription?.cancel();
    return super.close();
  }
}
