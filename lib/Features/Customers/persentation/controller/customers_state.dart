part of 'customers_cubit.dart';

@immutable
abstract class CustomersState {}

class CustomersInitial extends CustomersState {}

class AddCustomersLoading extends CustomersState {}

class AddCustomersFail extends CustomersState {}

class AddCustomersSucess extends CustomersState {}

class GetCustomersLoading extends CustomersState {}

class GetCustomersFail extends CustomersState {}

class GetCustomersSucess extends CustomersState {
  final List<CustomerModel> customerList;

  GetCustomersSucess({required this.customerList});
}

class SelectSender extends CustomersState {}
class SelectRecevier extends CustomersState {}