import './movie_dto.dart';
import './tvshow_dto.dart';
import '/domain/domain.dart';

class MediaDto {
  final MovieDto? movieDto;
  final TvShowDto? tvShowDto;

  MediaDto({this.movieDto, this.tvShowDto});

  // get name
  String get name => movieDto?.title ?? tvShowDto?.name ?? 'No name';

  // get date
  String get date => movieDto?.releaseDate ?? tvShowDto?.date ?? 'No date';

  //get poster
  String? get poster => movieDto?.poster ?? tvShowDto?.poster;

  //credits
  Map<String, List<PersonItem>>? get credits =>
      movieDto?.credits ?? tvShowDto?.credits;
}
