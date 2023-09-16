import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BudgetsRecord extends FirestoreRecord {
  BudgetsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  bool hasAmount() => _amount != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _amount = castToType<double>(snapshotData['amount']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('budgets');

  static Stream<BudgetsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BudgetsRecord.fromSnapshot(s));

  static Future<BudgetsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BudgetsRecord.fromSnapshot(s));

  static BudgetsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BudgetsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BudgetsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BudgetsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BudgetsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BudgetsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBudgetsRecordData({
  String? name,
  String? description,
  double? amount,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'amount': amount,
    }.withoutNulls,
  );

  return firestoreData;
}

class BudgetsRecordDocumentEquality implements Equality<BudgetsRecord> {
  const BudgetsRecordDocumentEquality();

  @override
  bool equals(BudgetsRecord? e1, BudgetsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.amount == e2?.amount;
  }

  @override
  int hash(BudgetsRecord? e) =>
      const ListEquality().hash([e?.name, e?.description, e?.amount]);

  @override
  bool isValidKey(Object? o) => o is BudgetsRecord;
}
