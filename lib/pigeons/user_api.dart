import 'package:pigeon/pigeon.dart';

class PigeonUserDetails {
  String? name;
  String? email;
}

@HostApi()
abstract class UserApi {
  List<PigeonUserDetails?> getUserDetails();
}
