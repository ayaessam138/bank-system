
import 'package:banksystem/Features/Customers/data/repo/CustomerReoImpl.dart';
import 'package:banksystem/Features/Customers/persentation/controller/customers_cubit.dart';
import 'package:banksystem/Features/Login/data/repo/loginRepo.dart';
import 'package:banksystem/Features/Login/data/repo/logoinRepoImpl.dart';
import 'package:banksystem/Features/Login/persentation/controller/login_cubit.dart';
import 'package:banksystem/Features/SignUp/data/repo/signUpRepoImpl.dart';
import 'package:banksystem/Features/SignUp/persentation/Views/signUp.dart';
import 'package:banksystem/Features/SignUp/persentation/controller/signup_cubit.dart';
import 'package:banksystem/Features/Splash/persentation/views/Splash.dart';
import 'package:banksystem/Features/transaction/data/repo/TransactionReoImpl.dart';
import 'package:banksystem/core/BlocObsever.dart';
import 'package:banksystem/core/cache_helper.dart';
import 'package:banksystem/core/shared_prefrence_value.dart';
import 'package:banksystem/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Features/Login/persentation/Views/Login.dart';
import 'Features/transaction/persentation/controller/transaction_cubit.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
 Bloc.observer = MyBlocObserver();
 await CacheHelper.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SignupCubit(SignInRepoImpl()),
        ) ,BlocProvider(
          create: (context) => LoginCubit(LogoInRepoImpl()),
        ),BlocProvider(
          create: (context) => CustomersCubit(CustomerReoImpl())..getCustomers(),
        ),BlocProvider(
          create: (context) => TransactionCubit(TransactionReoImpl())..getCustomersTransaction(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SharedPreferenceValue.GetRegisterMessage().isEmpty?SignUp():Login(),
      ),
    );
  }
}
