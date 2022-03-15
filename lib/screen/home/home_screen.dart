import 'package:flutter/material.dart';
import 'package:practice_scraping_data/screen/home/home_bloc.dart';

import '../../model/user.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bloc = HomeBloc();
    bloc.scraping(null);
    return Scaffold(
      body: StreamBuilder(
        stream: bloc.getUsersStream(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Text("Keep Calm!");
          } else {
            List<User> list = snapshot.data as List<User>;
            return Center(
              child: list.isEmpty
                  ? const CircularProgressIndicator()
                  : ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(list[index].username),
                          subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('process: ' +
                                    (list[index].current /
                                            list[index].target *
                                            100)
                                        .toStringAsFixed(0)),
                                Text(list[index].current.toString()),
                              ]),
                        );
                      },
                    ),
            );
          }
        },
      ),
      floatingActionButton: IconButton(
        icon: const Icon(Icons.restart_alt),
        onPressed: () => bloc.scraping(context),
      ),
    );
  }
}
