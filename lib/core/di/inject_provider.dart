import 'package:flutter_mvvm_example/data/datasources/post_remote_data_source_impl.dart';
import 'package:flutter_mvvm_example/data/repositories/post_repository_impl.dart';
import 'package:flutter_mvvm_example/domain/repository/post_repository.dart';
import 'package:flutter_mvvm_example/domain/usecases/fetch_posts_use_case.dart';
import 'package:get_it/get_it.dart';

import 'package:http/http.dart' as http;

final GetIt inject = GetIt.I;

Future<void> initialInjection() async {

  // components
  inject.registerSingleton(http.Client());
  
  // remote services
  inject.registerLazySingleton(() => PostRemoteDataSourceImpl());

  // repositories
  inject.registerLazySingleton(() => PostRepositoryImpl());

  // usecases
  inject.registerLazySingleton(() => FetchPostsUseCase());
}