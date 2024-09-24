import 'package:flutter/material.dart';

class HeaderPage extends StatelessWidget {
  const HeaderPage({
    super.key, required this.headerModel,
  });
final HeaderModel headerModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: headerModel.color,
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Row(
          children: [
            CircleAvatar(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                headerModel.title,
                // 'AllCustomers',
                style:
                TextStyle(fontWeight: FontWeight.bold, fontSize: 16,color: headerModel.textColor),
              ),
            ),
            Spacer(),
            Icon(Icons.logout)
          ],
        ),
      ),
    );
  }
}
class HeaderModel{
  final Color color;
  final String title;
final Color textColor;
  HeaderModel({required this.color, required this.title,required this.textColor});

}