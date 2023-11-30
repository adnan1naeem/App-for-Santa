import 'package:santa/data/models/child_list/list_data.dart';
import 'package:santa/data/models/json_doc.dart';
import 'package:santa/feature/child_list/blocs/child_bloc/bloc.dart';
import 'package:test/test.dart';

void main() {
  
  final listData = ChildListBloc();
  
  group('Test start, add, delete', () {
    test('ChildList should be empty', () {
      listData.childData = [];
      expect(listData.childData.length, 0);
    });

    test('ChildList should add new index', () {
      const value = ChildListDataModel(
          data: JsonDoc(data: {
        'name': 'test',
        'country': 'test',
        'status': 'test',
      }));
      listData.childData.add(value);

      expect(listData.childData.length, 1);
    });

    test('ChildList should remove index', () {
      listData.childData.removeAt(0);
      expect(listData.childData.length, 0);
    });
  });
}
