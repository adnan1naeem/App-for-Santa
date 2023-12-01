import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:santa/data/models/christmas_list/list_data.dart';
import 'package:santa/data/repository_implementation/christmas_list_implementation.dart';
import 'package:santa/feature/christmas_list/blocs/christmas_bloc/event.dart';
import 'package:santa/feature/christmas_list/blocs/christmas_bloc/state.dart';

class ChristmasListBloc extends Bloc<ListingEvent, ChristmasListState> {
  ChristmasListBloc() : super(ChristmasListInitial()) {
    on<AddChristmasList>(getChristmasList);
    on<UpdatedChristmasList>(updateChristmasList);
    on<DeletedChristmasList>(deleteChristmasList);
  }

  ChristmasListImplementation christmasListService = ChristmasListImplementation();
  List<ChristmasListDataModel> christmasData = [];
  void getChristmasList(AddChristmasList event, Emitter emit) async {
    try {
      emit(ChristmasListLoading());
      final value = await christmasListService.getChristmasList(
          name: event.name, country: event.country, status: event.status);
      christmasData.add(value);
      emit(ChristmasListSuccessState(christmasList: christmasData));
    } catch (e) {
      emit(ChristmasListFailureState(
        error: e.toString(),
      ));

    }
  }

  void updateChristmasList(UpdatedChristmasList event, Emitter emit) async {
    try {
      emit(ChristmasListLoading());
      final value = await christmasListService.updateChristmasList(
          name: event.name, country: event.country, status: event.status);
      christmasData[event.index!] = value;
      emit(ChristmasListSuccessState(christmasList: christmasData));
    } catch (e) {
      emit(ChristmasListFailureState(
        error: e.toString(),
      ));
   
    }
  }

  void deleteChristmasList(DeletedChristmasList event, Emitter emit) async {
    try {
      emit(ChristmasListLoading());
      christmasData.removeAt(event.index!);
      emit(ChristmasListSuccessState(christmasList: christmasData));
    } catch (e ) {
      emit(ChristmasListFailureState(
        error: e.toString(),
      ));
 
    }
  }
}
