import 'package:equatable/equatable.dart';

class JsonDoc extends Equatable {
  final dynamic data;

  final String? type;

  const JsonDoc({this.data, this.type});

  @override
  List<Object?> get props => [data, type];

  @override
  bool get stringify => true;
}
