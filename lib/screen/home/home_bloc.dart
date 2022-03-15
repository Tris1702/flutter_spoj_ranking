import 'package:flutter/material.dart';
import 'package:practice_scraping_data/base/bloc_base.dart';
import 'package:practice_scraping_data/config/global_counter.dart';
import 'package:practice_scraping_data/service/list_participants_services.dart';
import 'package:rxdart/rxdart.dart';

import '../../model/user.dart';

class HomeBloc extends BlocBase {
  @override
  void dispose() {
    users.close();
  }

  @override
  void init() {
    // TODO: implement init
  }

  BehaviorSubject<List<User>> users = BehaviorSubject.seeded([]);
  Stream<List<User>> getUsersStream() => users.stream;
  Sink<List<User>> getUsersSink() => users.sink;

  BehaviorSubject<bool> loading = BehaviorSubject.seeded(true);
  Stream<bool> getLoadingStream() => loading.stream;
  Sink<bool> getLoadingSink() => loading.sink;

  void scraping(context) {
    if (context != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Loading...',
            style: TextStyle(color: Colors.blue),
          ),
        ),
      );
    }
    repoImpl.scraping();
    waitForUpdate(context);
  }

  Future<void> waitForUpdate(context) async {
    if (GlobalCounter.counter.value != ListParticipantService.users.length) {
      await Future.delayed(const Duration(milliseconds: 200));
      return waitForUpdate(context);
    } else {
      ListParticipantService.users
          .sort((a, b) => b.current.compareTo(a.current));
      users.add(ListParticipantService.users);
      if (context != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Icon(
            Icons.check,
            color: Colors.green,
          ),
        ),
      );
    }
    }
    
  }

}
