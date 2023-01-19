import '../models/response/post_response.dart';

abstract class PostRemoteDataSource {
  Future<List<PostResponse>> fetchPosts();
}