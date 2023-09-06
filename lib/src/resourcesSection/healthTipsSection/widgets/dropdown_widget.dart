import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../res.dart';
import '../../../../common/utils/appcolors.dart';

class CustomDropDownWidget extends StatelessWidget {
  CustomDropDownWidget(
      {Key? key, this.onChanged, required this.value, required this.list})
      : super(key: key);

  Function(String?)? onChanged;
  final String value;
  final List<String> list;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.whitecolor, borderRadius: BorderRadius.circular(9)),
      child: Card(
        shape: RoundedRectangleBorder(
            side: BorderSide(
                width: 1.5,
                color: AppColors.lightdarktextcolor.withOpacity(0.3)),
            borderRadius: BorderRadius.circular(7)),
        elevation: 6,
        child: Center(
          child: DropdownButton(
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppColors.blackcolor.withOpacity(0.7)),
              // Initial Value
              value: value,
              underline: const SizedBox(),
              dropdownColor: AppColors.whitecolor,

              // Down Arrow Icon
              icon: const Padding(
                padding: EdgeInsets.only(left: 110),
                child: Icon(Icons.arrow_drop_down_sharp),
              ),

              // Array list of items
              items: list.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: onChanged),
        ),
      ),
    );
  }
}
