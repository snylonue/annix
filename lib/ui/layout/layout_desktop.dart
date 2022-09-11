import 'package:annix/ui/route/delegate.dart';
import 'package:annix/ui/bottom_player/bottom_player.dart';
import 'package:flutter/material.dart';
import 'package:annix/i18n/strings.g.dart';

/// F |
///   |
///   |
/// n |
/// a |       body page
/// v |
///   |
///   |
/// __|______________________
///            player
///
class AnnixLayoutDesktop extends StatelessWidget {
  final AnnixRouterDelegate router;
  final Widget child;

  const AnnixLayoutDesktop({
    super.key,
    required this.child,
    required this.router,
  });

  static const pages = <String>[
    '/home',
    '/playing',
    '/tags',
    '/server',
  ];

  @override
  Widget build(BuildContext context) {
    final root = Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Row(
              children: <Widget>[
                (() {
                  final route = router.currentRoute;
                  final selectedIndex =
                      pages.contains(route) ? pages.indexOf(route) : null;

                  return NavigationRail(
                    selectedIndex: selectedIndex,
                    onDestinationSelected: (index) {
                      router.off(name: pages[index]);
                    },
                    labelType: NavigationRailLabelType.all,
                    leading: FloatingActionButton(
                      child: const Icon(Icons.search_outlined),
                      onPressed: () {
                        router.to(name: "/search");
                      },
                    ),
                    groupAlignment: -0.7,
                    destinations: <NavigationRailDestination>[
                      NavigationRailDestination(
                        icon: const Icon(Icons.casino_outlined),
                        label: Text(t.home),
                      ),
                      NavigationRailDestination(
                        icon: const Icon(Icons.music_note_outlined),
                        selectedIcon: const Icon(Icons.music_note_sharp),
                        label: Text(t.playing),
                      ),
                      NavigationRailDestination(
                        icon: const Icon(Icons.local_offer_outlined),
                        label: Text(t.category),
                      ),
                      NavigationRailDestination(
                        icon: const Icon(Icons.dns_outlined),
                        label: Text(t.server.server),
                      ),
                    ],
                  );
                })(),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(child: child),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const DesktopBottomPlayer(),
        ],
      ),
    );

    return Navigator(
      pages: [MaterialPage(child: root)],
      onPopPage: (route, result) {
        return false;
      },
    );
  }
}
