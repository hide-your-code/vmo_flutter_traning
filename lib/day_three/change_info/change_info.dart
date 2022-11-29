import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangeInfo extends StatelessWidget {
  const ChangeInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          slivers: [
            _appBar(context),
            const SliverToBoxAdapter(
              child: _Avatar(),
            ),
            const SliverToBoxAdapter(
              child: _Item(
                type: 'Email',
                isPassword: false,
              ),
            ),
            const SliverToBoxAdapter(
              child: _Item(
                type: 'Password',
                isPassword: true,
              ),
            ),
            const SliverToBoxAdapter(
              child: _Item(
                type: 'Gender',
                isPassword: false,
              ),
            ),
            const SliverToBoxAdapter(
              child: _Item(
                type: 'Birthday',
                isPassword: false,
              ),
            ),
            const SliverToBoxAdapter(
              child: _Item(
                type: 'Phone number',
                isPassword: false,
              ),
            ),
            const SliverToBoxAdapter(
              child: _Item(
                type: 'Address',
                isPassword: false,
              ),
            ),
            const SliverToBoxAdapter(
              child: _ButtonUpdated(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _appBar(BuildContext context) {
    return SliverAppBar(
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
    );
  }
}

class _Avatar extends StatelessWidget {
  const _Avatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          CircleAvatar(
            radius: 64,
            backgroundColor: Colors.black,
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: ClipOval(
                child: Image.asset(
                  'assets/images/image.jpg',
                  width: 128,
                  height: 128,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              
            },
            child: Container(
              width: 30,
              height: 30,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  width: 2,
                  color: Colors.black,
                ),
              ),
              child: const Icon(
                Icons.upload,
                size: 30,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final String type;
  final bool isPassword;

  const _Item({
    Key? key,
    required this.type,
    required this.isPassword,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(
        left: 28,
        right: 28,
        top: 8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$type:',
            style: GoogleFonts.roboto(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          TextField(
            obscureText: isPassword,
            decoration: InputDecoration(
              hintText: type,
              hintStyle: GoogleFonts.roboto(
                fontSize: 16,
                color: Colors.black45,
              ),
              labelStyle: GoogleFonts.roboto(
                fontSize: 16,
                color: Colors.black,
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
                borderSide: BorderSide(
                  color: Color(0xFFD1D1D1),
                  width: 1,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
                borderSide: BorderSide(
                  color: Color(0xFFD1D1D1),
                  width: 1,
                ),
              ),
            ),
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }
}

class _ButtonUpdated extends StatelessWidget {
  const _ButtonUpdated({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 40,
      alignment: Alignment.centerRight,
      margin: const EdgeInsets.only(
        left: 28,
        right: 28,
        top: 43,
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color?>(
              (states) => Colors.black),
          padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
            (states) => const EdgeInsets.symmetric(
              horizontal: 30,
            ),
          ),
        ),
        onPressed: () {},
        child: Text(
          'Update',
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.w400,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
