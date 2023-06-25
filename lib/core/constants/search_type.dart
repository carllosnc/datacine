enum SearchType {
  movie('movie'),
  tv('tv'),
  person('person'),
  company('company');

  String get value => _value;
  const SearchType(this._value);
  final String _value;
}
