// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonDetails _$PersonDetailsFromJson(Map<String, dynamic> json) =>
    PersonDetails(
      id: json['id'] as int?,
      name: json['name'] as String?,
      adult: json['adult'] as bool?,
      biography: json['biography'] as String?,
      birthday: json['birthday'] as String?,
      deathday: json['deathday'] as String?,
      gender: json['gender'] as int?,
      homepage: json['homepage'] as String?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      images: (json['images'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            k,
            (e as List<dynamic>?)
                ?.map((e) => ImageItem.fromJson(e as Map<String, dynamic>))
                .toList()),
      ),
      alsoKnownAs: (json['also_known_as'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      imdbId: json['imdb_id'] as String?,
      knownForDepartment: json['known_for_department'] as String?,
      placeOfBirth: json['place_of_birth'] as String?,
      profilePath: json['profile_path'] as String?,
      movieCredits: (json['movie_credits'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            k,
            (e as List<dynamic>)
                .map((e) => MediaItem.fromJson(e as Map<String, dynamic>))
                .toList()),
      ),
      tvCredits: (json['tv_credits'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            k,
            (e as List<dynamic>)
                .map((e) => MediaItem.fromJson(e as Map<String, dynamic>))
                .toList()),
      ),
      combinedCredits: (json['combined_credits'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            k,
            (e as List<dynamic>)
                .map((e) => MediaItem.fromJson(e as Map<String, dynamic>))
                .toList()),
      ),
      externalIds: json['external_ids'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$PersonDetailsToJson(PersonDetails instance) =>
    <String, dynamic>{
      'also_known_as': instance.alsoKnownAs,
      'imdb_id': instance.imdbId,
      'known_for_department': instance.knownForDepartment,
      'place_of_birth': instance.placeOfBirth,
      'profile_path': instance.profilePath,
      'movie_credits': instance.movieCredits
          ?.map((k, e) => MapEntry(k, e.map((e) => e.toJson()).toList())),
      'tv_credits': instance.tvCredits
          ?.map((k, e) => MapEntry(k, e.map((e) => e.toJson()).toList())),
      'combined_credits': instance.combinedCredits
          ?.map((k, e) => MapEntry(k, e.map((e) => e.toJson()).toList())),
      'external_ids': instance.externalIds,
      'id': instance.id,
      'name': instance.name,
      'adult': instance.adult,
      'biography': instance.biography,
      'birthday': instance.birthday,
      'deathday': instance.deathday,
      'gender': instance.gender,
      'homepage': instance.homepage,
      'popularity': instance.popularity,
      'images': instance.images
          ?.map((k, e) => MapEntry(k, e?.map((e) => e.toJson()).toList())),
    };
