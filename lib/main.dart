import 'package:day_2/day_three/change_info/change_info.dart';
import 'package:day_2/day_three/login/day_three_bloc.dart';
import 'package:day_2/day_three/login/login.dart';
import 'package:day_2/day_two/exercise_one/day_two_exercise_one.dart';
import 'package:day_2/day_two/exercise_two/day_two_exercise_two.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'day_three/detail/detail.dart';
import 'home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

final _route = GoRouter(
  initialLocation: '/home',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/home',
      builder: (context, state) => const Home(),
    ),
    GoRoute(
      path: '/day_two/lession_one',
      builder: (context, state) => const DayTwoExerciseOne(),
    ),
    GoRoute(
      path: '/day_two/lession_two',
      builder: (context, state) => const DayTwoExerciseTwo(),
    ),
    GoRoute(
      path: '/day_three/login',
      builder: (context, state) => const Login(),
    ),
    GoRoute(
      path: '/day_three/detail',
      builder: (context, state) => const Detail(),
    ),
    GoRoute(
      path: '/day_three/change_info',
      builder: (context, state) => const ChangeInfo(),
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DayThreeBloc>(
          create: (context) => DayThreeBloc(),
        ),
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routerConfig: _route,
      ),
    );
  }
}
