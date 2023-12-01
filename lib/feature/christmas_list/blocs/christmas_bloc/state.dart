import 'package:equatable/equatable.dart';
import 'package:santa/data/models/christmas_list/list_data.dart';

abstract class ChristmasListState extends Equatable {}

class ChristmasListInitial extends ChristmasListState {
  @override
  List<dynamic> get props => [];
}

class ChristmasListLoading extends ChristmasListState {
  @override
  List<dynamic> get props => [];
}

class ChristmasListSuccessState extends ChristmasListState {
  final List<ChristmasListDataModel> christmasList;

  ChristmasListSuccessState({required this.christmasList});

  @override
  List<dynamic> get props => [christmasList];
}

class ChristmasListFailureState extends ChristmasListState {
  final String error;

  ChristmasListFailureState({
    required this.error,
  });

  @override
  List<dynamic> get props => [error];
}
