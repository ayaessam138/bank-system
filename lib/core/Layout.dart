import 'package:banksystem/Features/Customers/persentation/Views/cudtomersView.dart';

import 'package:banksystem/Features/transaction/persentation/views/transaction.dart';
import 'package:banksystem/Features/transaction/persentation/views/transactionhistory.dart';

import 'package:banksystem/core/layout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppLayout extends StatelessWidget {
  static String AppLayoutid = 'AppLayout';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit(),
      child: BlocConsumer<LayoutCubit, LayoutState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          List<Widget> Screens = [Customers(), Transaction(), TransactionHistory()];
          return Scaffold(
              body: Screens[BlocProvider.of<LayoutCubit>(context).currentindex],
              bottomNavigationBar: BottomNavigationBar(
                // backgroundColor: AppColors.white,
                showSelectedLabels: true,
                // selectedItemColor: AppColors.white,
                selectedLabelStyle: TextStyle(color: Colors.black),
                currentIndex:
                    BlocProvider.of<LayoutCubit>(context).currentindex,
                items: BlocProvider.of<LayoutCubit>(context).ITEMS,
                onTap: (index) {
                  BlocProvider.of<LayoutCubit>(context).pagenavgation(index);
                },
              ));
        },
      ),
    );
  }
}
