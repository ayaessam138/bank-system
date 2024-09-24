

import 'package:banksystem/Features/SignUp/data/Model/signUpModel.dart';
import 'package:banksystem/Features/SignUp/data/repo/signUpRepo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.signInRepo) : super(SignupInitial());
  final SignUpRepo signInRepo;

  Future<void> sigIn({required SignUpModel signUp}) async {
    print('sigInCubit...');
    emit(SignInLoading());
    var result = await signInRepo.signIn(signUp: signUp);
    result.fold((l) => emit(SignInFail()), (r) => emit(SignInSucess(uid: r)));
  }
}
