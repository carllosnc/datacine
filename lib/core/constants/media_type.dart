enum MediaType {
  movie('movie'),
  tvshow('tvshow');

  String get value => _value;
  const MediaType(this._value);
  final String _value;
}
