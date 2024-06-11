import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neru_test_app/DashBoardBloc/dash_bloc.dart';
import 'package:neru_test_app/DashBoardBloc/dash_events.dart';
import 'package:neru_test_app/DashBoardBloc/dash_states.dart';
import 'package:neru_test_app/widgets/portal_cards.dart';

class DashboardContent extends StatefulWidget {
  const DashboardContent({super.key, this.state});
  final FeedsFetchSuccess? state;

  @override
  State<DashboardContent> createState() => _DashboardContentState();
}

class _DashboardContentState extends State<DashboardContent> {

  @override
  void initState() {
    super.initState();
    context.read<FeedsBloc>().add(FetchFeedsRequested());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Choose Your Industry Below',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: StreamBuilder<List<dynamic>>(
                stream: widget.state?.dataMap ,
                builder: (context, snapshot) {
                 final data = snapshot.data ?? [];
                  return GridView.count(
                    crossAxisCount: MediaQuery.of(context).size.width > 800 ? 4 : 1,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    shrinkWrap: true,
                    children: List.generate(data.length ?? 0, (index) {
                      return buildPortalCard(
                        image: data[index]["image_portal"] ?? "",
                        title: data[index]["portal_name"] ?? "",
                        tip: data[index]["tip_message"] ?? ""
                      );
                    }),
                  );
                }
            ),
          ),
        ],
      ),
    );
  }
}



