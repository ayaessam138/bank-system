import 'package:banksystem/Features/Customers/data/models/customerModel.dart';
import 'package:flutter/material.dart';

class CustomerInfo extends StatelessWidget {
  const CustomerInfo({
    super.key, required this.customerModel,
  });
final CustomerModel customerModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xffFFFFFF),
        ),
        child:  Padding(
          padding: EdgeInsets.all(12.0),
          child: Row(
            children: [
              CircleAvatar(),
              SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    customerModel.name,
                    style: TextStyle(
                        color: Color(0xff023648), fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Text(
                       'Balance  ',
                        style: TextStyle(color: Color(0xffB0B0B0)),
                      ),
                      Text(
                        "\$${customerModel.balance}",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
