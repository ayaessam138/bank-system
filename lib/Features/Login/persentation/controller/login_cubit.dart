import 'package:banksystem/Features/Login/data/repo/loginRepo.dart';
import 'package:banksystem/Features/SignUp/data/Model/signUpModel.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo) : super(LoginInitial());
final LoginRepo loginRepo;
  Future<void> login({required SignUpModel signUp}) async {
    print('loginCubit...');
    emit(LoginLoading());
    var result = await loginRepo.login(signUp: signUp);
    result.fold((l) => emit(LoginFail()), (r) => emit(LoginSucess()));
  }
}
