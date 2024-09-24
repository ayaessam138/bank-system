class CustomerModel {
  final String name;
  final String? id;
  final double balance;

  CustomerModel({required this.name, this.id, required this.balance});

  factory CustomerModel.fromJson(Map<String, dynamic> json,String id) {
    return CustomerModel(
      name: json['name'],
      balance: json['balance'], id: id,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = name;
    data['balance'] = balance;

    return data;
  }
}
