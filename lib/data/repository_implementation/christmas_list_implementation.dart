import 'package:santa/core/domain/christmas_list_repository.dart';
import 'package:santa/data/models/christmas_list/list_data.dart';
import 'package:santa/data/models/json_doc.dart';

class ChristmasListImplementation implements ChristmasListResultRepository {
  @override
  Future<ChristmasListDataModel> getChristmasList(
      {required String name,
      required String country,
      required String status}) async {
    final value = ChristmasListDataModel(
        data: JsonDoc(data: {
      'name': name,
      'country': country,
      'status': status,
    }));

    return value;
  }

  @override
  Future<ChristmasListDataModel> updateChristmasList(
      {required String name,
      required String country,
      required String status,
      }) async {
    final value = ChristmasListDataModel(
        data: JsonDoc(data: {
      'name': name,
      'country': country,
      'status': status,
    }));
    return value;
  }
}
