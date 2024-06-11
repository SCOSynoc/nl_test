import 'package:flutter_bloc/flutter_bloc.dart';

import '../repository/Post_service.dart';
import 'dash_events.dart';
import 'dash_states.dart';

class FeedsBloc extends Bloc<FeedsEvents, FeedsState> {
  FeedsBloc() : super(FeedsInitial()) {
    on<FetchFeedsRequested>(_onFeedsRequested);
  }

  PostService postService = PostService()..initializeInstances();

  void _onFeedsRequested(FetchFeedsRequested event, Emitter<FeedsState> emit){
    emit(FeedsLoading());

    try {
      /*LocalDataService loService = HiveService()..initLocalService();
             dynamic data = await loService.getData(key: "userData");
             log("here data added successfully $data");
             List< dynamic> dataMap = jsonDecode(loService.getData(key: "postData")) ;
             log("here post data map is ${dataMap}");*/
      Stream<List<dynamic>> postList = postService.getAllData();
      print("Here in feedRequested Function() :: ${postList.first}" );
      return emit(FeedsFetchSuccess(uid: "", dataMap: postList));
    } catch (e) {
      return emit(FeedsFetchFailure(error: "$e"));
    }
  }
}