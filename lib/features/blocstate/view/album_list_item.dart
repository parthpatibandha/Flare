import 'package:flare/core/style/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flare/features/blocstate/data/album.dart';
import 'package:flutter/material.dart';

class AlbumListItem extends StatelessWidget {
  final Album album;

  AlbumListItem(this.album);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Theme.of(context).colorScheme.outline,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          album.title,
          style: Styles.h5Regular,
          textAlign: TextAlign.start,
          maxLines: 2,
        ),
      ),
    );
  }
}
