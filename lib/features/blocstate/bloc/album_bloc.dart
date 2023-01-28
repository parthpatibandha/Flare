import 'dart:convert';
import 'package:flare/core/utils/logger.dart';
import 'package:flare/core/utils/string_constants.dart';
import 'package:flare/features/blocstate/bloc/album_event.dart';
import 'package:flare/features/blocstate/bloc/album_state.dart';
import 'package:flare/features/blocstate/data/album.dart';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  AlbumBloc() : super(Initial()) {
    on<AlbumEvent>((event, emit) async {
      emit(Loading());
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/'));
      final strResponse = response.body.toString();
      Logger.d("Response: " + strResponse);
      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        Iterable l = json.decode(response.body);
        List<Album> albums = List<Album>.from(l.map((model)=> Album.fromJson(model)));
        emit(Loaded(albums: albums));
      } else {
        // If the server did not return a 200 OK response,
        // then set empty.
        emit(Error(message: StringConstants.unknownError));
      }
    });
  }
}
