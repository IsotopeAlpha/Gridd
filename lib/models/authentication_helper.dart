import 'package:just_app/models/database_helper.dart';
import 'package:just_app/models/user.dart';

class AuthHelper {
  DatabaseHelper con = DatabaseHelper();

  //deletion
  Future<int> deleteUser(User user) async {
    var dbClient = await con.db;
    int res = await dbClient.delete("User");
    return res;
  }

  //insertion
  Future<int> saveUser(User user) async {
    var dbClient = await con.db;
    int res = await dbClient.insert("User", user.toMap());
    List<Map> list = await dbClient.rawQuery('SELECT * FROM User');
    // ignore: avoid_print
    print(list);
    return res;
  }

  Future<User?> getLogin(String username, String password) async {
    var dbClient = await con.db;
    var res = await dbClient.rawQuery(
        "SELECT * FROM user WHERE username = '$username' and password = '$password'");

    if (res.isNotEmpty) {
      return User.fromJson(res.first);
    }
    return null;
  }

  Future<User?> selectUser(User user) async {
    var dbClient = await con.db;
    List<Map> maps = await dbClient.query('User',
        columns: ['USERNAME', 'PASSWORD'],
        where: "USERNAME = ? and PASSWORD = ?",
        whereArgs: [user.username, user.password]);
    // ignore: avoid_print
    print(maps);
    if (maps.isNotEmpty) {
      // ignore: avoid_print
      print("User Exist !!!");
      return user;
    } else {
      return null;
    }
  }
}

class LoginRequest {
  AuthHelper con = AuthHelper();
  Future<User?> getLogin(String username, String password) {
    var result = con.getLogin(username, password);
    return result;
  }
}

abstract class LoginCallBack {
  void onLoginSuccess(User user);
  void onLoginError(String error);
}

class LoginResponse {
  final LoginCallBack _callBack;
  LoginRequest loginRequest = LoginRequest();
  LoginResponse(this._callBack);
  doLogin(String username, String password) {
    loginRequest
        .getLogin(username, password)
        .then((user) => _callBack.onLoginSuccess(user!))
        .catchError((onError) => _callBack.onLoginError(onError.toString()));
  }
}
