

import 'package:banksystem/Features/SignUp/data/Model/signUpModel.dart';
import 'package:banksystem/Features/SignUp/data/repo/signUpRepo.dart';
import 'package:banksystem/core/Failure.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/shared_prefrence_value.dart';

class SignInRepoImpl implements SignUpRepo {
  @override
  Future<Either<Failure, String>> signIn({required SignUpModel signUp}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: signUp.email, password: signUp.password);
      SharedPreferenceValue.SaveRegisterMessage(userCredential.user?.uid ?? '');
      return right(userCredential.user?.uid ?? '');

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      return Left(ServerFailure.fromFirebase(e));
    }catch (e) {
      print(e.toString());
      return left(ServerFailure(e.toString()));
    }
  }
}
