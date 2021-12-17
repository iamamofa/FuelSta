// ignore: file_names
// ignore_for_file: file_names

import '../models/User.dart';

class OtpArgs {
  String token;
  String phone;
  User data;
  OtpArgs(this.token, this.phone, this.data);
}
