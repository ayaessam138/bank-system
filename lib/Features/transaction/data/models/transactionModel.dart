import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionModel {
  final String senderName;
  final String recevierName;
  final double balance;
  final DateTime createdAt;

  TransactionModel({required this.senderName,required this.recevierName, required this.balance, required this.createdAt});

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      senderName: json['senderName'],
      recevierName: json['recevierName'],
      balance: json['balance'],
      createdAt:(json["createdAt"] as Timestamp).toDate()
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['senderName'] = senderName;
    data['recevierName'] = recevierName;
    data['balance'] = balance;
    data['createdAt'] = createdAt;

    return data;
  }
}
