import 'package:get_it/get_it.dart';
import 'package:practice_scraping_data/config/global_counter.dart';
import 'package:practice_scraping_data/model/user.dart';
import 'package:practice_scraping_data/repository/scraping_repository.dart';
import 'package:practice_scraping_data/service/list_participants_services.dart';
import 'package:web_scraper/web_scraper.dart';

import '../config/constant.dart';

class ScrapingRepositoryImpl extends ScrapingRepository {
  void scraping() {
    WebScraper webScraper = GetIt.I<WebScraper>();
    GlobalCounter.counter.sink.add(0);
    for (var i = 0; i < ListParticipantService.users.length; i++) {
      crawl(ListParticipantService.users[i], webScraper, i);
    }
  }
  // void scrapingByUser(username) async {
  //   WebScraper webScraper = GetIt.I<WebScraper>();
  //   await crawl(ListParticipantService.users, webScraper, i);
  // }
}

Future<void> crawl(User user, WebScraper webScraper, int index) async {
  if (await webScraper.loadWebPage(Constant.url + user.username + '/')) {
    List<String> elements =
        webScraper.getElementTitle('div.col-md-9 > table.table-condensed');
    // print(elements);
    ListParticipantService.users[index].current =
        _counter(elements.isEmpty ? '' : elements[0]);
  }
  GlobalCounter.counter.sink.add(GlobalCounter.counter.value + 1);
}

int _counter(String elements) {
  List<String> result = elements.split('\n');
  var count = 0;
  for (var i = 0; i < result.length; i++) {
    if (result[i].trim().isNotEmpty) {
      count++;
    }
  }
  return count;
}
