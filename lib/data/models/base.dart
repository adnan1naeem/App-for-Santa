
import 'package:equatable/equatable.dart';
import 'package:santa/data/models/json_doc.dart';

class BaseModel extends Equatable {

  const BaseModel({required this.jsonDoc});

  final JsonDoc jsonDoc;

  dynamic get data => jsonDoc.data;

  @override
  List<Object?> get props => [jsonDoc];

  @override
  bool get stringify => true;
}
