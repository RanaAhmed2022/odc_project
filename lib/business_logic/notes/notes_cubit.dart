import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:meta/meta.dart';
import 'package:odc_workshop/data/data_provider/local/sql_helperl.dart';
import 'package:odc_workshop/data/models/notes_model.dart';
import 'package:odc_workshop/presentation/screens/edit_note/edit_note_screen.dart';
import 'package:odc_workshop/presentation/screens/notes/notes_screen.dart';


part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  static NotesCubit get(context) => BlocProvider.of(context);

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  int? id;
  String? title;
  String? description;
  String? date;
  String datetime = DateTime.now().toString();

  NotesModel? notesModel;

  final GlobalKey<FormState> addNoteKey = GlobalKey<FormState>();
  final GlobalKey<FormState> editNoteKey = GlobalKey<FormState>();

  Future<dynamic> initialize() async {
    SqlHelper.db.then((value) {
      emit(InitialNotesSuccess());
    }).catchError((error) {
      emit(InitialNotesError());
    });
  }

  Future<dynamic> insert(BuildContext context) async {
    SqlHelper.insertDB({
      'Description': '$description',
      'Title': '$title',
      'date': '$datetime',
    }).then((value) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => NotesScreen(),));
      emit(InsertNotesSuccess());
    }).catchError((error) {
      emit(InsertNotesError());
    });
  }

  Future<dynamic> delete(int id) async {
    SqlHelper.deleteDB(id).then((value) {
      emit(DeleteNotesSuccess());
    }).catchError((value) {
      emit(DeleteNotesError());
    });
  }

  Future<dynamic> update(BuildContext context, int id, String title,
      String description, String date) async {
    SqlHelper.updateDB(id, title, description, date).then((value) {
      Navigator.pop(context);
      emit(UpdateNotesSuccess());
    }).catchError((e) {
      emit(UpdateNotesError());
    });
  }

  Future<dynamic> getOneNote(
    BuildContext context,
    int id,
    String title,
    String description,
    String date,
  ) async {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              EditNotesScreen(description: description, id: id, title: title),
        ));
    emit(GetOneRowNotesSuccess());
  }
}
