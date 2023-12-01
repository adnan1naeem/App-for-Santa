import 'package:santa/data/models/child_list/list_data.dart';

abstract class ChildListResultRepository {
  Future<ChildListDataModel> getChildList({required String name, required String country, required String status});

  Future<ChildListDataModel> updateChildList({required String name, required String country, required String status});
}
