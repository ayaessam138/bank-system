import 'package:banksystem/Features/Customers/data/models/customerModel.dart';

import 'package:banksystem/core/Failure.dart';
import 'package:dartz/dartz.dart';

abstract class CustomersRepo {
  Future<void> addCustomer({required CustomerModel customerModel});
  Future<Either<Failure,List<CustomerModel>>> getCustomer();

}
