import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../../../../common/helperFunctions/navigatorHelper.dart';
import '../../../../common/utils/appcolors.dart';
import '../../../../common/utils/themes.dart';
import '../../models/noteModel.dart';
import '../../services/note_services.dart';
import '../widgets/noteWidget.dart';
import 'add_soap_note.dart';

class SoapNotesList extends StatefulWidget {
  final String patientID;
  final String dietitianID;
  final String appointmentID;

  const SoapNotesList(
      {Key? key,
      required this.patientID,
      required this.dietitianID,
      required this.appointmentID})
      : super(key: key);

  @override
  State<SoapNotesList> createState() => _SoapNotesListState();
}

class _SoapNotesListState extends State<SoapNotesList> {
  NoteServices noteServices = NoteServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appcolor,
        title: Text(
          "SOAP Notes List",
          style: fontW5S12(context)!.copyWith(
              fontSize: 14,
              color: AppColors.whitecolor,
              fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
              onPressed: () {
                toNext(
                    context: context,
                    widget: AddSoapNote(
                      patientID: widget.patientID,
                      dietitianID: widget.dietitianID,
                      appointmentID: widget.appointmentID,
                    ));
              },
              icon: Icon(Icons.note_add_outlined)),
        ],
      ),
      body: Column(
        children: [
          StreamProvider.value(
              value: noteServices.streamNotesList(),
              initialData: [NoteModel()],
              builder: (context, child) {
                List<NoteModel> notesList = context.watch<List<NoteModel>>();
                return notesList.isEmpty
                    ? const Center(
                        child: Padding(
                        padding: EdgeInsets.only(top: 220),
                        child: Text("No Notes Found!Add Notes",
                            style: TextStyle(
                                // fontFamily: 'Gilroy',
                                color: AppColors.blackcolor,
                                // decoration: TextDecoration.underline,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Axiforma',
                                fontSize: 13)),
                      ))
                    : notesList[0].dietitanId == null
                        ? const SpinKitPouringHourGlass(
                            size: 30,
                            color: AppColors.appcolor,
                          )
                        : Expanded(
                            child: ListView.builder(
                                itemCount: notesList.length,
                                shrinkWrap: true,
                                padding: EdgeInsets.only(top: 15),
                                itemBuilder: ((context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 12),
                                    child: NoteWidget(
                                      noteModel: notesList[index],
                                    ),
                                  );
                                })),
                          );
              }),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
