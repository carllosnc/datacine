// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tvshow_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TvShowDetails _$TvShowDetailsFromJson(Map<String, dynamic> json) =>
    TvShowDetails(
      adult: json['adult'] as bool?,
      backdropPath: json['backdrop_path'] as String?,
      createdBy: (json['created_by'] as List<dynamic>?)
          ?.map((e) => PersonItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      episodeRunTime: (json['episode_run_time'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
      firstAirDate: json['first_air_date'] as String?,
      genres: (json['genres'] as List<dynamic>?)
          ?.map((e) => Genre.fromJson(e as Map<String, dynamic>))
          .toList(),
      homepage: json['homepage'] as String?,
      id: json['id'] as int?,
      inProduction: json['in_production'] as bool?,
      languages: (json['languages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      lastAirDate: json['last_air_date'] as String?,
      name: json['name'] as String?,
      numberOfEpisodes: json['number_of_episodes'] as int?,
      numberOfSeasons: json['number_of_seasons'] as int?,
      originCountry: (json['origin_country'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      originalLanguage: json['original_language'] as String?,
      originalName: json['original_name'] as String?,
      overview: json['overview'] as String?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      posterPath: json['poster_path'] as String?,
      productionCompanies: (json['production_companies'] as List<dynamic>?)
          ?.map((e) => ProductionCompany.fromJson(e as Map<String, dynamic>))
          .toList(),
      productionCountries: (json['production_countries'] as List<dynamic>?)
          ?.map((e) => ProductionContry.fromJson(e as Map<String, dynamic>))
          .toList(),
      seasons: (json['seasons'] as List<dynamic>?)
          ?.map((e) => Season.fromJson(e as Map<String, dynamic>))
          .toList(),
      spokenLanguages: (json['spoken_languages'] as List<dynamic>?)
          ?.map((e) => Language.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String?,
      tagline: json['tagline'] as String?,
      type: json['type'] as String?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      voteCount: json['vote_count'] as int?,
      videos: (json['videos'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            k,
            (e as List<dynamic>)
                .map((e) => Video.fromJson(e as Map<String, dynamic>))
                .toList()),
      ),
      images: (json['images'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            k,
            (e as List<dynamic>)
                .map((e) => ImageItem.fromJson(e as Map<String, dynamic>))
                .toList()),
      ),
      aggregateCredits:
          (json['aggregate_credits'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            k,
            (e as List<dynamic>)
                .map((e) => PersonItem.fromJson(e as Map<String, dynamic>))
                .toList()),
      ),
      credits: (json['credits'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            k,
            (e as List<dynamic>)
                .map((e) => PersonItem.fromJson(e as Map<String, dynamic>))
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
    )..externalIds = json['external_ids'] as Map<String, dynamic>?;

Map<String, dynamic> _$TvShowDetailsToJson(TvShowDetails instance) =>
    <String, dynamic>{
      'backdrop_path': instance.backdropPath,
      'created_by': instance.createdBy?.map((e) => e.toJson()).toList(),
      'episode_run_time': instance.episodeRunTime,
      'first_air_date': instance.firstAirDate,
      'in_production': instance.inProduction,
      'last_air_date': instance.lastAirDate,
      'number_of_episodes': instance.numberOfEpisodes,
      'number_of_seasons': instance.numberOfSeasons,
      'origin_country': instance.originCountry,
      'original_language': instance.originalLanguage,
      'original_name': instance.originalName,
      'poster_path': instance.posterPath,
      'production_companies':
          instance.productionCompanies?.map((e) => e.toJson()).toList(),
      'production_countries':
          instance.productionCountries?.map((e) => e.toJson()).toList(),
      'spoken_languages':
          instance.spokenLanguages?.map((e) => e.toJson()).toList(),
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'aggregate_credits': instance.aggregateCredits
          ?.map((k, e) => MapEntry(k, e.map((e) => e.toJson()).toList())),
      'recommendations': instance.recommendations?.toJson(),
      'external_ids': instance.externalIds,
      'languages': instance.languages,
      'name': instance.name,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'seasons': instance.seasons?.map((e) => e.toJson()).toList(),
      'genres': instance.genres?.map((e) => e.toJson()).toList(),
      'homepage': instance.homepage,
      'id': instance.id,
      'adult': instance.adult,
      'status': instance.status,
      'tagline': instance.tagline,
      'type': instance.type,
      'videos': instance.videos
          ?.map((k, e) => MapEntry(k, e.map((e) => e.toJson()).toList())),
      'images': instance.images
          ?.map((k, e) => MapEntry(k, e.map((e) => e.toJson()).toList())),
      'credits': instance.credits
          ?.map((k, e) => MapEntry(k, e.map((e) => e.toJson()).toList())),
      'keywords': instance.keywords
          ?.map((k, e) => MapEntry(k, e?.map((e) => e.toJson()).toList())),
      'similar': instance.similar?.toJson(),
    };
