import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:shimmer/shimmer.dart';
import 'package:torrins_assignment/utils/app_constants.dart';
import 'package:torrins_assignment/views/movie_details/movie_details_controller.dart';
import 'package:torrins_assignment/views/movie_details/widgets/video_player.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MovieDetailsController movieDetailsController = Get.put(MovieDetailsController());
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          top: true,
          bottom: true,
          child: SingleChildScrollView(
              child: Obx(() => movieDetailsController.isFetchingDetails
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(AppConstants.normalPadding / 2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: size.height * 0.3,
                            width: size.width,
                            child: MovieVideosComponent(videoKey: movieDetailsController.videoId),
                          ),
                          RichText(text: TextSpan(text: movieDetailsController.movieDetailsData['title'], style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
                          const SizedBox(height: AppConstants.normalPadding),
                          Row(
                            children: [
                              RichText(
                                  text: TextSpan(
                                text: movieDetailsController.movieDetailsData['vote_average'].toString(),
                              )),
                              const SizedBox(width: AppConstants.normalPadding / 4),
                              const Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 15,
                              ),
                              const SizedBox(width: AppConstants.normalPadding / 2),
                              RichText(
                                  text: const TextSpan(
                                text: "Released: ",
                              )),
                              RichText(
                                  text: TextSpan(
                                text: movieDetailsController.movieDetailsData['release_date'].toString(),
                              )),
                            ],
                          ),
                          const SizedBox(height: AppConstants.normalPadding),
                          SizedBox(
                            width: size.width,
                            height: size.height * 0.05,
                            child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(primary: Colors.white),
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.play_arrow,
                                  color: Colors.black,
                                ),
                                label: const Text(
                                  "Play",
                                  style: TextStyle(color: Colors.black),
                                )),
                          ),
                          const SizedBox(height: AppConstants.normalPadding / 2),
                          SizedBox(width: size.width, height: size.height * 0.05, child: ElevatedButton.icon(style: ElevatedButton.styleFrom(primary: Colors.grey), onPressed: () {}, icon: const Icon(Icons.download), label: const Text("Download"))),
                          const SizedBox(height: AppConstants.normalPadding),
                          RichText(maxLines: 3, text: TextSpan(text: movieDetailsController.movieDetailsData['overview'])),
                          const SizedBox(height: AppConstants.normalPadding),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: const [
                                  Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                  SizedBox(height: AppConstants.normalPadding / 2),
                                  Text(
                                    "My List",
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                              Column(
                                children: const [
                                  Icon(
                                    Icons.thumb_up_alt_outlined,
                                    color: Colors.white,
                                  ),
                                  SizedBox(height: AppConstants.normalPadding / 2),
                                  Text(
                                    "Rate",
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                              Column(
                                children: const [
                                  Icon(
                                    Icons.share,
                                    color: Colors.white,
                                  ),
                                  SizedBox(height: AppConstants.normalPadding / 2),
                                  Text(
                                    "Share",
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              )
                            ],
                          ),
                          const SizedBox(height: AppConstants.normalPadding * 2),
                          RichText(
                            text: const TextSpan(
                              text: "More Like This",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          const SizedBox(height: AppConstants.normalPadding),
                          GridView.builder(
                            shrinkWrap: true,
                            itemCount: movieDetailsController.similarMoviesData.length,
                            physics: const ClampingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {},
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                                  child: CachedNetworkImage(
                                    imageUrl: "${AppConstants.imageBase}${movieDetailsController.similarMoviesData[index]["backdrop_path"]}",
                                    placeholder: (context, url) => Shimmer.fromColors(
                                      baseColor: Colors.grey[850]!,
                                      highlightColor: Colors.grey[800]!,
                                      child: Container(
                                        height: size.height * 0.2,
                                        width: size.width * 0.3,
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius: BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                    errorWidget: (context, url, error) => const Icon(Icons.error),
                                    height: 180.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 8.0,
                              crossAxisSpacing: 8.0,
                              childAspectRatio: 0.7,
                              crossAxisCount: 3,
                            ),
                          ),
                        ],
                      ),
                    )))),
    );
  }
}
