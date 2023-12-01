
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:santa/feature/christmas_list/blocs/christmas_bloc/bloc.dart';

class AppBlockProvider {
  List<BlocProvider> get blockProvider => [
    BlocProvider<ChristmasListBloc>(create: (_) => ChristmasListBloc())
  ];
}