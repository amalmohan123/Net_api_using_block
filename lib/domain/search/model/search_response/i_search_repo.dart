import 'package:dartz/dartz.dart';

import 'package:netflix_api/domain/search/model/search_response/search_response.dart';

import '../../../core/failures/main_failures.dart';

abstract class ISearchRepo {
  Future<Either<MainFailure, SearchResponse>> searchMovies({
    required String movieQuery,
  });
}
