import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../common/utils/firebaseUtils.dart';
import '../models/noteModel.dart';

class NoteServices {
  ///Create SOAP note
  Future createSOAPNote(NoteModel noteModel) async {
    DocumentReference docRef =
        FirebaseFirestore.instance.collection(FirebaseUtils.soapNotes).doc();
    return await docRef.set(noteModel.toJson());
  }

  /// stream notes lisy
  Stream<List<NoteModel>> streamNotesList() {
    return FirebaseFirestore.instance
        .collection(FirebaseUtils.soapNotes)
        //.doc()
        //.where("recieverID", isEqualTo: getUserID())

        // .where("appointmentStatus", isEqualTo: appointmentStatus)
        .snapshots()
        .map((list) => list.docs
            .map((singleDoc) => NoteModel.fromJson(singleDoc.data()))
            .toList());
  }
}
