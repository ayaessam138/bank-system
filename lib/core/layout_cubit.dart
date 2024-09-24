import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());

  int currentindex = 0;

  List<BottomNavigationBarItem> ITEMS = [
    const BottomNavigationBarItem(
        label: 'Customers', icon: Icon(Icons.home, color: Colors.blue)),
    const BottomNavigationBarItem(
      label: 'Transacation',
      icon: Icon(Icons.add_card_sharp, color: Colors.blue),
    ),
    const BottomNavigationBarItem(
      label: 'History',
      icon: Icon(Icons.history, color: Colors.blue),
    ),
  ];

  List<String> apppartitle = [
    'Customers',
    'Transacation',
    'History',
  ];
  void pagenavgation(int index) {
    currentindex = index;
    emit(LayoutInitial());
  }
}
