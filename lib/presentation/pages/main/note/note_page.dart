import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nota/application/auth/auth_bloc.dart';
import 'package:nota/application/notes/bloc/note_form_bloc.dart';
import 'package:nota/application/notes/notes_watch/notes_watch_bloc.dart';
import 'package:nota/domain/notes/i_note_repository.dart';
import 'package:nota/injection.dart';
import 'package:nota/presentation/l10n/l10n.dart';
import 'package:nota/presentation/pages/main/main_app_bar.dart';
import 'package:nota/presentation/pages/main/main_wrapper.dart';
import 'package:nota/presentation/pages/main/note/widgets/note_form.dart';

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
      child: const NoteBody(),
    );
  }
}

class NoteBody extends StatelessWidget {
  const NoteBody({super.key});

  @override
  Widget build(BuildContext context) {
    final noteFormBloc = context.read<NoteFormBloc>();

    return BlocConsumer<NoteFormBloc, NoteFormState>(
      listener: (context, state) {
        state.actionFailureOrSuccess?.fold(
          (failure) => failure.map(
            unexpected: (_) => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(context.l10n.errorUnexpected),
              ),
            ),
          ),
          (_) => context.pop(),
        );
      },
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
                  final uid = context.read<AuthBloc>().state.user.id;
                  noteFormBloc.add(NoteFormEvent.save(uid));
                },
                icon: const Icon(Icons.done),
              ),
              PopupMenuButton(
                onSelected: (NoteMenuPopUp selected) {
                  if (!state.isNew) {
                    switch (selected) {
                      case NoteMenuPopUp.archive:
                        noteFormBloc.add(const NoteFormEvent.archive());
                        break;
                      case NoteMenuPopUp.unarchive:
                        noteFormBloc.add(const NoteFormEvent.unarchive());
                        break;
                      case NoteMenuPopUp.delete:
                        noteFormBloc.add(const NoteFormEvent.delete());
                        break;
                      case NoteMenuPopUp.restore:
                        noteFormBloc.add(const NoteFormEvent.restore());
                        break;
                      case NoteMenuPopUp.deletePermanent:
                        showDeletePermanentDialog(context);
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
                            children: [
                              const Icon(Icons.restore_from_trash),
                              const SizedBox(width: 4),
                              Text(context.l10n.noteActionRestore),
                            ],
                          ),
                        )
                      else
                        state.note.isArchived
                            ? PopupMenuItem(
                                value: NoteMenuPopUp.unarchive,
                                child: Row(
                                  children: [
                                    const Icon(Icons.unarchive),
                                    const SizedBox(width: 4),
                                    Text(context.l10n.noteActionUnarchive),
                                  ],
                                ),
                              )
                            : PopupMenuItem(
                                value: NoteMenuPopUp.archive,
                                child: Row(
                                  children: [
                                    const Icon(Icons.archive),
                                    const SizedBox(width: 4),
                                    Text(context.l10n.noteActionArchive),
                                  ],
                                ),
                              ),
                      if (!state.note.isDeleted)
                        PopupMenuItem(
                          value: NoteMenuPopUp.delete,
                          child: Row(
                            children: [
                              const Icon(Icons.delete),
                              const SizedBox(width: 4),
                              Text(context.l10n.noteActionDelete),
                            ],
                          ),
                        )
                      else
                        PopupMenuItem(
                          value: NoteMenuPopUp.deletePermanent,
                          child: Row(
                            children: [
                              const Icon(Icons.delete_forever),
                              const SizedBox(width: 4),
                              Text(context.l10n.noteActionDeletePermanently),
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
          body: const NoteForm(),
        );
      },
    );
  }

  Future<void> showDeletePermanentDialog(BuildContext context) async {
    final noteFormBloc = context.read<NoteFormBloc>();
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(context.l10n.noteActionDeletePermanentlyTitleDialog),
          content: Text(
            context.l10n.noteActionDeletePermanentlyContentDialog,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(context.l10n.cancel),
            ),
            TextButton(
              onPressed: () {
                noteFormBloc.add(const NoteFormEvent.deletePermanent());
                Navigator.pop(context);
              },
              child: Text(context.l10n.delete),
            ),
          ],
        );
      },
    );
  }
}
