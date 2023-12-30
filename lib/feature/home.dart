import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/bloc/bloc/internet_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: Center(
      child: BlocBuilder<InternetBloc, InternetState>(
        builder: (context, state) {
          if (state is InternetGainState) {
            return const Text("Connected");
          } else if (state is InternetlossState) {
            return const Text("Not Connected");
          } else {
            return const Text("Loading....");
          }
        },
      ),
    )));
  }
}
