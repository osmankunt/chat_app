import 'package:chat_app/models/dog_model.dart';
import 'package:chat_app/repo/dog_repo.dart';
import 'package:flutter/material.dart';

class DogBottomSheet extends StatelessWidget {
  DogBottomSheet({Key? key}) : super(key: key);

  final DogRepo _dogRepo = DogRepo();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DogModel>(
        future: _dogRepo.getDogImages(),
        builder: (BuildContext context, AsyncSnapshot<DogModel> snapshot) {
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
                    child: Image.network(snapshot.data!.message),
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
