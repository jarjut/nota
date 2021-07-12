import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';

import '../../../../app/app_route.dart';
import '../../../../constants/breakpoints.dart';

class NotesAppBar extends StatelessWidget implements PreferredSizeWidget {
  const NotesAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AppBar(
      automaticallyImplyLeading: false,
      title: InkWell(
        onTap: () => VRouter.of(context).toNamed(AppRoute.SearchNotesRoute),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.15),
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(6.0),
          child: Row(
            children: [
              Builder(builder: (context) {
                if (size.width >= kDesktopBreakpoint) {
                  return const SizedBox(
                    height: 30,
                    width: 30,
                    child: Icon(Icons.search),
                  );
                } else {
                  return SizedBox(
                    height: 30,
                    width: 30,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () => Scaffold.of(context).openDrawer(),
                      icon: const Icon(Icons.menu),
                    ),
                  );
                }
              }),
              const SizedBox(
                width: 12.0,
              ),
              Text(
                'Search notes',
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    fontSize: 18, color: Theme.of(context).hintColor),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
