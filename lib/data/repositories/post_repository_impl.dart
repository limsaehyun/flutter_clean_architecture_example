import 'package:dartz/dartz.dart';
import 'package:flutter_mvvm_example/data/datasources/post_remote_data_source_impl.dart';
import 'package:flutter_mvvm_example/domain/entities/post_entity.dart';
import 'package:flutter_mvvm_example/domain/failure/failure.dart';
import 'package:flutter_mvvm_example/domain/repository/post_repository.dart';

import '../../core/di/inject_provider.dart';
import '../../core/exception/exceptions.dart';
import '../../domain/failure/general_failure.dart';
import '../datasources/post_remote_data_source.dart';

class PostRepositoryImpl implements PostRepository {
  PostRemoteDataSource postRemoteDataSource = inject<PostRemoteDataSourceImpl>();

  @override
  Future<Either<Failure, List<PostEntity>>> fetchPosts() async {
    try {
      final response = await postRemoteDataSource.fetchPosts();
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
