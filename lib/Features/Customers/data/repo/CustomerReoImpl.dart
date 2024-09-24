import 'package:banksystem/Features/Customers/data/models/customerModel.dart';
import 'package:banksystem/Features/Customers/data/repo/customersRepo.dart';

import 'package:banksystem/core/Failure.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

class CustomerReoImpl implements CustomersRepo {
  @override
  Future<void> addCustomer({required CustomerModel customerModel}) {
    CollectionReference customers =
        FirebaseFirestore.instance.collection('Customers');

    return customers
        .add(customerModel.toJson())
        .then((value) => print("customer Added"))
        .catchError((error) => print("Failed to add customer: $error"));
  }

  List<CustomerModel> customersList = [];

  @override
  Future<Either<Failure, List<CustomerModel>>> getCustomer() async {
    try {
      var ref = await FirebaseFirestore.instance.collection('Customers').get();

      for (var doc in ref.docs) {
        CustomerModel customerModel =
            CustomerModel.fromJson(doc.data(), doc.id);

        customersList.add(customerModel);
      }
      print('customersList');
      print(customersList);
      return right(customersList);
    } on Exception catch (e) {
      print(e.toString());
      return left(ServerFailure(e.toString()));
    }
  }


}
