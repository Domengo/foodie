import 'package:hive/hive.dart';
import '../database/user.dart';


class AuthService {
  Box<User> userBox = Hive.box('userBox');

  Future<void> signUp(String email, String password) async {
    final user = User(email: email, password: password);
    await userBox.put('user', user);
  }

  Future<bool> signIn(String email, String password) async {
    User savedUser = userBox.get('user');

    if (savedUser.email == email && savedUser.password == password) {
      return true;
    } else {
      return false;
    }
  }

  void signOut() {
    userBox.delete('user');
  }
}
