import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:santa/core/helper/app_colors.dart';
import 'package:santa/feature/child_list/blocs/child_bloc/bloc.dart';
import 'package:santa/feature/child_list/blocs/child_bloc/state.dart';
import 'package:santa/feature/child_list/presentation/widgets/custom_dialog.dart';
import 'package:santa/feature/child_list/presentation/widgets/list_tile.dart';

class ChildListScreen extends StatefulWidget {
  const ChildListScreen({super.key});

  @override
  State<ChildListScreen> createState() => _ChildListScreenState();
}

class _ChildListScreenState extends State<ChildListScreen> {
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
          BlocBuilder<ChildListBloc, ChildListState>(builder: (context, state) {
        if (state is ChildListSuccessState) {
          if (state.childList.isEmpty) {
            return const Center(
              child: Text(
                'Child List is Empty',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            );
          } else {
            return ListView.builder(
                itemCount: state.childList.length,
                itemBuilder: (context, index) {
                  final entity = state.childList[index];
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
        onPressed: addChildToList,
        backgroundColor: AppColors.lightBackgroundShade2,
        child: const Icon(
          Icons.add_outlined,
          color: AppColors.white,
        ),
      ),
    );
  }

  void addChildToList() {
    showDialog(
        context: context, builder: (context) => const CustomDialogWidget());
  }
}
