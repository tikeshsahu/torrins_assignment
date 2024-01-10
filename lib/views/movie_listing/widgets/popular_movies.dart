import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:shimmer/shimmer.dart';
import 'package:torrins_assignment/routes/app_routes.dart';
import 'package:torrins_assignment/utils/app_constants.dart';
import 'package:torrins_assignment/views/movie_listing/movie_listing_controller.dart';

class PopularMovieList extends StatelessWidget {
  const PopularMovieList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MovieListingController moviesListingController = Get.find();
    final Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Popular",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                "View All",
                style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: size.height * 0.3,
          child: PagedListView.separated(
            pagingController: moviesListingController.popularMoviesController,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            builderDelegate: PagedChildBuilderDelegate(
              itemBuilder: (context, dynamic item, index) {
                return Container(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: InkWell(
                    onTap: () => Get.toNamed(AppRoutes.movieDetailsRoute, parameters: {"movieId": item["id"].toString()}),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                      child: CachedNetworkImage(
                        width: size.width * 0.4,
                        fit: BoxFit.cover,
                        imageUrl: "${AppConstants.imageBase}${item["backdrop_path"]}",
                        placeholder: (context, url) => Shimmer.fromColors(
                          baseColor: Colors.grey[850]!,
                          highlightColor: Colors.grey[800]!,
                          child: Container(
                            height: 0.3,
                            width: size.width * 0.4,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                      ),
                    ),
                  ),
                );
              },
            ),
            separatorBuilder: (context, index) {
              return const SizedBox(width: AppConstants.normalPadding / 3);
            },
          ),
        ),
      ],
    );
  }
}
