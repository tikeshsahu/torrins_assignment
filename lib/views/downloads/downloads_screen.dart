import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:torrins_assignment/utils/app_constants.dart';

class DownloadsScreen extends StatelessWidget {
  const DownloadsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("My Downloads"),
      ),
      body: SafeArea(
          top: true,
          bottom: true,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * 0.3,
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: 6,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                            child: CachedNetworkImage(
                              width: size.width * 0.6,
                              fit: BoxFit.cover,
                              imageUrl: AppConstants.imageUrl,
                              placeholder: (context, url) => Shimmer.fromColors(
                                baseColor: Colors.grey[850]!,
                                highlightColor: Colors.grey[800]!,
                                child: Container(
                                  height: size.height * 0.3,
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
                          const SizedBox(height: AppConstants.normalPadding / 2),
                          const Text(
                            "Aquaman",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(width: AppConstants.normalPadding),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
