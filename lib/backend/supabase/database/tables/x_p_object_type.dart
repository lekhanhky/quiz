import '../database.dart';

class XPObjectTypeTable extends SupabaseTable<XPObjectTypeRow> {
  @override
  String get tableName => 'XPObjectType';

  @override
  XPObjectTypeRow createRow(Map<String, dynamic> data) => XPObjectTypeRow(data);
}

class XPObjectTypeRow extends SupabaseDataRow {
  XPObjectTypeRow(super.data);

  @override
  SupabaseTable get table => XPObjectTypeTable();

  int get oid => getField<int>('OID')!;
  set oid(int value) => setField<int>('OID', value);

  String? get typeName => getField<String>('TypeName');
  set typeName(String? value) => setField<String>('TypeName', value);

  String? get assemblyName => getField<String>('AssemblyName');
  set assemblyName(String? value) => setField<String>('AssemblyName', value);
}
