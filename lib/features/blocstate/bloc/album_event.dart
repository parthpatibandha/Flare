import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class AlbumEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetAlbum extends AlbumEvent {}