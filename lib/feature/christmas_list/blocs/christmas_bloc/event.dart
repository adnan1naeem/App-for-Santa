import 'package:equatable/equatable.dart';
import 'package:santa/data/models/christmas_list/list_data.dart';

abstract class ListingEvent extends Equatable {}

class ChristmasListSuccessEvent extends ListingEvent {
  final List<ChristmasListDataModel> childData;
  ChristmasListSuccessEvent({required this.childData});
  @override
  List<dynamic> get props => [childData];
}

class AddChristmasList extends ListingEvent {
  final String name;
  final String country;
  final String status;

  AddChristmasList(
      {required this.name, required this.country, required this.status});
  @override
  List<dynamic> get props => [name, country, status];
}

class UpdatedChristmasList extends ListingEvent {
  final String name;
  final String country;
  final String status;
  final int? index;

  UpdatedChristmasList(
      {this.index,
      required this.name,
      required this.country,
      required this.status});
  @override
  List<dynamic> get props => [name, country, status, index];
}

class DeletedChristmasList extends ListingEvent {
  final int? index;

  DeletedChristmasList({
    this.index,
  });
  @override
  List<dynamic> get props => [index];
}
