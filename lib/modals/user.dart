class User {
  /*
  This class encapsulates the json response from the api
  {
      'userId': '1908789',
      'username': username,
      'name': 'Peter Clarke',
      'lastLogin': "23 March 2020 03:34 PM",
      'email': 'x7uytx@mundanecode.com'
  }
  */
  late final String _userId;
  late final String _username;
  late final String _name;
  late final String _lastLogin;
  late final String _email;

   constructorUser(
      {required String userId, 
        required String username,
        required String name,
        required String lastLogin,
        required String email}) {
    this._userId = userId;
    this._username = username;
    this._name = name;
    this._lastLogin = lastLogin;
    this._email = email;
  }

  // Properties
  // String get userId => _userId;
  // set userId(String userId) => _userId = userId;
  // String get username => _username;
  // set username(String username) => _username = username;
  // String get name => _name;
  // set name(String name) => _name = name;
  // String get lastLogin => _lastLogin;
  // set lastLogin(String lastLogin) => _lastLogin = lastLogin;
  // String get email => _email;
  // set email(String email) => _email = email;

  // create the user object from json input
  User.fromJson(Map<String, dynamic> json) {
    _userId = json['userId'];
    _username = json['username'];
    _name = json['name'];
    _lastLogin = json['lastLogin'];
    _email = json['email'];
  }

  // exports to json
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this._userId;
    data['username'] = this._username;
    data['name'] = this._name;
    data['lastLogin'] = this._lastLogin;
    data['email'] = this._email;
    return data;
  }
}