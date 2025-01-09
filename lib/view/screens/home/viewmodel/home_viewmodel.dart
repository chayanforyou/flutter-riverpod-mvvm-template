import 'package:flutter_assignment/data/models/github_project_response.dart';
import 'package:flutter_assignment/data/repository/api_repository.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class HomeViewModel {
  final PagingController<int, Repository> pagingController = PagingController(firstPageKey: 1);

  static const String query = "flutter";
  static const String sort = "stars";
  static const String order = "desc";
  static const int pageSize = 10;

  HomeViewModel() {
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await ApiRepository.instance.fetchRepositories(query, sort, order, pageSize, pageKey);

      final isLastPage = newItems.length < pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + 1;
        pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      pagingController.error = error;
    }
  }

  void dispose() {
    pagingController.dispose();
  }
}
