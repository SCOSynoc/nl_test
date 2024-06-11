import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neru_test_app/DashBoardBloc/dash_bloc.dart';
import 'package:neru_test_app/DashBoardBloc/dash_events.dart';
import 'package:neru_test_app/DashBoardBloc/dash_states.dart';
import 'package:neru_test_app/widgets/Loading_manager.dart';
import 'package:neru_test_app/widgets/side_drawer.dart';


import '../widgets/common_app_bar.dart';
import '../widgets/dashboard_content.dart';


class DashboardScreen extends StatelessWidget {


  FeedsFetchSuccess? successState;

  @override
  Widget build(BuildContext context) {
    bool failed = false;
    bool loading = false;
    return BlocConsumer<FeedsBloc,FeedsState>(
      listener: (BuildContext context, FeedsState state) {
        if(state is FeedsLoading) {
          loading = true;
        }
        if(state is FeedsFetchSuccess) {
          successState = state;
          loading = false;
        }

        if(state is FeedsFetchFailure) {
          failed = true;
          loading = false;
        }
      },
      builder: (context,state) {
        if (MediaQuery.of(context).size.width > 800) {
          return LoadingManager(

            isLoading: loading,
            child: Scaffold(
              appBar: buildAppBar(leading: false),
              body: Row(
                children: [
                  const Expanded(flex: 1, child: SideMenuDrawer()),
                  Expanded(flex: 5, child: DashboardContent( state: successState, )),
                ],
              ),
            ),
          );
        }
        return LoadingManager(
          isLoading: loading,
          child: Scaffold(
            appBar: buildAppBar(leading: true),
            drawer: const SideMenuDrawer(),
            body: DashboardContent( state:successState,),
          ),
        );

      },
    );

  }
}





