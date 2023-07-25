import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_api/domain/core/failures/main_failures.dart';
import 'package:netflix_api/domain/hot_and_new/hot_and_new_service.dart';
import 'package:netflix_api/domain/hot_and_new/model/hot_and_new_res.dart';
part 'home_page_event.dart';
part 'home_page_state.dart';
part 'home_page_bloc.freezed.dart';

@injectable
class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final HotAndNewService _homeService;
  HomePageBloc(this._homeService) : super(HomePageState.initial()) {
    //  on event get  homeScreen data

    on<HomePageEvent>((event, emit) async {
      // send loadingTo ui

      emit(state.copyWith(isLoading: true, hasError: false));

      // get Data

      final _movieResult = await _homeService.getHotAndNewMovieData();
      final _tvResult = await _homeService.getHotAndNewTvData();

      // transform data

      final _state1 = _movieResult.fold(
        (MainFailure failure) {
          return HomePageState(
              stateId: DateTime.now().millisecondsSinceEpoch.toString(),
            pastYearMovieList: [],
            trendingMovieList: [],
            tenseDramasMovieList: [],
            southIndinCinemaMovieList: [],
            trendingTvList: [],
            isLoading: false,
            hasError: true,
          );
        },
        (HotAndNewRes res) {
          final pastYear = res.results;
          final trending = res.results;
          final dramas = res.results;
          final southindian = res.results;
          pastYear.shuffle();
          trending.shuffle();
          dramas.shuffle();
          southindian.shuffle();
          return HomePageState(
              stateId: DateTime.now().millisecondsSinceEpoch.toString(),
            pastYearMovieList: pastYear,
            trendingMovieList: trending,
            tenseDramasMovieList: dramas,
            southIndinCinemaMovieList: southindian,
            trendingTvList: state.trendingTvList,
            isLoading: false,
            hasError: false,
          );
        },
      );
      emit(_state1);

      final _state2 = _tvResult.fold(
        (MainFailure failure) {
          return  HomePageState(
              stateId: DateTime.now().millisecondsSinceEpoch.toString(),
            pastYearMovieList: [],
            trendingMovieList: [],
            tenseDramasMovieList: [],
            southIndinCinemaMovieList: [],
            trendingTvList: [],
            isLoading: false,
            hasError: true,
          );
        },
        (HotAndNewRes res) {
          final top10List = res.results;
          return HomePageState(
              stateId: DateTime.now().millisecondsSinceEpoch.toString(),
            pastYearMovieList: state.pastYearMovieList,
            trendingMovieList: top10List,
            tenseDramasMovieList: state.tenseDramasMovieList,
            southIndinCinemaMovieList: state.southIndinCinemaMovieList,
            trendingTvList: top10List,
            isLoading: false,
            hasError: false,
          );
        },
      );

//  send to ui
      emit(_state2);
    });
  }
}
