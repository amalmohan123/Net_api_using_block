import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_api/application/downloads/downloads_bloc.dart';
import 'package:netflix_api/core/colors.dart';
import 'package:netflix_api/core/constants.dart';
import '../widgets/app_bar_widgets.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});

  final widegetList = [
    const SizedBox(height: 0),
    const _Smart_Downloads(),
    const Section2(),
    const Section3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(45),
          child: ScreenAppBarWidget(
            title: 'Downloads',
          ),
        ),
        body: ListView.separated(
            padding: const EdgeInsets.all(15),
            itemBuilder: ((cxt, index) => widegetList[index]),
            separatorBuilder: ((cxt, index) => const SizedBox(
                  height: 20,
                )),
            itemCount: widegetList.length));
  }
}

class Section2 extends StatelessWidget {
  const Section2({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

    BlocProvider.of<DownloadsBloc>(context)
        .add(const DownloadsEvent.getDownloadsImage());
    });
    final Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        const Center(
          child: Text(
            'Introducing Downloads for you',
            style: TextStyle(
                color: whiteColor, fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 15),
        const Text(
          "We will download a personalised selection of\n movies and shows for you, so there's\n always something to watch on your\n device",
          textAlign: TextAlign.center,
          style: TextStyle(color: greyColor, fontSize: 16),
        ),
        BlocBuilder<DownloadsBloc, DownloadsState>(
          builder: (context, state) {
           return 
            SizedBox(
              width: size.width,
              height: size.width,
              child: state.isLoading? const Center(child: CircularProgressIndicator()):
              Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                      radius: size.width * 0.35,
                      backgroundColor: greyColor.withOpacity(0.4)),
                  DownloadsImageWidgets(
                    imageList: '$imageAppendUrl${state.downloads?[0].posterPath}',
                    margin: const EdgeInsets.only(left: 200, bottom: 40),
                    angle: 20,
                    size: Size(size.width * 0.32, size.height * 0.24),
                  ),
                  DownloadsImageWidgets(
                    imageList: '$imageAppendUrl${state.downloads?[1].posterPath}',
                    margin: const EdgeInsets.only(right: 200, bottom: 40),
                    size: Size(size.width * 0.32, size.height * 0.24),
                    angle: -20,
                  ),
                  DownloadsImageWidgets(       
                    imageList: '$imageAppendUrl${state.downloads?[2].posterPath}', 
                    margin: const EdgeInsets.only(bottom: 0),
                    size: Size(size.width * 0.36, size.height * 0.27),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            color: Colors.blue,
            onPressed: () {},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Text(
                'Set Up',
                style: TextStyle(
                    color: whiteColor,
                    fontSize: 19,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        MaterialButton(
          color: whiteColor,
          onPressed: () {},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Text(
              'See what you can download',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 19,
                  fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }
}

class _Smart_Downloads extends StatelessWidget {
  const _Smart_Downloads({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        SizedBox(width: 0),
        Icon(Icons.settings, color: whiteColor),
        SizedBox(width: 15),
        Text('Smart Downloads'),
      ],
    );
  }
}

class DownloadsImageWidgets extends StatelessWidget {
  const DownloadsImageWidgets({
    super.key,
    required this.imageList,
    this.angle = 0,
    required this.margin,
    required this.size,
  });

  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margin,
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              imageList,
            ),
          ),
        ),
      ),
    );
  }
}
