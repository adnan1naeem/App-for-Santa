import 'package:santa/core/domain/child_list_repository.dart';
import 'package:santa/data/models/child_list/list_data.dart';
import 'package:santa/data/models/json_doc.dart';

class ChildListImplementation implements ChildListResultRepository {
  @override
  Future<ChildListDataModel> getChildList(
      {required String name,
      required String country,
      required String status}) async {
    final value = ChildListDataModel(
        data: JsonDoc(data: {
      'name': name,
      'country': country,
      'status': status,
    }));

    return value;
  }

  @override
  Future<ChildListDataModel> updateChildList(
      {required String name,
      required String country,
      required String status,
      }) async {
    final value = ChildListDataModel(
        data: JsonDoc(data: {
      'name': name,
      'country': country,
      'status': status,
    }));
    return value;
  }
}
