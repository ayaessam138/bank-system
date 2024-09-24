import 'package:banksystem/Features/Customers/data/models/customerModel.dart';

import 'package:banksystem/Features/Customers/data/repo/customersRepo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'customers_state.dart';

class CustomersCubit extends Cubit<CustomersState> {
  CustomersCubit(this.customersRepo) : super(CustomersInitial());
  final CustomersRepo customersRepo;
  Future<void> addCustomer({required CustomerModel customerModel}) async {
    try {
      print('CustomersCubit...');
      emit(AddCustomersLoading());

      await customersRepo.addCustomer(customerModel: customerModel);
      emit(AddCustomersSucess());
    } on Exception catch (e) {
      emit(AddCustomersFail());
      print(e.toString());
    }
    // result.fold((l) => emit(CustomersFail()), (r) => emit(CustomersSucess()));
  }



  List<CustomerModel> customersList = [];
  Future<void> getCustomers() async {
    try {
      print('getCustomers...');
      emit(GetCustomersLoading());

      var result = await customersRepo.getCustomer();
      result.fold((l) {
        emit(GetCustomersFail());
      }, (r) {
        customersList = r;
        emit(GetCustomersSucess(customerList: r));
      });
    } on Exception catch (e) {
      emit(GetCustomersFail());
      print(e.toString());
    }
    // result.fold((l) => emit(CustomersFail()), (r) => emit(CustomersSucess()));
  }



  String? senderId;
  String? senderName;
  selectSender({required String val}) {
    senderId = val;
    for (var i in customersList) {
      if (i.id == senderId) {
        senderName = i.name;
      }
    }
    emit(SelectSender());
  }

  String? recevierId;
  String? recevierName;
  selectRecevier({required String val}) {
    recevierId = val;
    for (var i in customersList) {
      if (i.id == recevierId) {
        recevierName = i.name;
      }
    }
    emit(SelectRecevier());
  }
}
