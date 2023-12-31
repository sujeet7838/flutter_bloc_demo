import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_bloc_demo/cubit/internet_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
      child: BlocConsumer<InternetCubit, InternetState>(
        listener: (context, state) {
          if (state == InternetState.Gained) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Connected"),
              backgroundColor: Colors.yellow,
            ));
          } else if (state == InternetState.Lost) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Not Connected"),
              backgroundColor: Colors.red,
            ));
          }
        },
        builder: (context, state) {
          if (state == InternetState.Gained) {
            return const Text("Connected");
          } else if (state == InternetState.Lost) {
            return const Text("Not Connected");
          } else {
            return const Text("Loading....");
          }
        },
      ),

      // Bloc Integrate

      // BlocConsumer<InternetBloc, InternetState>(
      //   listener: (context, state) {
      //     if (state is InternetGainState) {
      //       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      //         content: Text("Connected"),
      //         backgroundColor: Colors.yellow,
      //       ));
      //     } else if (state is InternetlossState) {
      //       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      //         content: Text("Not Connected"),
      //         backgroundColor: Colors.red,
      //       ));
      //     }
      //   },
      //   builder: (context, state) {
      //     if (state is InternetGainState) {
      //       return const Text("Connected");
      //     } else if (state is InternetlossState) {
      //       return const Text("Not Connected");
      //     } else {
      //       return const Text("Loading....");
      //     }
      //   },
      // ),
    )));
  }
}
