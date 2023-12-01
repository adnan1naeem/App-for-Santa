import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:santa/core/helper/app_colors.dart';
import 'package:santa/feature/christmas_list/blocs/christmas_bloc/bloc.dart';
import 'package:santa/feature/christmas_list/blocs/christmas_bloc/state.dart';
import 'package:santa/feature/christmas_list/presentation/widgets/custom_dialog.dart';
import 'package:santa/feature/christmas_list/presentation/widgets/list_tile.dart';

class ChristmasListScreen extends StatelessWidget {
  const ChristmasListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.lightBackgroundShade2,
        title: const Text('Children List',
            style: TextStyle(color: AppColors.white)),
      ),
      backgroundColor: AppColors.white,
      body:
          BlocBuilder<ChristmasListBloc, ChristmasListState>(builder: (context, state) {
        if (state is ChristmasListSuccessState) {
          if (state.christmasList.isEmpty) {
            return const Center(
              child: Text(
                'Child List is Empty',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            );
          } else {
            return ListView.builder(
                itemCount: state.christmasList.length,
                itemBuilder: (context, index) {
                  final entity = state.christmasList[index];
                  return ListTileWidget(
                    index: index,
                    title: entity.name,
                    country: entity.country,
                    status: entity.status,
                  );
                });
          }
        } else {
          return const Center(
            child: Text(
              'Child List is Empty',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          );
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=> addChildToList(context: context),
        backgroundColor: AppColors.lightBackgroundShade2,
        child: const Icon(
          Icons.add_outlined,
          color: AppColors.white,
        ),
      ),
    );
  }

  void addChildToList({required BuildContext context}) {
    showDialog(
        context: context, builder: (context) => const CustomDialogWidget());
  }
}
