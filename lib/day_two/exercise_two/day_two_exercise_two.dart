import 'package:day_2/day_two/exercise_two/day_two_exercise_two_view_model.dart';
import 'package:day_2/day_two/exercise_two/login_state.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_event.dart';

class DayTwoExerciseTwo extends StatelessWidget {
  const DayTwoExerciseTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DayTwoExerciseTwoBloc>(
          create: (_) => DayTwoExerciseTwoBloc(),
        )
      ],
      child: BlocListener<DayTwoExerciseTwoBloc, LoginState>(
        listener: (context, state) {},
        child: Scaffold(
          body: CustomScrollView(
            slivers: <Widget>[
              appBar(context),
              title(),
              titleUsername(),
              fieldUsername(),
              titlePassword(),
              fieldPassword(),
              forgetPassword(),
              signInButton(),
              signUpButton(),
              or(),
              loginBy(),
              chooseLanguage(),
            ],
          ),
        ),
      ),
    );
  }

  SliverAppBar appBar(BuildContext context) {
    return SliverAppBar(
      pinned: false,
      floating: true,
      snap: false,
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      expandedHeight: 200,
      leading: IconButton(
        onPressed: () {
          context.pop();
        },
        icon: const Icon(Icons.arrow_back_ios),
      ),
      flexibleSpace: FlexibleSpaceBar(
        title: SizedBox(
          height: 130,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/ex2_ic_logo.png',
                fit: BoxFit.fill,
                width: 80,
              )
            ],
          ),
        ),
        background: Image.asset(
          'assets/images/ex2_bg.png',
          fit: BoxFit.fill,
        ),
        centerTitle: true,
        collapseMode: CollapseMode.pin,
        titlePadding: EdgeInsets.zero,
      ),
    );
  }

  SliverToBoxAdapter title() {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.only(top: 30),
        alignment: Alignment.center,
        child: Text(
          'Signin to your account',
          style: GoogleFonts.kanit(
            color: const Color(0xFF231F20),
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter titleUsername() {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.only(top: 30, left: 30),
        alignment: Alignment.centerLeft,
        child: Text(
          'Username',
          style: GoogleFonts.kanit(
            color: const Color(0xFF231F20),
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter fieldUsername() {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.only(top: 20, left: 30, right: 30),
        child: TextField(
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFFEBEBEB),
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFFEBEBEB),
              ),
            ),
            hintText: 'Member ID',
            hintStyle: GoogleFonts.kanit(
              color: const Color(0xFFEBEBEB),
            ),
            prefixIcon: const Icon(
              Icons.person,
              color: Color(0xFFDADADA),
            ),
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter titlePassword() {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.only(top: 20, left: 30),
        alignment: Alignment.centerLeft,
        child: Text(
          'Password',
          style: GoogleFonts.kanit(
            color: const Color(0xFF231F20),
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter fieldPassword() {
    return SliverToBoxAdapter(
      child: _FieldPassword(),
    );
  }

  SliverToBoxAdapter forgetPassword() {
    return SliverToBoxAdapter(
      child: Container(
          margin: const EdgeInsets.only(top: 5, left: 25),
          alignment: Alignment.centerLeft,
          child: TextButton(
            onPressed: () {},
            child: Text(
              'Forgot your password?',
              style: GoogleFonts.kanit(
                color: const Color(0xFFBCBCBC),
                fontSize: 13,
              ),
            ),
          )),
    );
  }

  SliverToBoxAdapter signInButton() {
    return const SliverToBoxAdapter(
      child: _SignInButton(),
    );
  }

  SliverToBoxAdapter signUpButton() {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.only(top: 30, left: 30, right: 30),
        alignment: Alignment.center,
        child: TextButton(
          onPressed: () {},
          child: RichText(
            text: TextSpan(
              text: 'Don\'t have an account?',
              style: GoogleFonts.kanit(color: const Color(0xFFBCBCBC)),
              children: [
                const WidgetSpan(
                    child: SizedBox(
                  width: 20,
                )),
                TextSpan(
                  text: 'sign up',
                  style: GoogleFonts.kanit(
                    color: const Color(0xFFFF7500),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter or() {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.only(top: 30, left: 30, right: 30),
        alignment: Alignment.center,
        width: double.infinity,
        child: Row(
          children: [
            const Flexible(
              child: Divider(
                height: 2,
                color: Color(0xFFBCBCBC),
              ),
              flex: 1,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Or',
                style: GoogleFonts.kanit(
                  fontSize: 13,
                  color: const Color(0xFFBCBCBC),
                ),
              ),
            ),
            const Flexible(
              child: Divider(
                height: 2,
                color: Color(0xFFBCBCBC),
              ),
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter loginBy() {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.only(top: 30, left: 30, right: 30),
        alignment: Alignment.center,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 82,
              height: 50,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.resolveWith<Color?>((states) {
                    return Colors.white70;
                  }),
                ),
                onPressed: () {},
                child: Image.asset(
                  'assets/images/ex2_ic_facebook_logo.png',
                  height: 24,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            SizedBox(
              width: 82,
              height: 50,
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.resolveWith<Color?>((states) {
                      return Colors.white70;
                    }),
                  ),
                  onPressed: () {},
                  child: const Icon(
                    Icons.call,
                    color: Colors.orange,
                    size: 24,
                  )),
            ),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter chooseLanguage() {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.only(top: 30, bottom: 30),
        alignment: Alignment.center,
        child: TextButton(
          onPressed: () {},
          child: Text(
            'Choose your language',
            style: GoogleFonts.kanit(
              color: const Color(0xFF231F20),
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}

class _SignInButton extends StatelessWidget {
  const _SignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DayTwoExerciseTwoBloc, LoginState>(
        builder: (context, state) {
      return Container(
        margin: const EdgeInsets.only(top: 30, left: 30, right: 30),
        width: 300,
        height: 50,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.resolveWith<Color?>((states) {
              if (states.contains(MaterialState.disabled)) {
                return const Color(0xFFDADADA);
              }

              return const Color(0xFFFF7500);
            }),
          ),
          onPressed: state.isEnableSignInButton ? () {} : null,
          child: Text(
            'Sign in',
            style: GoogleFonts.kanit(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      );
    });
  }
}

class _FieldPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DayTwoExerciseTwoBloc, LoginState>(
      builder: (context, state) {
        return Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 20, left: 30, right: 30),
          child: TextField(
            obscureText: !state.isShowPassword,
            onChanged: (value) {
              context
                  .read<DayTwoExerciseTwoBloc>()
                  .add(LoginFillPassword(value));
            },
            decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFFEBEBEB),
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFFEBEBEB),
                ),
              ),
              hintText: 'Password',
              hintStyle: GoogleFonts.kanit(
                color: const Color(0xFFEBEBEB),
              ),
              prefixIcon: const Icon(
                Icons.lock,
                color: Color(0xFFDADADA),
              ),
              suffixIcon: IconButton(
                icon: Icon(!state.isShowPassword
                    ? Icons.visibility_off
                    : Icons.remove_red_eye),
                onPressed: () {
                  context
                      .read<DayTwoExerciseTwoBloc>()
                      .add(const LoginShowHidePassword());
                },
                color: const Color(0xFFEBEBEB),
              ),
            ),
          ),
        );
      },
    );
  }
}
