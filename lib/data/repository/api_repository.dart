import 'package:flutter_assignment/data/models/github_project_response.dart';
import 'package:flutter_assignment/data/network/api_client.dart';
import 'package:flutter_assignment/data/network/dio_singleton.dart';

class ApiRepository {
  static final ApiRepository _instance = ApiRepository._internal();

  late final ApiClient _apiClient;

  ApiRepository._internal() {
    _apiClient = ApiClient(DioSingleton.instance);
  }

  static ApiRepository get instance => _instance;

  Future<List<Repository>> fetchRepositories(String query, String sort, String order, int perPage, int page) async {
    final resp = await _apiClient.fetchRepositories(query, sort, order, perPage, page);
    return resp.items ?? [];
  }
}
