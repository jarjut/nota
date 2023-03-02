import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nota/application/notes/bloc/note_form_bloc.dart';
import 'package:nota/application/notes/notes_watch/notes_watch_bloc.dart';
import 'package:nota/domain/notes/i_note_repository.dart';
import 'package:nota/injection.dart';
import 'package:nota/presentation/pages/main/main_app_bar.dart';
import 'package:nota/presentation/pages/main/main_wrapper.dart';

enum NoteMenuPopUp {
  archive,
  unarchive,
  delete,
  restore,
  deletePermanent,
}

class NotePage extends StatelessWidget {
  const NotePage({super.key, this.noteId});

  final String? noteId;

  @override
  Widget build(BuildContext context) {
    final notesBloc = context.read<NotesWatchBloc>();
    return BlocProvider(
      create: (context) => NoteFormBloc(
        notesBloc: notesBloc,
        noteRepository: getIt<INoteRepository>(),
        noteId: noteId,
      )..add(const NoteFormEvent.start()),
      child: const NoteForm(),
    );
  }
}

class NoteForm extends StatelessWidget {
  const NoteForm({super.key});

  @override
  Widget build(BuildContext context) {
    final noteFormBloc = context.read<NoteFormBloc>();

    return BlocBuilder<NoteFormBloc, NoteFormState>(
      builder: (context, state) {
        return MainWrapper(
          appBar: MainAppBar(
            leading: IconButton(
              onPressed: () {
                context.pop();
              },
              icon: const Icon(Icons.arrow_back),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  // TODO: Save note
                },
                icon: const Icon(Icons.done),
              ),
              PopupMenuButton(
                onSelected: (NoteMenuPopUp selected) {
                  if (!state.isNew) {
                    // TODO: Add logic to delete, archive, unarchive, etc.
                    switch (selected) {
                      case NoteMenuPopUp.delete:
                        // BlocProvider.of<NotesBloc>(context)
                        //     .add(TrashNote(note!));
                        break;
                      case NoteMenuPopUp.archive:
                        // BlocProvider.of<NotesBloc>(context)
                        //     .add(ArchiveNote(note!));
                        break;
                      case NoteMenuPopUp.unarchive:
                        // BlocProvider.of<NotesBloc>(context)
                        //     .add(UnArchiveNote(note!));
                        break;
                      case NoteMenuPopUp.deletePermanent:
                        // _showDeletePermanentDialog(note!);
                        break;
                      case NoteMenuPopUp.restore:
                        // BlocProvider.of<NotesBloc>(context)
                        //     .add(RestoreNote(note!));
                        break;
                    }
                  }
                },
                itemBuilder: (context) {
                  if (!state.isNew) {
                    return <PopupMenuEntry<NoteMenuPopUp>>[
                      if (state.note.isDeleted)
                        PopupMenuItem(
                          value: NoteMenuPopUp.restore,
                          child: Row(
                            children: const [
                              Icon(Icons.restore_from_trash),
                              SizedBox(width: 4),
                              Text('Restore Note'),
                            ],
                          ),
                        )
                      else
                        state.note.isArchived
                            ? PopupMenuItem(
                                value: NoteMenuPopUp.unarchive,
                                child: Row(
                                  children: const [
                                    Icon(Icons.unarchive),
                                    SizedBox(width: 4),
                                    Text('Unarchive Note'),
                                  ],
                                ),
                              )
                            : PopupMenuItem(
                                value: NoteMenuPopUp.archive,
                                child: Row(
                                  children: const [
                                    Icon(Icons.archive),
                                    SizedBox(width: 4),
                                    Text('Archive Note'),
                                  ],
                                ),
                              ),
                      if (!state.note.isDeleted)
                        PopupMenuItem(
                          value: NoteMenuPopUp.delete,
                          child: Row(
                            children: const [
                              Icon(Icons.delete),
                              SizedBox(width: 4),
                              Text('Delete Note'),
                            ],
                          ),
                        )
                      else
                        PopupMenuItem(
                          value: NoteMenuPopUp.deletePermanent,
                          child: Row(
                            children: const [
                              Icon(Icons.delete_forever),
                              SizedBox(width: 4),
                              Text('Delete Forever'),
                            ],
                          ),
                        ),
                    ];
                  } else {
                    return <PopupMenuEntry<NoteMenuPopUp>>[];
                  }
                },
              ),
            ],
          ),
          showDrawer: false,
          body: Builder(
            builder: (context) {
              if (state.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state.notFound) {
                return const Center(
                  child: Text('Note not found'),
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
                        decoration: const InputDecoration(
                          hintText: 'Title',
                          border: InputBorder.none,
                        ),
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Expanded(
                        child: TextFormField(
                          initialValue: state.note.note,
                          onChanged: (value) => noteFormBloc
                              .add(NoteFormEvent.bodyChanged(value)),
                          maxLines: null,
                          decoration: const InputDecoration(
                            hintText: 'Write your notes here',
                            border: InputBorder.none,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
