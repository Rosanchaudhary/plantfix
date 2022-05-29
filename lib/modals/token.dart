class Token{
  String refresh;
  String access;
  Token(this.refresh, this.access);
  factory Token.fromJson(dynamic json) {
    return Token(json['refresh'] , json['access']);
  }
  @override
  String toString() {
    return '{ ${this.refresh}, ${this.access} }';
  }
}
