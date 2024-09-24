
import 'package:banksystem/Features/transaction/data/models/transactionModel.dart';
import 'package:banksystem/Features/transaction/data/repo/TransactionRepo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:intl/intl.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit(this.transactionRepo) : super(TransactionInitial());
  final TransactionRepo transactionRepo;
  List<TransactionModel> transactionList = [];
  Future<void> getCustomersTransaction() async {
    try {
      print('getCustomersTransaction...');
      emit(GetCustomersTransactionLoading());

      var result = await transactionRepo.getCustomersTransaction();
      result.fold((l) {
        emit(GetCustomersTransactionFail());
      }, (r) {
        transactionList = r;
        for(var i in transactionList){
          formatTransactionDate(date: i.createdAt.toString());
        }
        emit(GetCustomersTransactionSucess(transactionList: r));
      });
    } on Exception catch (e) {
      emit(GetCustomersTransactionFail());
      print(e.toString());
    }
    // result.fold((l) => emit(CustomersFail()), (r) => emit(CustomersSucess()));
  }

  Future<void> addCustomerTransaction(
      {required TransactionModel transactionModel}) async {
    try {
      print('CustomersCubit...');
      emit(AddCustomerTransactionLoading());

      await transactionRepo.addCustomerTransaction(
          transactionModel: transactionModel);
      emit(AddCustomerTransactionSucess());
    } on Exception catch (e) {
      emit(AddCustomerTransactionFail());
      print(e.toString());
    }
    // result.fold((l) => emit(CustomersFail()), (r) => emit(CustomersSucess()));
  }

  String getDayWithSuffix(int day) {
    if (day >= 11 && day <= 13) {
      return '${day}th';
    }
    switch (day % 10) {
      case 1:
        return '${day}st';
      case 2:
        return '${day}nd';
      case 3:
        return '${day}rd';
      default:
        return '${day}th';
    }
  }
  String ?formattedDate;
  void formatTransactionDate({required   String date}) {
    DateTime dateTime = DateTime.parse(date);

    String dayWithSuffix = getDayWithSuffix(dateTime.day);
    String month = DateFormat('MMM').format(dateTime);

     formattedDate = "$dayWithSuffix $month";
    print(formattedDate);
  }
}
