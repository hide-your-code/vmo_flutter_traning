import 'package:day_2/day_three/login/day_three_bloc.dart';
import 'package:day_2/day_three/login/day_three_state.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Detail extends StatelessWidget {
  const Detail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Container(
                      margin: const EdgeInsets.only(
                        top: 25,
                        left: 25,
                        right: 25,
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(
                              'assets/images/image.jpg',
                              height: 78,
                              width: 78,
                              fit: BoxFit.fill,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              _Name(),
                              _Username(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: _Gender(),
                  ),
                  const SliverToBoxAdapter(
                    child: _Birthday(),
                  ),
                  const SliverToBoxAdapter(
                    child: _Email(),
                  ),
                  const SliverToBoxAdapter(
                    child: _PhoneNumber(),
                  ),
                  const SliverToBoxAdapter(
                    child: _Address(),
                  ),
                ],
              ),
            ),
            const _ButtonChangeInformation(),
          ],
        ),
      ),
    );
  }
}

class _Name extends StatelessWidget {
  const _Name({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DayThreeBloc, DayThreeState>(
      builder: (context, state) => Text(
        state.user.name.isEmpty ? 'Unknown' : state.user.name,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: GoogleFonts.roboto(
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _Username extends StatelessWidget {
  const _Username({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DayThreeBloc, DayThreeState>(
      builder: (context, state) => Text(
        state.user.username,
        overflow: TextOverflow.ellipsis,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w400,
          color: const Color(0xFF50555C),
          fontSize: 12,
        ),
      ),
    );
  }
}

class _Gender extends StatelessWidget {
  const _Gender({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DayThreeBloc, DayThreeState>(
      builder: (context, state) => _DetailItem(
        icon: Icons.male,
        title: 'Gender',
        data: state.user.gender.isEmpty ? 'Unknown' : state.user.gender,
      ),
    );
  }
}

class _Birthday extends StatelessWidget {
  const _Birthday({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DayThreeBloc, DayThreeState>(
      builder: (context, state) => _DetailItem(
        icon: Icons.calendar_today,
        title: 'Birthday',
        data: state.user.birthday.isEmpty ? 'Unknown' : state.user.birthday,
      ),
    );
  }
}

class _Email extends StatelessWidget {
  const _Email({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DayThreeBloc, DayThreeState>(
      builder: (context, state) => _DetailItem(
        icon: Icons.email,
        title: 'Email',
        data: state.user.email.isEmpty ? 'Unknown' : state.user.email,
      ),
    );
  }
}

class _PhoneNumber extends StatelessWidget {
  const _PhoneNumber({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DayThreeBloc, DayThreeState>(
      builder: (context, state) => _DetailItem(
        icon: Icons.phone,
        title: 'Phone number',
        data:
            state.user.phoneNumber.isEmpty ? 'Unknown' : state.user.phoneNumber,
      ),
    );
  }
}

class _Address extends StatelessWidget {
  const _Address({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DayThreeBloc, DayThreeState>(
      builder: (context, state) => _DetailItem(
        icon: Icons.lock,
        title: 'Address',
        data: state.user.address.isEmpty ? 'Unknown' : state.user.address,
      ),
    );
  }
}

class _DetailItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String data;

  const _DetailItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Icon(
            icon,
            size: 24,
          ),
          const SizedBox(
            width: 16,
          ),
          Text(
            title,
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.w700,
              fontSize: 12,
              color: Colors.black,
            ),
          ),
          const Spacer(),
          Text(
            data,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              fontSize: 12,
              color: const Color(0xFF9098B1),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          const Icon(
            Icons.arrow_forward_ios,
            size: 24,
            color: Color(0xFF9098B1),
          ),
        ],
      ),
    );
  }
}

class _ButtonChangeInformation extends StatelessWidget {
  const _ButtonChangeInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DayThreeBloc, DayThreeState>(
      builder: (context, state) => Container(
        width: double.infinity,
        height: 42,
        margin: const EdgeInsets.only(
          left: 25,
          right: 25,
          bottom: 50,
        ),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                (states) => Colors.black),
          ),
          onPressed: () {
            context.push('/day_three/change_info');
          },
          child: Text(
            'Change information',
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
