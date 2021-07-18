import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vrouter/vrouter.dart';

import '../../../../models/Note.dart';
import '../../main_appbar.dart';
import '../../main_wrapper.dart';
import '../bloc/notes_bloc.dart';

enum NoteMenuPopUp {
  delete,
  archive,
  deletePermanent,
  unarchive,
  restore,
}

class NotePage extends StatefulWidget {
  const NotePage({
    Key? key,
  }) : super(key: key);

  @override
  _NotePageState createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  final _addNoteFormKey = GlobalKey<FormState>();

  TextEditingController? _titleFieldController;
  TextEditingController? _noteFieldController;

  String? noteId;
  Note? note;

  Future<void> _showDeletePermanentDialog(Note note) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Delete Note Permanently'),
            content: const Text(
                "You can't restore this note after deleting permanently"),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  BlocProvider.of<NotesBloc>(context).add(DeleteNote(note));
                  VRouter.of(context).pop();
                },
                child: const Text('Delete'),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final noteId = VRouter.of(context).pathParameters['id'];

    void safeNote() {
      final newNote = note?.copyWith(
        title: _titleFieldController?.text,
        note: _noteFieldController?.text,
      );
      if (newNote != null) {
        BlocProvider.of<NotesBloc>(context).add(UpdateNote(newNote));
      }
    }

    return VWidgetGuard(
      beforeLeave: (vRedirector, _) async {
        safeNote();
      },
      onPop: (vRedirector) async {
        if (vRedirector.historyCanBack()) {
          vRedirector.historyBack();
        } else {
          vRedirector.pop();
        }
      },
      child: MainWrapper(
        appBar: MainAppBar(
          leading: IconButton(
            onPressed: () => VRouter.of(context).pop(),
            icon: const Icon(Icons.arrow_back),
          ),
          actions: [
            PopupMenuButton(
              onSelected: (NoteMenuPopUp selected) {
                if (note != null) {
                  switch (selected) {
                    case NoteMenuPopUp.delete:
                      BlocProvider.of<NotesBloc>(context).add(TrashNote(note!));
                      break;
                    case NoteMenuPopUp.archive:
                      BlocProvider.of<NotesBloc>(context)
                          .add(ArchiveNote(note!));
                      break;
                    case NoteMenuPopUp.unarchive:
                      BlocProvider.of<NotesBloc>(context)
                          .add(UnArchiveNote(note!));
                      break;
                    case NoteMenuPopUp.deletePermanent:
                      _showDeletePermanentDialog(note!);
                      break;
                    case NoteMenuPopUp.restore:
                      BlocProvider.of<NotesBloc>(context)
                          .add(RestoreNote(note!));
                      break;
                    default:
                  }
                }
              },
              itemBuilder: (context) {
                if (note != null) {
                  return <PopupMenuEntry<NoteMenuPopUp>>[
                    note!.deleted
                        ? PopupMenuItem(
                            value: NoteMenuPopUp.restore,
                            child: Row(
                              children: const [
                                Icon(Icons.restore_from_trash),
                                SizedBox(width: 4),
                                Text('Restore Note'),
                              ],
                            ),
                          )
                        : note!.archived
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
                    !note!.deleted
                        ? PopupMenuItem(
                            value: NoteMenuPopUp.delete,
                            child: Row(
                              children: const [
                                Icon(Icons.delete),
                                SizedBox(width: 4),
                                Text('Delete Note'),
                              ],
                            ),
                          )
                        : PopupMenuItem(
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
        drawer: false,
        body: BlocBuilder<NotesBloc, NotesState>(
          builder: (context, state) {
            if (state is NotesLoaded) {
              var noteLoaded = state.notes.firstWhere(
                  (note) => note.id == noteId,
                  orElse: () => Note());

              if (noteLoaded.isEmpty) {
                VRouter.of(context).pop();
              } else if (note != null) {
                if (note!.archived != noteLoaded.archived ||
                    note!.deleted != noteLoaded.deleted) {
                  VRouter.of(context).pop();
                }
              }

              note = noteLoaded;
              _titleFieldController =
                  TextEditingController(text: noteLoaded.title);
              _noteFieldController =
                  TextEditingController(text: noteLoaded.note);

              return Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                child: Form(
                  key: _addNoteFormKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _titleFieldController,
                        decoration: const InputDecoration(
                          hintText: 'Title',
                          border: InputBorder.none,
                        ),
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: _noteFieldController,
                          onEditingComplete: () => print('edit complete'),
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
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleFieldController?.dispose();
    _noteFieldController?.dispose();
    super.dispose();
  }
}
