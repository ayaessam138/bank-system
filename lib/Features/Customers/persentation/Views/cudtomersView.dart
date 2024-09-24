import 'dart:ui';
import 'package:banksystem/Features/Customers/data/models/customerModel.dart';
import 'package:banksystem/Features/Customers/persentation/Views/addCustomer.dart';
import 'package:banksystem/Features/Customers/persentation/Views/widght/customerHeader.dart';
import 'package:banksystem/Features/Customers/persentation/Views/widght/customerInfo.dart';
import 'package:banksystem/Features/Customers/persentation/controller/customers_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Customers extends StatelessWidget {
  Customers({super.key});

  final customerHeaderModel = HeaderModel(
      color: const Color(0xffFAFAFA),
      title: 'AllCustomers',
      textColor: Colors.black);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          // CustomerModel customerModel=CustomerModel(name: 'aya', balance: 13);
          // BlocProvider.of<CustomersCubit>(context).addCustomer(customerModel: customerModel);
          // BlocProvider.of<CustomersCubit>(context).getCustomers();
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return AddCustomer();
            },
          ));
        },
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
      body: SafeArea(
        child: Column(
          children: [
            HeaderPage(
              headerModel: customerHeaderModel,
            ),
            BlocBuilder<CustomersCubit, CustomersState>(
              builder: (context, state) {
                if (state is GetCustomersSucess) {
                  return Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.customerList.length,
                      itemBuilder: (context, index) {
                        return CustomerInfo(
                          customerModel: state.customerList[index],
                        );
                      },
                    ),
                  );
                } else if (state is GetCustomersFail) {
                  return const Center(
                    child: Text('Failed to Load Customrers'),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
