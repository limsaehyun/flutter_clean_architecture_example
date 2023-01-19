import 'package:dartz/dartz.dart';
import 'package:flutter_mvvm_example/domain/entities/post_entity.dart';
import 'package:flutter_mvvm_example/domain/failure/failure.dart';

abstract class PostRepository {
  Future<Either<Failure, List<PostEntity>>> fetchPosts();
}
