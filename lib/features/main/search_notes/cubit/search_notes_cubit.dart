import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../models/note.dart';

part 'search_notes_state.dart';

class SearchNotesCubit extends Cubit<SearchNotesState> {
  SearchNotesCubit() : super(SearchNotesInitial());

  void searchNotes(List<Note> notes, String word) {
    final searchedNotes = notes
        .where((note) =>
            note.title.toLowerCase().contains(word.toLowerCase()) ||
            note.note.toLowerCase().contains(word.toLowerCase()))
        .toList();
    emit(SearchNotesLoaded(searchedNotes));
  }
}
