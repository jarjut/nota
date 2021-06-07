import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/app/bloc/authentication_bloc.dart';
import 'package:nota/features/notes/bloc/notes_bloc.dart';
import 'package:nota/models/Note.dart';

class ListNotes extends StatelessWidget {
  const ListNotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = BlocProvider.of<AuthenticationBloc>(context).state.user;
    BlocProvider.of<NotesBloc>(context).add(LoadNotes(user.id));

    return BlocBuilder<NotesBloc, NotesState>(
      builder: (context, state) {
        if (state is NotesLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is NotesLoaded) {
          final notes = state.notes;
          if (notes.isEmpty) {
            return Container();
          } else {
            return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: notes.length,
              itemBuilder: (context, index) {
                final note = notes[index];
                return NoteItem(
                  note: note,
                );
              },
            );
          }
        } else {
          return Container();
        }
      },
    );
  }
}

class NoteItem extends StatelessWidget {
  const NoteItem({
    Key? key,
    required this.note,
  }) : super(key: key);

  final Note note;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('${note.title}'),
    );
  }
}
