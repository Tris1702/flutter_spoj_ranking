import 'package:get_it/get_it.dart';
import 'package:practice_scraping_data/config/constant.dart';
import 'package:practice_scraping_data/repository/scraping_repository_impl.dart';
import 'package:web_scraper/web_scraper.dart';

void setUpServiceLocator() {
  GetIt getIt = GetIt.I;
  getIt.registerLazySingleton<WebScraper>(() => WebScraper(Constant.website));
  getIt.registerLazySingleton<ScrapingRepositoryImpl>(
      () => ScrapingRepositoryImpl());
}
