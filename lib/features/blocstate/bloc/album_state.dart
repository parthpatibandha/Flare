import 'package:equatable/equatable.dart';
import 'package:flare/features/blocstate/data/album.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AlbumState extends Equatable {
  @override
  List<Object> get props => [];
}

class Initial extends AlbumState {}

class Empty extends AlbumState {}

class Loading extends AlbumState {}

class Loaded extends AlbumState {
  final List<Album> albums;

  Loaded({required this.albums});

  @override
  List<Object> get props => [albums];
}

class Error extends AlbumState {
  final String message;

  Error({required this.message});

  @override
  List<Object> get props => [message];
}
