import 'package:banksystem/Features/Customers/data/models/customerModel.dart';
import 'package:banksystem/Features/Customers/persentation/Views/widght/customerHeader.dart';
import 'package:banksystem/Features/Customers/persentation/controller/customers_cubit.dart';
import 'package:banksystem/core/widght/Button.dart';
import 'package:banksystem/core/widght/TexFormField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCustomer extends StatelessWidget {
  AddCustomer({super.key});
  TextEditingController name = TextEditingController();
  TextEditingController balance = TextEditingController();

  HeaderModel model = HeaderModel(
      color: Colors.blue, title: 'AddCustomer', textColor: Colors.white);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HeaderPage(headerModel: model),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
            child: TextformFieldWidght(
              HintText: 'Customer Name',
              controller: name,
              onSaved: (String? val) {
                name.text = val!;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
            child: TextformFieldWidght(
              keyboardType: TextInputType.number,
              HintText: 'Balance',
              controller: balance,
              onSaved: (String? val) {
                balance.text = val!;
              },
            ),
          ),
          CustomButton(
              onTap: () {
                CustomerModel customerModel = CustomerModel(
                    name: name.text, balance: double.parse(balance.text));
                BlocProvider.of<CustomersCubit>(context)
                    .addCustomer(customerModel: customerModel).then((onValue){
                      Navigator.pop(context);
                });
              },
              backGroundcolor: Colors.blue,
              title: 'Add',
              height: 50,
              width: 100,
              titleStyle: TextStyle(color: Colors.white))
        ],
      ),
    );
  }
}
