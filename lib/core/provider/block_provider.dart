
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:santa/feature/child_list/blocs/child_bloc/bloc.dart';

class AppBlockProvider {
  List<BlocProvider> get blockProvider => [
    BlocProvider<ChildListBloc>(create: (_) => ChildListBloc())
  ];
}