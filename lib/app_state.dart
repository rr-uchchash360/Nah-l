import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _Expense =
          prefs.getStringList('ff_Expense')?.map(double.parse).toList() ??
              _Expense;
    });
    _safeInit(() {
      _Income = prefs.getStringList('ff_Income')?.map(double.parse).toList() ??
          _Income;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<double> _Expense = [];
  List<double> get Expense => _Expense;
  set Expense(List<double> _value) {
    _Expense = _value;
    prefs.setStringList('ff_Expense', _value.map((x) => x.toString()).toList());
  }

  void addToExpense(double _value) {
    _Expense.add(_value);
    prefs.setStringList(
        'ff_Expense', _Expense.map((x) => x.toString()).toList());
  }

  void removeFromExpense(double _value) {
    _Expense.remove(_value);
    prefs.setStringList(
        'ff_Expense', _Expense.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromExpense(int _index) {
    _Expense.removeAt(_index);
    prefs.setStringList(
        'ff_Expense', _Expense.map((x) => x.toString()).toList());
  }

  void updateExpenseAtIndex(
    int _index,
    double Function(double) updateFn,
  ) {
    _Expense[_index] = updateFn(_Expense[_index]);
    prefs.setStringList(
        'ff_Expense', _Expense.map((x) => x.toString()).toList());
  }

  void insertAtIndexInExpense(int _index, double _value) {
    _Expense.insert(_index, _value);
    prefs.setStringList(
        'ff_Expense', _Expense.map((x) => x.toString()).toList());
  }

  List<double> _Income = [];
  List<double> get Income => _Income;
  set Income(List<double> _value) {
    _Income = _value;
    prefs.setStringList('ff_Income', _value.map((x) => x.toString()).toList());
  }

  void addToIncome(double _value) {
    _Income.add(_value);
    prefs.setStringList('ff_Income', _Income.map((x) => x.toString()).toList());
  }

  void removeFromIncome(double _value) {
    _Income.remove(_value);
    prefs.setStringList('ff_Income', _Income.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromIncome(int _index) {
    _Income.removeAt(_index);
    prefs.setStringList('ff_Income', _Income.map((x) => x.toString()).toList());
  }

  void updateIncomeAtIndex(
    int _index,
    double Function(double) updateFn,
  ) {
    _Income[_index] = updateFn(_Income[_index]);
    prefs.setStringList('ff_Income', _Income.map((x) => x.toString()).toList());
  }

  void insertAtIndexInIncome(int _index, double _value) {
    _Income.insert(_index, _value);
    prefs.setStringList('ff_Income', _Income.map((x) => x.toString()).toList());
  }

  List<String> _categories = [];
  List<String> get categories => _categories;
  set categories(List<String> _value) {
    _categories = _value;
  }

  void addToCategories(String _value) {
    _categories.add(_value);
  }

  void removeFromCategories(String _value) {
    _categories.remove(_value);
  }

  void removeAtIndexFromCategories(int _index) {
    _categories.removeAt(_index);
  }

  void updateCategoriesAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _categories[_index] = updateFn(_categories[_index]);
  }

  void insertAtIndexInCategories(int _index, String _value) {
    _categories.insert(_index, _value);
  }

  double _Hand = 0.0;
  double get Hand => _Hand;
  set Hand(double _value) {
    _Hand = _value;
  }

  double _Bank = 0.0;
  double get Bank => _Bank;
  set Bank(double _value) {
    _Bank = _value;
  }

  double _Gold = 0.0;
  double get Gold => _Gold;
  set Gold(double _value) {
    _Gold = _value;
  }

  double _Silver = 0.0;
  double get Silver => _Silver;
  set Silver(double _value) {
    _Silver = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
