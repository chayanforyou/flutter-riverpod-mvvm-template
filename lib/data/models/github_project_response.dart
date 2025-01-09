import 'package:json_annotation/json_annotation.dart';

part 'github_project_response.g.dart';

@JsonSerializable()
class GithubProjectResponse {
  GithubProjectResponse({
    this.totalCount,
    this.incompleteResults,
    this.items,
  });

  @JsonKey(name: 'total_count')
  int? totalCount;
  @JsonKey(name: 'incomplete_results')
  bool? incompleteResults;
  @JsonKey(name: 'items')
  List<Repository>? items;

  factory GithubProjectResponse.fromJson(Map<String, dynamic> json) => _$GithubProjectResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GithubProjectResponseToJson(this);
}

@JsonSerializable()
class Repository {
  Repository({
    this.name,
    this.owner,
    this.description,
    this.stargazersCount,
    this.forks,
    this.watchers,
    this.score,
    this.createdAt,
    this.updatedAt,
  });

  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'owner')
  Owner? owner;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'stargazers_count')
  int? stargazersCount;
  @JsonKey(name: 'forks')
  int? forks;
  @JsonKey(name: 'watchers')
  int? watchers;
  @JsonKey(name: 'score')
  double? score;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;

  factory Repository.fromJson(Map<String, dynamic> json) => _$RepositoryFromJson(json);

  Map<String, dynamic> toJson() => _$RepositoryToJson(this);
}

@JsonSerializable()
class Owner {
  Owner({
    this.login,
    this.avatarUrl,
  });

  @JsonKey(name: 'login')
  String? login;
  @JsonKey(name: 'avatar_url')
  String? avatarUrl;

  factory Owner.fromJson(Map<String, dynamic> json) => _$OwnerFromJson(json);

  Map<String, dynamic> toJson() => _$OwnerToJson(this);
}
