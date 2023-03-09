import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nota/core/constants/breakpoints.dart';
import 'package:nota/presentation/l10n/l10n.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SearchAppBar({super.key, this.title, this.actions});
  final Widget? title;
  final List<Widget>? actions;

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
          if (isDesktop)
            Container(
              padding: const EdgeInsets.only(left: 8),
              width: 230,
              alignment: Alignment.centerLeft,
              child: title ??
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        context.go('/notes');
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 36,
                            child: Image.asset('assets/icons/nota-icon.png'),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            context.l10n.appName,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ],
                      ),
                    ),
                  ),
            )
          else
            const SizedBox.shrink(),
          Expanded(
            child: InkWell(
              onTap: () {
                // TODO: Navigate to search page
              },
              child: Container(
                height: toolbarHeight - 12.0,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(6),
                child: Row(
                  children: [
                    Builder(
                      builder: (context) {
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
                              onPressed: () =>
                                  Scaffold.of(context).openDrawer(),
                              icon: const Icon(Icons.menu),
                            ),
                          );
                        }
                      },
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Text(
                      context.l10n.searchNotesBarHint,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 18,
                            color: Theme.of(context).hintColor,
                          ),
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
