enum ImageUrl {
  baseUrl('http://image.tmdb.org/t/p/'),
  secureBaseUrl('https://image.tmdb.org/t/p/');

  final String _value;
  const ImageUrl(this._value);
  String get value => _value;
}

enum BackdropSizes {
  small("w300"),
  medium("w780"),
  large("w1280"),
  original("original");

  final String _value;
  const BackdropSizes(this._value);
  String get value => _value;
}

enum LogoSizes {
  small("w45"),
  medium("w92"),
  large("w154"),
  xlarge("w185"),
  xxlarge("w300"),
  xxxlarge("w500"),
  original("original");

  final String _value;
  const LogoSizes(this._value);
  String get value => _value;
}

enum PosterSizes {
  small("w92"),
  medium("w154"),
  large("w185"),
  xlarge("w342"),
  xxlarge("w500"),
  xxxlarge("w780"),
  original("original");

  final String _value;
  const PosterSizes(this._value);
  String get value => _value;
}

enum ProfileSizes {
  small("w45"),
  medium("w185"),
  large("h632"),
  original("original");

  final String _value;
  const ProfileSizes(this._value);
  String get value => _value;
}

enum StillSizes {
  small("w92"),
  medium("w185"),
  large("w300"),
  original("original");

  final String _value;
  const StillSizes(this._value);
  String get value => _value;
}
