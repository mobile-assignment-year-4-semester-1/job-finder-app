import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

Future<UserCredential?> signInWithFacebook() async {
  final LoginResult result = await FacebookAuth.instance.login();

  if (result.status != LoginStatus.success) {
    return null;
  }

  final AccessToken? accessToken = result.accessToken;
  if (accessToken == null) return null;

  final OAuthCredential facebookAuthCredential =
      FacebookAuthProvider.credential(accessToken.tokenString);

  return await FirebaseAuth.instance.signInWithCredential(
    facebookAuthCredential,
  );
}
