part of 'transaction_cubit.dart';

@immutable
abstract class TransactionState {}

class TransactionInitial extends TransactionState {}
class AddCustomerTransactionLoading extends TransactionState {}

class AddCustomerTransactionFail extends TransactionState {}

class AddCustomerTransactionSucess extends TransactionState {}
class GetCustomersTransactionLoading extends TransactionState {}

class GetCustomersTransactionFail extends TransactionState {}

class GetCustomersTransactionSucess extends TransactionState {
  final List<TransactionModel> transactionList;

  GetCustomersTransactionSucess({required this.transactionList});
}