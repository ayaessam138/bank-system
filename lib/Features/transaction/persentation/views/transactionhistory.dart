import 'package:banksystem/Features/Customers/persentation/Views/widght/customerHeader.dart';
import 'package:banksystem/Features/transaction/persentation/controller/transaction_cubit.dart';
import 'package:banksystem/Features/transaction/persentation/views/Widght/historyItem.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionHistory extends StatelessWidget {
  TransactionHistory({super.key});

  final historyHeaderModel = HeaderModel(
      color: const Color(0xff607D8B),
      title: 'History',
      textColor: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HeaderPage(headerModel: historyHeaderModel),
          BlocBuilder<TransactionCubit, TransactionState>(
            builder: (context, state) {
              return Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: BlocProvider.of<TransactionCubit>(context)
                      .transactionList
                      .length,
                  itemBuilder: (context, index) {
                    return TransactionHistoryItem(
                      transactionModel:
                          BlocProvider.of<TransactionCubit>(context)
                              .transactionList[index],
                    );
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
