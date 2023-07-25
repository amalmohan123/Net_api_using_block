  
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:netflix_api/core/colors.dart';
import 'package:netflix_api/prasantation/new_and_hot/widgets/coming_soon.dart';
import 'package:netflix_api/prasantation/new_and_hot/widgets/everyone_watching.dart';

import '../../application/hot_and_new/hot_and_new_bloc.dart';

import '../../core/constants.dart';


class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: AppBar(
            title: const Text(
              'New & Hot',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  fontFamily: 'Roboto'),
            ),
            actions: const [
              Icon(
                Icons.cast,
                size: 30,
                color: Colors.white,
              ),
              kwidth,
              Opacity(
                  opacity: 0.7,
                  child: Image(
                      height: 30,
                      width: 30,
                      image: NetworkImage(
                          'https://static-cdn.jtvnw.net/jtv_user_pictures/1d8af5f8-03f8-4abb-ba09-93bcfe6895f6-profile_image-70x70.png'))),
              kwidth
            ],
            bottom: TabBar(
                automaticIndicatorColorAdjustment: true,
                isScrollable: true,
                unselectedLabelColor: whiteColor,
                unselectedLabelStyle:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                labelColor: blackColor,
                labelStyle:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                indicator: BoxDecoration(
                    color: whiteColor, borderRadius: kborderradius30),
                tabs: const [
                  Padding(
                    padding: EdgeInsets.all(0),
                    child: Tab(
                      text: '🍿 Coming Soon     ',
                    ),
                  ),
                  Tab(
                    text: "👀 Everyone's Watching  ",
                  ),
                ]),
          ),
        ),
        body: const TabBarView(children: [
          ComingSoonList(key: Key('coming_soon')),
          EveryOnesWatchingList(
            key: Key('EveryOnesWatching'),
          )
        ]),
      ),
    );
  }
}

class EveryOnesWatchingList extends StatelessWidget {
  const EveryOnesWatchingList({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      return BlocProvider.of<HotAndNewBloc>(context)
          .add(const LoadDataInEveryOnesWatching());
    });
    return RefreshIndicator(
      onRefresh: ()async {
        BlocProvider.of<HotAndNewBloc>(context)
          .add(const LoadDataInEveryOnesWatching());
      },
      child: BlocBuilder<HotAndNewBloc,HotAndNewState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          } else if (state.hasError) {
            return const Center(child: Text('Error while getting data'));
          } else if (state.everyOnesWatchingList.isEmpty) {
            return const Center(child: Text("EveryOne's Watching list is empty"));
          } else {
            return ListView.builder(
                itemCount: state.everyOnesWatchingList.length,
                itemBuilder: (context, index) {
                  final movie = state.everyOnesWatchingList[index];
                  if (movie.id == null) {
                    return const SizedBox();
                  }
    
                  return EveryonesWatching(
                    posterPath: '$imageAppendUrl${movie.backdropPath}',
                    movieName: movie.name ?? 'No Title',
                    description: movie.overview ?? 'No discription',
                  );
                });
          }
        },
      ),
    );
  }
}

class ComingSoonList extends StatelessWidget {
  const ComingSoonList({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      return BlocProvider.of<HotAndNewBloc>(context)
          .add(const LoadDataInComingSoon());
    });
    return RefreshIndicator(
      onRefresh: ()async {
        BlocProvider.of<HotAndNewBloc>(context)
          .add(const LoadDataInComingSoon());
        
      },
      child: BlocBuilder<HotAndNewBloc, HotAndNewState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          } else if (state.hasError) {
            return const Center(child: Text('Error while getting data'));
          } else if (state.comingSoonList.isEmpty) {
            return const Center(child: Text('Coming soon list is empty'));
          } else {
            return ListView.builder(
                itemCount: state.comingSoonList.length,
                itemBuilder: (context, index) {
                  final movie = state.comingSoonList[index];
                  if (movie.id == null) {
                    return const SizedBox();
                  }
                  String month = '';
                  String date = '';
    
                  try {
                    final _data = DateTime.tryParse(movie.releaseDate!);
                    final formattedDate =
                        DateFormat.yMMMMd('en_US').format(_data!);
                    month = formattedDate
                        .split('  ')
                        .first
                        .substring(0, 3)
                        .toUpperCase();
                    date = movie.releaseDate!.split('-')[1];
                  } catch (_) {
                    month = '';
                    date = '';
                  }
    
                  return ComingSoonWidget(
                    id: movie.id.toString(),
                    month: month,
                    day: date,
                    posterPath: '$imageAppendUrl${movie.backdropPath}',
                    movieName: movie.title ?? 'No Title',
                    description: movie.overview ?? 'No discription',
                  );
                });
          }
        },
      ),
    );
  }
}
