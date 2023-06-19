enum MediaType {
  movie('movie'),
  tv('tv');

  String get value => _value;
  const MediaType(this._value);
  final String _value;
}
