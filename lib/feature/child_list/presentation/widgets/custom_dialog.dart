import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:santa/core/component/titled_formfield.dart';
import 'package:santa/core/helper/app_colors.dart';
import 'package:santa/core/helper/space.dart';
import 'package:santa/core/theme/app_styles.dart';
import 'package:santa/feature/child_list/blocs/child_bloc/bloc.dart';
import 'package:santa/feature/child_list/blocs/child_bloc/event.dart';

class CustomDialogWidget extends StatefulWidget {
  const CustomDialogWidget(
      {super.key, this.index, this.title, this.status, this.country});
  final String? title;
  final String? country;
  final String? status;
  final int? index;

  @override
  State<CustomDialogWidget> createState() => _CustomDialogWidgetState();
}

class _CustomDialogWidgetState extends State<CustomDialogWidget> {
  TextEditingController childName = TextEditingController();
  TextEditingController countryName = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  String _selectedStatus = 'Nice';

  @override
  void initState() {
    childName.text = widget.title ?? '';
    countryName.text = widget.country ?? '';
    _selectedStatus = widget.status ?? 'Nice';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.white,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text('Add Child',
                          style: AppStyles.text16
                              .copyWith(color: AppColors.black)),
                    ),
                    verticalSpace(20),
                    TitledFormField(
                      title: 'Enter Name',
                      controller: childName,
                      hintText: 'Enter Child Name',
                    ),
                    verticalSpace(5),
                    TitledFormField(
                      title: 'Enter Country',
                      controller: countryName,
                      hintText: 'Enter Country Name',
                    ),
                    verticalSpace(5),
                    Text(
                      "Select Status",
                      style:
                          AppStyles.text16.copyWith(color: AppColors.darkGrey),
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 'Nice',
                          groupValue: _selectedStatus,
                          onChanged: (value) {
                            setState(() {
                              _selectedStatus = value.toString();
                            });
                          },
                          activeColor: AppColors.green,
                        ),
                        const Text('Nice'),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 'Naughty',
                          groupValue: _selectedStatus,
                          onChanged: (value) {
                            setState(() {
                              _selectedStatus = value.toString();
                            });
                          },
                          activeColor: AppColors.green,
                        ),
                        const Text('Naughty'),
                      ],
                    ),
                    verticalSpace(10),
                    Center(
                      child: SizedBox(
                        width: 150,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: onSubmitHandler,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.green,
                          ),
                          child: const Text(
                            'Submit',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onSubmitHandler() {
    if (formKey.currentState!.validate()) {
      if (widget.title != null) {
        context.read<ChildListBloc>().add(ChildListUpdateEvent(
            index: widget.index!,
            name: childName.text.trim(),
            country: countryName.text.trim(),
            status: _selectedStatus));
        Navigator.pop(context);
      } else if (childName.text.isEmpty || countryName.text.isEmpty) {
      } else {
        context.read<ChildListBloc>().add(ChildListEvent(
            name: childName.text.trim(),
            country: countryName.text.trim(),
            status: _selectedStatus));
        Navigator.pop(context);
      }
    }
  }
}
