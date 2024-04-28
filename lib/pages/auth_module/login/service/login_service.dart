import 'package:bmi_task/core/local_network/cache_helper.dart';
import 'package:bmi_task/core/utils/constats.dart';
import 'package:bmi_task/pages/auth_module/login/model/auth_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginService extends GetxService {
  UserModel? userModel;

  Future<UserCredential> signInWithGoogle() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
    await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    UserCredential userCredential = await auth.signInWithCredential(credential);
    await userCreate(
      uId: userCredential.user!.uid,
      email: userCredential.user!.email!,
      name: userCredential.user!.displayName!,
        );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<UserCredential?> signInAnonymously() async {
    return FirebaseAuth.instance.signInAnonymously().then((userCredential) {
      if (userCredential != null) {

        userCreate(
          uId: userCredential.user!.uid,
          email: userCredential.user!.email,
          name: userCredential.user!.displayName,
        );
      }
      return userCredential;
    }).catchError((error) {
      if (error is FirebaseAuthException) {
        print(error.code);
        print(error.message);
      } else {
        print('Unexpected error: $error');
      }
      return error;
    });
  }


  Future<bool> userCreate({
    String? name,
    String? email,
    String? uId,
  }) async {
    userModel =
        UserModel(name: name, email: email, uid: uId, );
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uId)
          .set(userModel!.toMap());
      userUid = uId;
      CacheHelper.saveData(key: 'UserId', value: uId);
      await getUser();
      return true;
    } catch (error) {
      debugPrint(error.toString());
      return false;
    }
  }

  Future<UserModel?> getUser() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userUid)
          .get();
      final data = snapshot.data() as Map<String, dynamic>;
      debugPrint('this is data$data');
      return userModel = UserModel.fromJson(data);
    } catch (error) {
      debugPrint('Error getting user data: $error');
      return null;
    }
  }


}
