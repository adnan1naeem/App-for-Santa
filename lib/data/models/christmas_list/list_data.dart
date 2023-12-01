

import 'package:santa/data/models/base.dart';
import 'package:santa/data/models/json_doc.dart';

class ChristmasListDataModel extends BaseModel {
  const ChristmasListDataModel({required JsonDoc data}) : super(jsonDoc: data);

  String get name => data['name'] ?? '';

  String get country => data['country'] ?? '';

  String get status => data['status'] ?? '';
  @override
  List<dynamic> get props =>
      [name, country, status];
}



