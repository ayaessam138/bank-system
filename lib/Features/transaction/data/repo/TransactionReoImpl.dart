

import 'package:banksystem/Features/transaction/data/models/transactionModel.dart';
import 'package:banksystem/Features/transaction/data/repo/TransactionRepo.dart';
import 'package:banksystem/core/Failure.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

class TransactionReoImpl implements TransactionRepo {


  @override
  Future<void> addCustomerTransaction(
      {required TransactionModel transactionModel}) {
    CollectionReference transaction =
        FirebaseFirestore.instance.collection('transaction');

    return transaction
        .add(transactionModel.toJson())
        .then((value) => print("transaction Added"))
        .catchError((error) => print("Failed to add transaction: $error"));
  }

  List<TransactionModel> transactionsList = [];
  @override
  Future<Either<Failure, List<TransactionModel>>>
      getCustomersTransaction() async {
    try {
      var ref =
          await FirebaseFirestore.instance.collection('transaction').get();

      for (var doc in ref.docs) {
        TransactionModel transactionModel =
            TransactionModel.fromJson(doc.data());

        transactionsList.add(transactionModel);
      }
      print('transactionsList');
      print(transactionsList[0].createdAt);
      return right(transactionsList);
    } on Exception catch (e) {
      print(e.toString());
      return left(ServerFailure(e.toString()));
    }
  }
}
