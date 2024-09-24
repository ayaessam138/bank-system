import 'package:banksystem/Features/Customers/data/models/customerModel.dart';
import 'package:banksystem/Features/transaction/data/models/transactionModel.dart';

import 'package:banksystem/core/Failure.dart';
import 'package:dartz/dartz.dart';

abstract class TransactionRepo {

  Future<void> addCustomerTransaction({required TransactionModel transactionModel});
  Future<Either<Failure,List<TransactionModel>>> getCustomersTransaction();
}
