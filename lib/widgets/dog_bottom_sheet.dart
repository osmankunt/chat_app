import 'package:chat_app/models/dog_model.dart';
import 'package:chat_app/repo/dog_repo.dart';
import 'package:flutter/material.dart';

class DogBottomSheet extends StatelessWidget {
  final Function(String) onSelection;
  DogBottomSheet({Key? key, required this.onSelection}) : super(key: key);

  final DogRepo _dogRepo = DogRepo();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      color: Colors.white,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      child: FutureBuilder<DogModel>(
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
                      child: GestureDetector(
                          onTap: () {
                            onSelection(snapshot.data!.url);
                          },
                          child: Image.network(snapshot.data!.url)),
                    );
                  });
            } else if (snapshot.hasError) {
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text('Error occured ${snapshot.error}'),
              );
            }

            return const Padding(
              padding: EdgeInsets.all(20),
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
