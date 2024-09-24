import 'package:banksystem/Features/Login/data/repo/loginRepo.dart';
import 'package:banksystem/Features/SignUp/data/Model/signUpModel.dart';
import 'package:banksystem/core/Failure.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LogoInRepoImpl implements LoginRepo {
  @override
  Future<Either<Failure, void>> login({required SignUpModel signUp}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: signUp.email, password: signUp.password);
      print('userCredential');
      print(userCredential);
      return right(userCredential);
    }  on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      print('ServerFailure.fromFirebase(e)');
      print(e.message);
      return Left(ServerFailure.fromFirebase(e));
    } catch (e) {
      print('e.toString(');
      print(e.toString());
      return Left(ServerFailure(e.toString()));
    }
  }
}
