import 'package:flutter_assignment/data/models/github_project_response.dart';
import 'package:flutter_assignment/data/repository/api_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class HomeViewModel extends StateNotifier<PagingState<int, Repository>> {
  static const String query = "flutter";
  static const String sort = "stars";
  static const String order = "desc";
  static const int pageSize = 10;

  HomeViewModel() : super(PagingState());

  Future<void> fetchNextPage() async {
    if (state.isLoading || state.hasNextPage == false) return;

    final pageKey = (state.keys?.last ?? -1) + 1;

    state = state.copyWith(isLoading: true, error: null);

    try {
      final items = await ApiRepository.instance.fetchRepositories(
        query,
        sort,
        order,
        pageSize,
        pageKey,
      );

      final isLastPage = items.length < pageSize;

      state = state.copyWith(
        pages: [...?state.pages, items],
        keys: [...?state.keys, pageKey],
        hasNextPage: !isLastPage,
        isLoading: false,
      );
    } catch (error) {
      state = state.copyWith(error: error, isLoading: false);
    }
  }
}

final homeViewModelProvider =
    StateNotifierProvider.autoDispose<
      HomeViewModel,
      PagingState<int, Repository>
    >((ref) => HomeViewModel());