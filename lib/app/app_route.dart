import 'package:vrouter/vrouter.dart';

import '../features/auth/login_page.dart';
import '../features/notes/notes_page.dart';

class AppRoute extends VRouteElementBuilder {
  @override
  List<VRouteElement> buildRoutes() {
    return [
      VWidget(path: '/login', widget: LoginPage()),
      VWidget(path: '/', widget: NotesPage()),
    ];
  }
}
