import 'package:banksystem/Features/Login/persentation/Views/Login.dart';
import 'package:banksystem/Features/SignUp/data/Model/signUpModel.dart';
import 'package:banksystem/Features/SignUp/persentation/controller/signup_cubit.dart';
import 'package:banksystem/core/widght/Button.dart';
import 'package:banksystem/core/widght/TexFormField.dart';
import 'package:banksystem/core/widght/title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  static String SignUpid = 'SignUp';

  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignInSucess) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Login(),
              ));
        }
        if (state is SignInFail) {
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
                      title: 'Create an',
                    ),
                    const PageTitle(
                      title: 'Account',
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
                      height: 24,
                    ),
                    textFormFieldWidghtWithIcon(
                      controller: confirmPassword,
                      onSaved: (String? val) {

                      },
                      HintText: 'confirm Password',
                      prefix: const Icon(Icons.lock),
                      suffix: const Icon(Icons.remove_red_eye_outlined),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomButton(
                        onTap: () {
                          SignUpModel signUp = SignUpModel(
                              email: userName.text, password: password.text);
                          BlocProvider.of<SignupCubit>(context)
                              .sigIn(signUp: signUp);

                        },
                        backGroundcolor: Colors.blue,
                        title: 'Cerate account',
                        height: 60,
                        width: double.infinity,
                        titleStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 20)),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'I Already Have an Account',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 14),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.blue),
                            ))
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
