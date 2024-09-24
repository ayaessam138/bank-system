
import 'package:banksystem/Features/SignUp/data/Model/signUpModel.dart';
import 'package:banksystem/core/Failure.dart';
import 'package:dartz/dartz.dart';

abstract class SignUpRepo {
  Future<Either<Failure, String>> signIn({required SignUpModel signUp});
}
