import 'package:flutter_mvvm_example/domain/usecases/fetch_posts_use_case.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../core/di/inject_provider.dart';
import '../../domain/base/usecase.dart';
import '../../domain/entities/post_entity.dart';

class HomeController extends GetxController {
  FetchPostsUseCase fetchPostUseCase = inject<FetchPostsUseCase>();

  List<PostEntity> _postModel = [];
  List<PostEntity> get postModel => _postModel;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> getPost() async {
    changeLoading();

    final response = await fetchPostUseCase(NoParams());

    response.fold(
      (failure) => _postModel = [],
      (postResponse) => _postModel = postResponse,
    );

    changeLoading();
    update();
  }

  void changeLoading() {
    _isLoading = !_isLoading;
    update();
  }
}
