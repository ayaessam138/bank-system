import 'package:banksystem/Features/transaction/data/models/transactionModel.dart';
import 'package:banksystem/Features/transaction/persentation/controller/transaction_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionHistoryItem extends StatelessWidget {
  const TransactionHistoryItem({
    super.key,
    required this.transactionModel,
  });
  final TransactionModel transactionModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(6)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: const Color(0xffEEEEEE),
                    borderRadius: BorderRadius.circular(6)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                          BlocProvider.of<TransactionCubit>(context)
                                  .formattedDate ??
                              '',
                          style: const TextStyle(fontWeight: FontWeight.w700)),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      const Text('From:'),
                      Text(
                        transactionModel.senderName,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color(0xff37464F)),
                      ),
                    ],
                  ),
                  Text(
                    '\$ ' + '${transactionModel.balance}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xffF04338)),
                  ),
                  const Text(
                    '9:21:3',
                    style: TextStyle(
                      color: Color(0xffA0A0A0),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      const Text('To:'),
                      Text(
                        transactionModel.recevierName,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color(0xff37464F)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    children: [
                      Text(
                        'By:',
                        style: TextStyle(color: Color(0xffA0A0A0)),
                      ),
                      Text(
                        'Admin',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color(0xff417752)),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
