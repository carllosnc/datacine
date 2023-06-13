// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetails _$MovieDetailsFromJson(Map<String, dynamic> json) => MovieDetails(
      adult: json['adult'] as bool?,
      backdropPath: json['backdrop_path'] as String?,
      belongsToCollection: json['belongs_to_collection'] == null
          ? null
          : BelongsToCollection.fromJson(
              json['belongs_to_collection'] as Map<String, dynamic>),
      budget: json['budget'] as num?,
      genres: (json['genres'] as List<dynamic>?)
          ?.map((e) => Genre.fromJson(e as Map<String, dynamic>))
          .toList(),
      homepage: json['homepage'] as String?,
      id: json['id'] as num?,
      imdbId: json['imdb_id'] as String?,
      originalLanguage: json['original_language'] as String?,
      originalTitle: json['original_title'] as String?,
      overview: json['overview'] as String?,
      popularity: json['popularity'] as num?,
      posterPath: json['poster_path'] as String?,
      productionCompanies: (json['production_companies'] as List<dynamic>?)
          ?.map((e) => ProductionCompany.fromJson(e as Map<String, dynamic>))
          .toList(),
      productionCountries: (json['production_countries'] as List<dynamic>?)
          ?.map((e) => ProductionContry.fromJson(e as Map<String, dynamic>))
          .toList(),
      releaseDate: json['release_date'] as String?,
      revenue: json['revenue'] as num?,
      runtime: json['runtime'] as num?,
      spokenLanguages: (json['spoken_languages'] as List<dynamic>?)
          ?.map((e) => Language.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String?,
      tagline: json['tagline'] as String?,
      title: json['title'] as String?,
      video: json['video'] as bool?,
      voteAverage: json['vote_average'] as num?,
      voteCount: json['vote_count'] as num?,
      externalIds: json['external_ids'] as Map<String, dynamic>?,
      images: (json['images'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            k,
            (e as List<dynamic>?)
                ?.map((e) => ImageItem.fromJson(e as Map<String, dynamic>))
                .toList()),
      ),
      keywords: (json['keywords'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            k,
            (e as List<dynamic>?)
                ?.map((e) => Keyword.fromJson(e as Map<String, dynamic>))
                .toList()),
      ),
      recommendations: json['recommendations'] == null
          ? null
          : MediaList.fromJson(json['recommendations'] as Map<String, dynamic>),
      similar: json['similar'] == null
          ? null
          : MediaList.fromJson(json['similar'] as Map<String, dynamic>),
      videos: (json['videos'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            k,
            (e as List<dynamic>?)
                ?.map((e) => Video.fromJson(e as Map<String, dynamic>))
                .toList()),
      ),
      credits: (json['credits'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            k,
            (e as List<dynamic>)
                .map((e) => PersonItem.fromJson(e as Map<String, dynamic>))
                .toList()),
      ),
    );

Map<String, dynamic> _$MovieDetailsToJson(MovieDetails instance) =>
    <String, dynamic>{
      'backdrop_path': instance.backdropPath,
      'belongs_to_collection': instance.belongsToCollection?.toJson(),
      'imdb_id': instance.imdbId,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'poster_path': instance.posterPath,
      'production_companies':
          instance.productionCompanies?.map((e) => e.toJson()).toList(),
      'production_countries':
          instance.productionCountries?.map((e) => e.toJson()).toList(),
      'release_date': instance.releaseDate,
      'spoken_languages':
          instance.spokenLanguages?.map((e) => e.toJson()).toList(),
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'external_ids': instance.externalIds,
      'credits': instance.credits
          ?.map((k, e) => MapEntry(k, e.map((e) => e.toJson()).toList())),
      'adult': instance.adult,
      'budget': instance.budget,
      'genres': instance.genres?.map((e) => e.toJson()).toList(),
      'homepage': instance.homepage,
      'id': instance.id,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'revenue': instance.revenue,
      'runtime': instance.runtime,
      'status': instance.status,
      'tagline': instance.tagline,
      'title': instance.title,
      'video': instance.video,
      'images': instance.images
          ?.map((k, e) => MapEntry(k, e?.map((e) => e.toJson()).toList())),
      'keywords': instance.keywords
          ?.map((k, e) => MapEntry(k, e?.map((e) => e.toJson()).toList())),
      'recommendations': instance.recommendations?.toJson(),
      'similar': instance.similar?.toJson(),
      'videos': instance.videos
          ?.map((k, e) => MapEntry(k, e?.map((e) => e.toJson()).toList())),
    };
