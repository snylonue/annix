import 'package:annix/ui/page/home/home_action_grid.dart';
import 'package:annix/ui/page/home/home_appbar.dart';
import 'package:annix/ui/page/home/home_playlist.dart';
import 'package:annix/ui/page/home/home_title.dart';
import 'package:annix/ui/route/delegate.dart';
import 'package:annix/ui/widgets/utils/two_side_sliver.dart';
import 'package:annix/ui/widgets/buttons/theme_button.dart';
import 'package:annix/utils/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:annix/i18n/strings.g.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar.large(
              title: const HomeAppBar(),
              centerTitle: true,
              actions: [
                if (!context.isDesktopOrLandscape)
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      AnnixRouterDelegate.of(context).to(name: '/search');
                    },
                  ),
                const ThemeButton(),
              ],
            ),
          ];
        },
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05),
          child: CustomScrollView(
            slivers: content(context),
          ),
        ),
      ),
    );
  }

  List<Widget> content(BuildContext context) {
    return <Widget>[
      const SliverToBoxAdapter(child: HomeActionGrid()),

      ////////////////////////////////////////////////
      TwoSideSliver(
        leftPercentage: context.isDesktopOrLandscape ? 0.5 : 1,
        left: HomeTitle(
          sliver: true,
          title: t.playlists,
          icon: Icons.queue_music_outlined,
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
        right: HomeTitle(
          sliver: true,
          title: t.recent_played,
          icon: Icons.music_note_outlined,
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
      ),
      TwoSideSliver(
        leftPercentage: context.isDesktopOrLandscape ? 0.5 : 1,
        left: const PlaylistView(),
        right: const SliverToBoxAdapter(),
      ),
    ];
  }
}
