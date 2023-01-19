import 'dart:convert';
import 'dart:io';

import 'package:flutter_mvvm_example/data/datasources/post_remote_data_source.dart';
import 'package:flutter_mvvm_example/data/models/response/post_response.dart';

import 'package:http/http.dart';

import '../../core/di/inject_provider.dart';
import '../../core/exception/exceptions.dart';

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  Client client = inject<Client>();

  @override
  Future<List<PostResponse>> fetchPosts() async {
    final response = await client.get(
        Uri.parse("https://jsonplaceholder.typicode.com/posts")
    );

    if(response.statusCode == 200) {
      return (jsonDecode(response.body) as List)
          .map((e) => PostResponse.fromJson(e))
          .toList()
          .cast<PostResponse>();
    } else {
      throw ServerException();
    }
  }
}