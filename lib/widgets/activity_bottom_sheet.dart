import 'package:chat_app/models/activity_model.dart';
import 'package:chat_app/repo/activity_repo.dart';
import 'package:flutter/material.dart';

class ActivityBottomSheet extends StatelessWidget {
  ActivityBottomSheet({Key? key}) : super(key: key);

  final ActivityRepo _activityRepo = ActivityRepo();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ActivityModel>(
        future: _activityRepo.getNetworkImages(),
        builder: (BuildContext context, AsyncSnapshot<ActivityModel> snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
                itemCount: 1,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                  maxCrossAxisExtent: MediaQuery.of(context).size.width * 0.5,
                ),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(snapshot.data!.activity),
                  );
                });
          }

          return const Padding(
            padding: EdgeInsets.all(20),
            child: CircularProgressIndicator(),
          );
        });
  }
}
