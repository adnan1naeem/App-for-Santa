import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:santa/data/models/child_list/list_data.dart';
import 'package:santa/data/models/json_doc.dart';
import 'package:santa/feature/child_list/blocs/child_bloc/event.dart';
import 'package:santa/feature/child_list/blocs/child_bloc/state.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class ChildListBloc extends Bloc<ListingEvent, ChildListState> {
  ChildListBloc() : super(ChildListInitial()) {
    on<ChildListEvent>(getChildList);
    on<ChildListUpdateEvent>(updateChildList);
    on<DeleteChildListEvent>(deleteChildList);
  }
  
  List<ChildListDataModel> childData = [];
  void getChildList(ChildListEvent event, Emitter emit) async {
    try {
      final value = ChildListDataModel(
          data: JsonDoc(data: {
        'name': event.name,
        'country': event.country,
        'status': event.status,
      }));
      childData.add(value);
      emit(ChildListLoading());
      emit(ChildListSuccessState(childList: childData));
    } catch (e, stackTrace) {
      emit(ChildListFailureState(
        error: e.toString(),
      ));
      await Sentry.captureException(
        e,
        stackTrace: stackTrace,
      );
    }
  }

  void updateChildList(ChildListUpdateEvent event, Emitter emit) async {
    try {
      childData[event.index!] = ChildListDataModel(
          data: JsonDoc(data: {
        'name': event.name,
        'country': event.country,
        'status': event.status,
      }));
      emit(ChildListLoading());
      emit(ChildListSuccessState(childList: childData));
    } catch (e, stackTrace) {
      emit(ChildListFailureState(
        error: e.toString(),
      ));
      await Sentry.captureException(
        e,
        stackTrace: stackTrace,
      );
    }
  }

  void deleteChildList(DeleteChildListEvent event, Emitter emit) async {
    try {
      childData.removeAt(event.index!);
      emit(ChildListLoading());
      emit(ChildListSuccessState(childList: childData));
    } catch (e, stackTrace) {
      emit(ChildListFailureState(
        error: e.toString(),
      ));
      await Sentry.captureException(
        e,
        stackTrace: stackTrace,
      );
    }
  }

}
