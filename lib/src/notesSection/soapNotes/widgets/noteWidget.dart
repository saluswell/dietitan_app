import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';

import '../../../../common/helperFunctions/navigatorHelper.dart';
import '../../../../common/utils/appcolors.dart';
import '../../../../common/utils/themes.dart';
import '../../models/noteModel.dart';
import '../screens/editViewSoapNote.dart';

class NoteWidget extends StatefulWidget {
  final NoteModel? noteModel;

  const NoteWidget({Key? key, this.noteModel}) : super(key: key);

  @override
  State<NoteWidget> createState() => _NoteWidgetState();
}

class _NoteWidgetState extends State<NoteWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: InkWell(
        onTap: () {
          toNext(
              context: context,
              widget: EditViewSoapNote(
                noteModel: widget.noteModel,
              ));
        },
        child: SizedBox(
          height: 80,
          width: 300,
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(9),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Patient Name",
                          style: fontW5S12(context)!.copyWith(
                              fontSize: 12,
                              color: AppColors.blackcolor,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.noteModel!.patientName.toString(),
                          style: fontW5S12(context)!.copyWith(
                              fontSize: 12,
                              color: AppColors.blackcolor.withOpacity(0.5),
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Conducted On",
                            style: fontW5S12(context)!.copyWith(
                                fontSize: 12,
                                color: AppColors.blackcolor,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            widget.noteModel!.conductedOn!
                                .toDate()
                                .format(DateTimeFormats.american)
                                .replaceAll("12:00 am", ""),
                            style: fontW5S12(context)!.copyWith(
                                fontSize: 12,
                                color: AppColors.blackcolor.withOpacity(0.4),
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      Icon(Icons.arrow_right)
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
