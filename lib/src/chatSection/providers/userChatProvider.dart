import 'package:flutter/material.dart';

import '../../authenticationsection/Models/userModel.dart';



class UserChatProvider extends ChangeNotifier {
  UserModel? _userModel;

  void saveUserDetails(UserModel? userModel) {
    _userModel = userModel;
    notifyListeners();
  }

  UserModel? getUserDetails() => _userModel;
}
