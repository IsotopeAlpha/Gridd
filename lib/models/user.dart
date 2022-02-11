class User {
  String name;
  String username;
  String password;

  User({required this.name, required this.username, required this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        name: json['NAME'],
        username: json['USERNAME'],
        password: json['PASSWORD']);
  }

  String get _name => name;
  String get _username => username;
  String get _password => password;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map['NAME'] = name;
    map['USERNAME'] = username;
    map['PASSWORD'] = password;
    return map;
  }
}
