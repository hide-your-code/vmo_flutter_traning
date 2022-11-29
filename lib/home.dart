import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choise Lession'),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Day two'),
            const SizedBox(
              height: 20,
            ),
            OutlinedButton(
              onPressed: () {
                context.push('/day_two/lession_one');
              },
              child: const Text('Lession one'),
            ),
            OutlinedButton(
              onPressed: () {
                context.push('/day_two/lession_two');
              },
              child: const Text('Lession two'),
            ),
            const SizedBox(
              height: 40,
            ),
            const Text('Day three'),
            const SizedBox(
              height: 20,
            ),
            OutlinedButton(
              onPressed: () {
                context.push('/day_three/login');
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
