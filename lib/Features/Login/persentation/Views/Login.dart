import 'package:banksystem/Features/Login/persentation/controller/login_cubit.dart';
import 'package:banksystem/Features/SignUp/data/Model/signUpModel.dart';
import 'package:banksystem/Features/SignUp/persentation/Views/signUp.dart';
import 'package:banksystem/core/Layout.dart';
import 'package:banksystem/core/widght/Button.dart';
import 'package:banksystem/core/widght/TexFormField.dart';
import 'package:banksystem/core/widght/title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatelessWidget {
  Login({super.key});

  static String Loginid = 'Login';
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSucess) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AppLayout(),
              ));
        }
        if (state is LoginFail) {
          final snackBar = SnackBar(
            content: const Text('Something went Wrong ,Please try again'),
            backgroundColor: (Colors.blue),
            action: SnackBarAction(
              label: 'dismiss',
              onPressed: () {
                // Navigator.pop(context);
              },
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 12),
                    const PageTitle(
                      title: 'Welcome',
                    ),
                    const PageTitle(
                      title: ' Back!',
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    textFormFieldWidghtWithIcon(
                      controller: userName,
                      onSaved: (String? val) {
                        userName.text = val!;
                      },
                      HintText: 'Username or Email',
                      prefix: const Icon(Icons.person),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    textFormFieldWidghtWithIcon(
                      controller: password,
                      onSaved: (String? val) {
                        password.text = val!;
                      },
                      HintText: 'Password',
                      prefix: const Icon(Icons.lock),
                      suffix: const Icon(Icons.remove_red_eye_outlined),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: const Text('Forget Password?',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.blue))),
                      ],
                    ),
                    state is LoginLoading
                        ? const Center(child: CircularProgressIndicator())
                        : CustomButton(
                            onTap: () {
                              SignUpModel login = SignUpModel(
                                  email: userName.text,
                                  password: password.text);
                              BlocProvider.of<LoginCubit>(context)
                                  .login(signUp: login);
                            },
                            backGroundcolor: Colors.blue,
                            title: 'Login',
                            height: 60,
                            width: double.infinity,
                            titleStyle: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600)),
                    const SizedBox(
                      height: 40,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Create An Account',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                              fontSize: 16),
                        ),
                        Text(
                          'Sign Up',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.blue),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
