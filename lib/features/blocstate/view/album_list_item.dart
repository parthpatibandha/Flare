import 'package:flutter/cupertino.dart';
import 'package:flare/features/blocstate/data/album.dart';

class AlbumListItem extends StatelessWidget {
  final Album album;

  AlbumListItem(this.album);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        album.title,
        style: TextStyle(fontSize: 16),
        textAlign: TextAlign.center,
      ),
    );
  }
}
