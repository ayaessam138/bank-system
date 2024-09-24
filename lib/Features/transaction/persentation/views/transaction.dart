import 'package:banksystem/Features/Customers/data/models/customerModel.dart';
import 'package:banksystem/Features/Customers/persentation/Views/widght/customerHeader.dart';
import 'package:banksystem/Features/Customers/persentation/controller/customers_cubit.dart';
import 'package:banksystem/Features/transaction/data/models/transactionModel.dart';
import 'package:banksystem/Features/transaction/persentation/controller/transaction_cubit.dart';
import 'package:banksystem/core/widght/Button.dart';
import 'package:banksystem/core/widght/TexFormField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Transaction extends StatelessWidget {
  Transaction({super.key});

  TextEditingController amountController = TextEditingController();
  HeaderModel transactionHeaderModel = HeaderModel(
      color: Colors.blue, title: 'Transaction', textColor: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: HeaderPage(headerModel: transactionHeaderModel),
      ),
      backgroundColor: const Color(0xffFAFAFA),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 400,
              width: 700,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Column(
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Select Sender',
                        style: TextStyle(color: Color(0xffC2C2C2)),
                      ),
                      Text('Select Recevier',
                          style: TextStyle(color: Color(0xffC2C2C2))),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 80,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 1.0,
                              // spreadRadius: 0.0,
                              offset: Offset(
                                  1.0, 2.0), // shadow direction: bottom right
                            )
                          ],
                        ),
                        child: BlocBuilder<CustomersCubit, CustomersState>(
                          builder: (context, state) {
                            return DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                style: TextStyle(color: Colors.blue),
                                value: BlocProvider.of<CustomersCubit>(context)
                                    .senderId,
                                icon: const Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.blue,
                                ),
                                items: BlocProvider.of<CustomersCubit>(context)
                                    .customersList
                                    .map((CustomerModel customer) {
                                  return DropdownMenuItem<String>(
                                    value: customer.id,
                                    child: Text(customer.name),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  BlocProvider.of<CustomersCubit>(context)
                                      .selectSender(val: newValue!);
                                },
                              ),
                            );

                            // else {
                            //   return DropdownButtonHideUnderline(
                            //     child: DropdownButton<String>(
                            //       icon: const Icon(
                            //         // Add this
                            //         Icons.arrow_drop_down, // Add this
                            //         color: Colors.blue, // Add this
                            //       ),
                            //       items: <String>[].map((String value) {
                            //         return DropdownMenuItem<String>(
                            //           value: value,
                            //           child: Text(value),
                            //         );
                            //       }).toList(),
                            //       onChanged: (_) {},
                            //     ),
                            //   );
                            // }
                          },
                        ),
                      ),
                      Container(
                        width: 80,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 1.0,
                              // spreadRadius: 0.0,
                              offset: Offset(
                                  1.0, 2.0), // shadow direction: bottom right
                            )
                          ],
                        ),
                        child: BlocBuilder<CustomersCubit, CustomersState>(
                            builder: (context, state) {
                          return DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              style: TextStyle(color: Colors.blue),
                              value: BlocProvider.of<CustomersCubit>(context)
                                  .recevierId,
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.blue,
                              ),
                              items: BlocProvider.of<CustomersCubit>(context)
                                  .customersList
                                  .map((CustomerModel customer) {
                                return DropdownMenuItem<String>(
                                  value: customer.id,
                                  child: Text(customer.name),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                BlocProvider.of<CustomersCubit>(context)
                                    .selectRecevier(val: newValue!);
                              },
                            ),
                          );
                        }
                            //   } else {
                            //     return DropdownButtonHideUnderline(
                            //       child: DropdownButton<String>(
                            //         icon: const Icon(
                            //           // Add this
                            //           Icons.arrow_drop_down, // Add this
                            //           color: Colors.blue, // Add this
                            //         ),
                            //         items: <String>[].map((String value) {
                            //           return DropdownMenuItem<String>(
                            //             value: value,
                            //             child: Text(value),
                            //           );
                            //         }).toList(),
                            //         onChanged: (_) {},
                            //       ),
                            //     );
                            //   }
                            // },
                            ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Amount',
                          style: TextStyle(color: Color(0xffC2C2C2)),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        textFormFieldWidghtWithIcon(
                          prefix: const Icon(
                            Icons.monetization_on,
                          ),
                          onSaved: (String? v) {},
                          controller: amountController,
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                  CustomButton(
                    onTap: () {
                      showModalBottomSheet(
                          backgroundColor: Colors.white,
                          context: context,
                          builder: (BuildContext context) {
                            return Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              border: Border.all(
                                                  color: Colors.blue)),
                                          child: Padding(
                                            padding: EdgeInsets.all(12.0),
                                            child: Text('From Sender :' +
                                                "${BlocProvider.of<CustomersCubit>(context).senderName ?? ''}"),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text('Transfer Amount'),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Color(0xffF0F1F5),
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                              '\$ ' + amountController.text,
                                              style: TextStyle(
                                                  color: Colors.blue)),
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              border: Border.all(
                                                  color: Colors.blue)),
                                          child: Padding(
                                            padding: EdgeInsets.all(12.0),
                                            child: Text('From Recevier :' +
                                                "${BlocProvider.of<CustomersCubit>(context).recevierName ?? ''}"),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                  // TextformFieldWidght(controller: TextEditingController(text: 'Fro'), onSaved: (v){}),
                                  // TextformFieldWidght(controller: TextEditingController(text:'' ), onSaved: (v){})
                                  ,
                                  CustomButton(
                                    onTap: () {
                                      TransactionModel transactionModel =
                                          TransactionModel(

                                              senderName: BlocProvider.of<
                                                      CustomersCubit>(context)
                                                  .senderName!,
                                              recevierName: BlocProvider.of<
                                                      CustomersCubit>(context)
                                                  .recevierName!,
                                              balance: double.parse(
                                                  amountController.text), createdAt: DateTime.now());
                                      BlocProvider.of<TransactionCubit>(context)
                                          .addCustomerTransaction(
                                              transactionModel:
                                                  transactionModel)
                                          .then((onValue) {
                                        Navigator.pop(context);
                                      });
                                    },
                                    backGroundcolor: Colors.blue,
                                    title: 'Confirm',
                                    height: 50,
                                    width: 100,
                                    titleStyle:
                                        const TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            );
                          });
                    },
                    backGroundcolor: Colors.blue,
                    title: 'Transfer',
                    height: 50,
                    width: 100,
                    titleStyle: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 40,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// Container(
//   width: 80,
//   decoration: BoxDecoration(
//     color: Colors.white,
//     borderRadius: BorderRadius.circular(12),
//     boxShadow: const [
//       BoxShadow(
//         color: Colors.grey,
//         blurRadius: 1.0,
//         // spreadRadius: 0.0,
//         offset: Offset(
//             1.0, 2.0), // shadow direction: bottom right
//       )
//     ],
//   ),
//   child: DropdownButtonHideUnderline(
//     child: DropdownButton<String>(
//       icon: const Icon(
//         // Add this
//         Icons.arrow_drop_down, // Add this
//         color: Colors.blue, // Add this
//       ),
//       items: <String>['A', 'B', 'C', 'D']
//           .map((String value) {
//         return DropdownMenuItem<String>(
//           value: value,
//           child: Text(value),
//         );
//       }).toList(),
//       onChanged: (_) {},
//     ),
//   ),
// )
