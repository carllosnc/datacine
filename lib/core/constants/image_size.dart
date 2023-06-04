enum ImageUrl {
  baseUrl('http://image.tmdb.org/t/p'),
  secureBaseUrl('https://image.tmdb.org/t/p');

  final String _value;
  const ImageUrl(this._value);
  String get value => _value;
}

enum ImageSize {
  backdropW300("w300"),
  backdropW780("w780"),
  backdropW1280("w1280"),
  backdropOriginal("original"),

  logoW45("w45"),
  logoW92("w92"),
  logoW154("w154"),
  logoW185("w185"),
  logoW300("w300"),
  logoW500("w500"),
  logoOriginal("original"),

  posterW92("w92"),
  posterW154("w154"),
  posterW185("w185"),
  posterW342("w342"),
  posterW500("w500"),
  posterW780("w780"),
  posterOriginal("original"),

  stillW92("w92"),
  stillW185("w185"),
  stillW300("w300"),
  stillOriginal("original"),

  profileW45("w45"),
  profileW185("w185"),
  profileH632("h632"),
  profileOriginal("original");

  final String _value;
  const ImageSize(this._value);
  String get value => _value;
}
