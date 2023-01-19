import 'package:dartz/dartz.dart';
import 'package:flutter_mvvm_example/data/repositories/post_repository_impl.dart';
import 'package:flutter_mvvm_example/domain/entities/post_entity.dart';

import '../../core/di/inject_provider.dart';
import '../base/usecase.dart';
import '../failure/failure.dart';
import '../repository/post_repository.dart';

class FetchPostsUseCase implements UseCase<List<PostEntity>, NoParams> {
  final PostRepository repository = inject<PostRepositoryImpl>();

  @override
  Future<Either<Failure, List<PostEntity>>> call(NoParams params) async {
    return await repository.fetchPosts();
  }
}
