import 'package:flare/core/utils/string_constants.dart';
import 'package:flare/core/widgets/appbar_widget.dart';
import 'package:flare/features/blocstate/view/album_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flare/core/widgets/loading_widget.dart';
import 'package:flare/core/widgets/message_display.dart';
import 'package:flare/features/blocstate/bloc/album_bloc.dart';
import 'package:flare/features/blocstate/bloc/album_event.dart';
import 'package:flare/features/blocstate/bloc/album_state.dart';

class AlbumScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AlbumScreenState();
  }
}

class AlbumScreenState extends State<AlbumScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(message: StringConstants.screenBlocHttpApiCall),
      body: buildBody(context),
    );
  }

  BlocProvider<AlbumBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => AlbumBloc(),
      child: BlocBuilder<AlbumBloc, AlbumState>(
        builder: (context, state) {
          if (state is Initial) {
            context.read<AlbumBloc>().add(GetAlbum());
            return const MessageDisplay(key: Key("Key"), message: "Loading Album");
          } else if (state is Empty) {
            return const MessageDisplay(key: Key("Key"), message: "No Album Found");
          } else if (state is Loading) {
            return const LoadingWidget(key: Key(""));
          } else if (state is Loaded) {
            return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: state.albums.length,
                itemBuilder: (context, index) {
                  return AlbumListItem(state.albums[index]);
                });
          } else if (state is Error) {
            return MessageDisplay(
              key: Key(state.message),
              message: state.message,
            );
          } else {
            return const MessageDisplay(key: Key("Key"), message: "No Data Found Else");
          }
        },
      ),
    );
  }
}
