import 'package:santa/data/models/christmas_list/list_data.dart';
import 'package:santa/data/models/json_doc.dart';
import 'package:santa/feature/christmas_list/blocs/christmas_bloc/bloc.dart';
import 'package:test/test.dart';

void main() {
  
  final listData = ChristmasListBloc();
  
  group('Test start, add, delete', () {
    test('ChristmasList should be empty', () {
      listData.christmasData = [];
      expect(listData.christmasData.length, 0);
    });

    test('ChristmasList should add new index', () {
      const value = ChristmasListDataModel(
          data: JsonDoc(data: {
        'name': 'test',
        'country': 'test',
        'status': 'test',
      }));
      listData.christmasData.add(value);

      expect(listData.christmasData.length, 1);
    });

    test('ChristmasList should remove index', () {
      listData.christmasData.removeAt(0);
      expect(listData.christmasData.length, 0);
    });
  });
}
