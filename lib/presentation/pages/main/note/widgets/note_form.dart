import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/application/notes/note_form/note_form_bloc.dart';
import 'package:nota/presentation/l10n/l10n.dart';

class NoteForm extends StatelessWidget {
  const NoteForm({super.key});

  @override
  Widget build(BuildContext context) {
    final noteFormBloc = context.read<NoteFormBloc>();

    return BlocBuilder<NoteFormBloc, NoteFormState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state.notFound) {
          return Center(
            child: Text(context.l10n.notePageNotFound),
          );
        }
        return Container(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            child: Column(
              children: [
                TextFormField(
                  initialValue: state.note.title,
                  onChanged: (value) =>
                      noteFormBloc.add(NoteFormEvent.titleChanged(value)),
                  decoration: InputDecoration(
                    hintText: context.l10n.notePageFormTitleHint,
                    border: InputBorder.none,
                  ),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Expanded(
                  child: TextFormField(
                    initialValue: state.note.note,
                    onChanged: (value) =>
                        noteFormBloc.add(NoteFormEvent.bodyChanged(value)),
                    maxLines: null,
                    decoration: InputDecoration(
                      hintText: context.l10n.notePageFormContentHint,
                      border: InputBorder.none,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
