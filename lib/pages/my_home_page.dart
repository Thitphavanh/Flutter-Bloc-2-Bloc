import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_to_bloc/blocs/color/color_bloc.dart';
import 'package:flutter_bloc_to_bloc/observers/color_bloc_observer.dart';
import 'package:flutter_bloc_to_bloc/observers/counter_bloc_observer.dart';
import '../blocs/counter/counter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int incrementSize = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BlocOverrides.runZoned(
        () => context.watch<ColorBloc>().state.color,
        blocObserver: ColorBlocObserver(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                context.read<ColorBloc>().add(ChangeColorEvent());
              },
              child: const Text(
                'Change Color',
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            BlocOverrides.runZoned(
              () {
                return Text(
                  '${context.watch<CounterBloc>().state.counter}',
                  style: const TextStyle(
                    fontSize: 52.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                );
              },
              blocObserver: CounterBlocObserver(),
            ),
            const SizedBox(height: 20.0),
            TextButton(
              onPressed: () {
                context
                    .read<CounterBloc>()
                    .add(ChangeCounterEvent());
              },
              child: const Text(
                'Increment Counter',
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
