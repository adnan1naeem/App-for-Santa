import 'package:equatable/equatable.dart';
import 'package:santa/data/models/child_list/list_data.dart';

abstract class ListingEvent extends Equatable {}

class ChildListSuccessEvent extends ListingEvent {
  final List<ChildListDataModel> childData;
  ChildListSuccessEvent({required this.childData});
  @override
  List<dynamic> get props => [childData];
}

class ChildListEvent extends ListingEvent {
  final String name;
  final String country;
  final String status;

  ChildListEvent(
      {required this.name, required this.country, required this.status});
  @override
  List<dynamic> get props => [name, country, status];
}

class ChildListUpdateEvent extends ListingEvent {
  final String name;
  final String country;
  final String status;
  final int? index;

  ChildListUpdateEvent(
      {this.index,
      required this.name,
      required this.country,
      required this.status});
  @override
  List<dynamic> get props => [name, country, status, index];
}

class DeleteChildListEvent extends ListingEvent {
  final int? index;

  DeleteChildListEvent({
    this.index,
  });
  @override
  List<dynamic> get props => [index];
}
