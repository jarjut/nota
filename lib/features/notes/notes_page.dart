import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';

import '../../widgets/app_drawer.dart';
import 'widgets/list_notes.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const ListNotes(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.vRouter.push('/notes/add'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
