import 'package:dartz/dartz.dart';
import '../core/failures/main_failures.dart';
import 'model/hot_and_new_res.dart';

abstract class HotAndNewService {
  Future<Either<MainFailure, HotAndNewRes>> getHotAndNewMovieData();
    Future<Either<MainFailure, HotAndNewRes>> getHotAndNewTvData();
 
}
