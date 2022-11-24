import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

class DayTwoExerciseOne extends StatelessWidget {
  const DayTwoExerciseOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          appBar(context),
          addressName(),
          countryName(),
          button(),
          description(),
          titleSimilarPlaces(),
          listSimilarPalace(),
        ],
      ),
    );
  }

  SliverAppBar appBar(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 200,
      leading: IconButton(
        onPressed: () {
          context.pop();
        },
        icon: const Icon(Icons.arrow_back_ios),
      ),
      flexibleSpace: FlexibleSpaceBar(
        title: const Text('Flutter lessions - Day 2'),
        background: Image.asset(
          'assets/images/image.jpg',
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  SliverToBoxAdapter addressName() {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.only(left: 57, right: 57, top: 44),
        child: Text(
          'Oeschinen Lake Campground',
          style: GoogleFonts.varelaRound(
            fontSize: 24,
            color: const Color(0xFF000000),
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter countryName() {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 57),
        child: Text(
          'Kandersteg, Switzerland',
          style: GoogleFonts.varelaRound(
            fontSize: 15,
            color: const Color(0xFF5A6978),
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter button() {
    return SliverToBoxAdapter(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(left: 57, right: 57, top: 46, bottom: 38),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            CustomButton(iconData: Icons.call, text: 'call'),
            CustomButton(iconData: Icons.near_me, text: 'route'),
            CustomButton(iconData: Icons.share, text: 'share'),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter description() {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.only(left: 49, right: 49, bottom: 27),
        child: Text(
          'Sed ut perspiciatis, unde omnis iste natus error sit voluptatem accusant doloremque laudantium, totam rem aperiam eaque ipsa, quae ab illo inventore veritatis. Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese, Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes.',
          style: GoogleFonts.varelaRound(
            fontSize: 15,
            color: const Color(0xFF5A6978),
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter titleSimilarPlaces() {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.only(
          left: 22,
          right: 22,
          bottom: 24,
        ),
        child: Text(
          'Similar Palace',
          style: GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  SliverToBoxAdapter listSimilarPalace() {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 200,
        width: double.infinity,
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) {
            return SizedBox(
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/image.jpg',
                    fit: BoxFit.fill,
                    height: 92,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Oeschinen Lake',
                    style: GoogleFonts.varelaRound(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            );
          }),
          separatorBuilder: (context, index) {
            return const SizedBox(
              width: 20,
            );
          },
          itemCount: 10,
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final IconData iconData;
  final String text;

  const CustomButton({Key? key, required this.iconData, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {},
      child: Column(
        children: [
          Icon(
            iconData,
            color: const Color(0xFF00A6FF),
            size: 32,
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            text.toUpperCase(),
            style: GoogleFonts.varelaRound(
              color: const Color(0xFF00A6FF),
              fontSize: 24,
            ),
          ),
        ],
      ),
    );
  }
}
