import 'package:day_2/day_three/login/day_three_bloc.dart';
import 'package:day_2/day_three/login/day_three_event.dart';
import 'package:day_2/day_three/login/day_three_state.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _title(),
          const SizedBox(
            height: 32,
          ),
          const _FieldUsername(),
          const SizedBox(height: 16),
          const _FieldPassword(),
          const SizedBox(height: 16),
          const _ButtonSubmit(),
        ],
      ),
    );
  }

  Widget _title() => Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          'Log in',
          style: GoogleFonts.comfortaa(
            fontSize: 36,
            color: Colors.black,
          ),
        ),
      );
}

class _FieldUsername extends StatelessWidget {
  const _FieldUsername({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DayThreeBloc, DayThreeState>(
      builder: (context, state) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Username',
            hintStyle: GoogleFonts.roboto(
              fontSize: 15,
              color: Colors.black45,
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(0),
              ),
              borderSide: BorderSide(
                color: Colors.black,
                width: 2,
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(0),
              ),
              borderSide: BorderSide(
                color: Colors.black,
                width: 2,
              ),
            ),
          ),
          onChanged: (value) {
            context.read<DayThreeBloc>().add(FillUsername(username: value));
          },
        ),
      ),
    );
  }
}

class _FieldPassword extends StatelessWidget {
  const _FieldPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DayThreeBloc, DayThreeState>(
      builder: (context, state) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: TextField(
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'Password',
            hintStyle: GoogleFonts.roboto(
              fontSize: 15,
              color: Colors.black45,
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(0),
              ),
              borderSide: BorderSide(
                color: Colors.black,
                width: 2,
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(0),
              ),
              borderSide: BorderSide(
                color: Colors.black,
                width: 2,
              ),
            ),
          ),
          onChanged: (value) {
            context.read<DayThreeBloc>().add(FillPassword(password: value));
          },
        ),
      ),
    );
  }
}

class _ButtonSubmit extends StatelessWidget {
  const _ButtonSubmit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DayThreeBloc, DayThreeState>(
      builder: (context, state) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        height: 52,
        width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.resolveWith<Color?>((states) {
              if (states.contains(MaterialState.disabled)) {
                return Colors.grey;
              }

              return Colors.black;
            }),
          ),
          onPressed:
              state.user.username.isNotEmpty & state.user.password.isNotEmpty
                  ? () {
                      context.push('/day_three/detail');
                    }
                  : null,
          child: Text(
            'Log in'.toUpperCase(),
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }
}
