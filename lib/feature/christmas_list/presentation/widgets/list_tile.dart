import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:santa/core/helper/app_colors.dart';
import 'package:santa/core/helper/space.dart';
import 'package:santa/core/theme/app_styles.dart';
import 'package:santa/feature/christmas_list/blocs/christmas_bloc/bloc.dart';
import 'package:santa/feature/christmas_list/blocs/christmas_bloc/event.dart';
import 'package:santa/feature/christmas_list/blocs/christmas_bloc/state.dart';
import 'package:santa/feature/christmas_list/presentation/widgets/custom_dialog.dart';

class ListTileWidget extends StatefulWidget {
  const ListTileWidget(
      {super.key,
      this.index,
      required this.title,
      required this.status,
      required this.country});
  final String title;
  final String country;
  final String status;
  final int? index;

  @override
  State<ListTileWidget> createState() => _ListTileWidgetState();
}

class _ListTileWidgetState extends State<ListTileWidget> {
  void addChildToList() {
    showDialog(
        context: context,
        builder: (context) => CustomDialogWidget(
            index: widget.index,
            title: widget.title,
            country: widget.country,
            status: widget.status));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChristmasListBloc, ChristmasListState>(
        builder: (context, state) {
      return GestureDetector(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 12, top: 10),
          child: Stack(
            children: [
              Dismissible(
                key: Key(widget.title),
                direction: DismissDirection.startToEnd,
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: const Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
                onDismissed: (direction) {
                  context
                      .read<ChristmasListBloc>()
                      .add(DeletedChristmasList(index: widget.index));
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                  margin: const EdgeInsets.only(right: 3),
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: AppColors.green,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text('Name:',
                                    overflow: TextOverflow.ellipsis,
                                    style: AppStyles.text16
                                        .copyWith(color: AppColors.white)),
                                horizontalSpace(40),
                                Expanded(
                                  flex: 1,
                                  child: Text(widget.title,
                                      overflow: TextOverflow.ellipsis,
                                      style: AppStyles.text16
                                          .copyWith(color: AppColors.white)),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text('Country:',
                                    overflow: TextOverflow.ellipsis,
                                    style: AppStyles.text16
                                        .copyWith(color: AppColors.white)),
                                horizontalSpace(21),
                                Expanded(
                                  flex: 1,
                                  child: Text(widget.country,
                                      overflow: TextOverflow.ellipsis,
                                      style: AppStyles.text16
                                          .copyWith(color: AppColors.white)),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text('Status:',
                                    overflow: TextOverflow.ellipsis,
                                    style: AppStyles.text16
                                        .copyWith(color: AppColors.white)),
                                horizontalSpace(35),
                                Expanded(
                                  flex: 1,
                                  child: Text(widget.status,
                                      overflow: TextOverflow.ellipsis,
                                      style: AppStyles.text16
                                          .copyWith(color: AppColors.white)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                          icon: const Icon(
                            Icons.edit,
                            color: AppColors.white,
                          ),
                          onPressed: addChildToList),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
