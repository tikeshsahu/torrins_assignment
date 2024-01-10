import 'package:get/get.dart';
import 'package:torrins_assignment/routes/app_routes.dart';
import 'package:torrins_assignment/views/downloads/downloads_binding.dart';
import 'package:torrins_assignment/views/downloads/downloads_screen.dart';
import 'package:torrins_assignment/views/layout/layout_binding.dart';
import 'package:torrins_assignment/views/layout/layout_screen.dart';
import 'package:torrins_assignment/views/movie_details/movie_details_binding.dart';
import 'package:torrins_assignment/views/movie_details/movie_details_screen.dart';
import 'package:torrins_assignment/views/movie_listing/movie_listing_binding.dart';
import 'package:torrins_assignment/views/movie_listing/movie_listing_screen.dart';


class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.layoutRoute,
      page: () => const LayoutScreen(),
      bindings: [
        LayoutBinding(),
        MovieListingBinding(),
        DownloadsBinding(),
      ],
    ),
    GetPage(
      name: AppRoutes.movieListingRoute,
      page: () => const MovieListingScreen(),
      binding: MovieListingBinding(),
    ),
    GetPage(
      name: AppRoutes.movieDetailsRoute,
      page: () => const MovieDetailsScreen(),
      binding: MovieDetailsBinding(),
    ),
    GetPage(
      name: AppRoutes.downloadsRoute,
      page: () => const DownloadsScreen(),
      binding: DownloadsBinding(),
    ),
  ];
}
