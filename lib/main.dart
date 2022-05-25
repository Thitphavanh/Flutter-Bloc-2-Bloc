import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_to_bloc/blocs/color/color_bloc.dart';
import 'package:flutter_bloc_to_bloc/blocs/counter/counter_bloc.dart';
import 'package:flutter_bloc_to_bloc/pages/splash_screen_page.dart';

import 'observers/color_bloc_observer.dart';

void main() {
  // BlocOverrides.runZoned(
  //   () {},
  //   blocObserver: ColorBlocObserver(),
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ColorBloc>(
          create: (context) => ColorBloc(),
        ),
        BlocProvider<CounterBloc>(
          create: (context) => CounterBloc(
            colorBloc: context.read<ColorBloc>(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Bloc2Bloc',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
