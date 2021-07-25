import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';

import '../../app/app_route.dart';
import '../../constants/breakpoints.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final List<Widget>? actions;
  const SearchAppBar({Key? key, this.title, this.actions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > kDesktopBreakpoint;
    final toolbarHeight = isDesktop ? 64.0 : kToolbarHeight;

    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: toolbarHeight,
      actions: actions,
      title: Row(
        children: [
          isDesktop
              ? Container(
                  padding: const EdgeInsets.only(left: 8.0),
                  width: 230.0,
                  alignment: Alignment.centerLeft,
                  child: title ??
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () =>
                              VRouter.of(context).toNamed(AppRoute.NotesRoute),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: 36.0,
                                child:
                                    Image.asset('assets/icons/nota-icon.png'),
                              ),
                              const SizedBox(width: 12.0),
                              Text(
                                'Nota',
                                style: Theme.of(context).textTheme.headline5,
                              ),
                            ],
                          ),
                        ),
                      ),
                )
              : const SizedBox.shrink(),
          Expanded(
            child: InkWell(
              onTap: () =>
                  VRouter.of(context).toNamed(AppRoute.SearchNotesRoute),
              child: Container(
                height: toolbarHeight - 12.0,
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
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
