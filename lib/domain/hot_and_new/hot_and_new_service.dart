import 'package:dartz/dartz.dart';
import 'package:netflix_api/domain/hot_and_new/model/hot_and_new_res.dart';

import '../core/failures/main_failures.dart';


abstract class HotAndNewService {
  Future<Either<MainFailure, HotAndNewRes>> getHotAndNewMovieData();
    Future<Either<MainFailure, HotAndNewRes>> getHotAndNewTvData();
 
}