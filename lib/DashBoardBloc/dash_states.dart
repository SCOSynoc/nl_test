import 'package:flutter/cupertino.dart';




@immutable
sealed class FeedsState {}

/// fetch feeds
class FeedsInitial extends FeedsState {}

class FeedsFetchFailure extends FeedsState{
  final String error;

  FeedsFetchFailure({required this.error});
}

class FeedsFetchSuccess extends FeedsState {
  final Stream<List<dynamic>> dataMap;
  final String uid;

  FeedsFetchSuccess( {required this.dataMap,required this.uid,});
}

class FeedsLoading extends FeedsState{}