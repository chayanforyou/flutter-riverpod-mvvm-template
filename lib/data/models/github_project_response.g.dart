// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_project_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GithubProjectResponse _$GithubProjectResponseFromJson(
        Map<String, dynamic> json) =>
    GithubProjectResponse(
      totalCount: (json['total_count'] as num?)?.toInt(),
      incompleteResults: json['incomplete_results'] as bool?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Repository.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GithubProjectResponseToJson(
        GithubProjectResponse instance) =>
    <String, dynamic>{
      'total_count': instance.totalCount,
      'incomplete_results': instance.incompleteResults,
      'items': instance.items,
    };

Repository _$RepositoryFromJson(Map<String, dynamic> json) => Repository(
      name: json['name'] as String?,
      owner: json['owner'] == null
          ? null
          : Owner.fromJson(json['owner'] as Map<String, dynamic>),
      description: json['description'] as String?,
      stargazersCount: (json['stargazers_count'] as num?)?.toInt(),
      forks: (json['forks'] as num?)?.toInt(),
      watchers: (json['watchers'] as num?)?.toInt(),
      score: (json['score'] as num?)?.toDouble(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$RepositoryToJson(Repository instance) =>
    <String, dynamic>{
      'name': instance.name,
      'owner': instance.owner,
      'description': instance.description,
      'stargazers_count': instance.stargazersCount,
      'forks': instance.forks,
      'watchers': instance.watchers,
      'score': instance.score,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

Owner _$OwnerFromJson(Map<String, dynamic> json) => Owner(
      login: json['login'] as String?,
      avatarUrl: json['avatar_url'] as String?,
    );

Map<String, dynamic> _$OwnerToJson(Owner instance) => <String, dynamic>{
      'login': instance.login,
      'avatar_url': instance.avatarUrl,
    };
