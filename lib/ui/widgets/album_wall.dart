import 'package:annix/ui/widgets/album_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class AlbumWall extends StatefulWidget {
  final List<String> albumIds;

  const AlbumWall({super.key, required this.albumIds});

  @override
  State<AlbumWall> createState() => _AlbumWallState();
}

class _AlbumWallState extends State<AlbumWall> {
  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      itemBuilder: (BuildContext context, int index) {
        final albumId = widget.albumIds[index];
        return AlbumGrid(albumId: albumId);
      },
      itemCount: widget.albumIds.length,
    );
  }
}
