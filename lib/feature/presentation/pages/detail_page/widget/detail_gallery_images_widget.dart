import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class GalleryImagesWidget extends StatelessWidget {
  GalleryImagesWidget({
    super.key,
  });

  List images = [
    "https://static.vecteezy.com/system/resources/thumbnails/023/308/330/small_2x/ai-generative-exterior-of-modern-luxury-house-with-garden-and-beautiful-sky-photo.jpg",
    "https://media.gettyimages.com/id/147205632/photo/modern-home-with-swimming-pool.jpg?s=612x612&w=gi&k=20&c=KziR75bRl6md69oB-cEvNv_0ak-I-f6kmkUpKVQBH-E=",
    "https://res.akamaized.net/domain/image/upload/t_web/v1538713881/bigsmall_Mirvac_house2_twgogv.jpg",
    "https://cdn.houseplansservices.com/product/4eat34je4b4208ebguq0ruoekn/w800x533.jpg?v=2"
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72.r,
      child: ListView.separated(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return ZoomIn(
              child: Container(
                height: 72.r,
                width: 72.r,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(images[index]),
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(
                width: 16.r,
              ),
          itemCount: images.length),
    );
  }
}
