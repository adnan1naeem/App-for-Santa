import 'package:equatable/equatable.dart';
import 'package:santa/data/models/child_list/list_data.dart';

abstract class ChildListState extends Equatable {}

class ChildListInitial extends ChildListState {
  @override
  List<dynamic> get props => [];
}

class ChildListLoading extends ChildListState {
  @override
  List<dynamic> get props => [];
}

class ChildListSuccessState extends ChildListState {
  final List<ChildListDataModel> childList;

  ChildListSuccessState({required this.childList});

  @override
  List<dynamic> get props => [childList];
}

class ChildListFailureState extends ChildListState {
  final String error;

  ChildListFailureState({
    required this.error,
  });

  @override
  List<dynamic> get props => [error];
}
