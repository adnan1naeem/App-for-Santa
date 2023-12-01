import 'package:santa/data/models/christmas_list/list_data.dart';

abstract class ChristmasListResultRepository {
  Future<ChristmasListDataModel> getChristmasList({required String name, required String country, required String status});

  Future<ChristmasListDataModel> updateChristmasList({required String name, required String country, required String status});
}
