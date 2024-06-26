import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:winter_food/common/sizes.dart';
import 'package:winter_food/utils/constants/colors.dart';
import 'package:winter_food/utils/constants/constants.dart';
import 'package:winter_food/models/restaurant.dart';

class RestaurantItem extends StatelessWidget {
  const RestaurantItem({
    super.key,
    required this.restaurant,
  });

  final RestaurantModel restaurant;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.8,
      margin: EdgeInsets.only(bottom: 10.h),
      decoration: BoxDecoration(
        color: kLightWhite,
        borderRadius: BorderRadius.circular(WSizes.spaceBtwItems.r),
        boxShadow: const [
          BoxShadow(
            color: kGrayLight,
            offset: Offset(0, 2),
            blurRadius: 4,
          )
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.w),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: SizedBox(
                    height: 112.h,
                    width: double.infinity,
                    child: Image.network(
                      restaurant.imageUrl,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                Positioned(
                    top: 10.h,
                    right: 10.w,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50.r),
                      child: Container(
                        color: kLightWhite,
                        child: Padding(
                          padding: EdgeInsets.all(2.h),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50.r),
                            child: Image.network(
                              restaurant.logoUrl,
                              fit: BoxFit.cover,
                              width: 20.w,
                              height: 20.h,
                            ),
                          ),
                        ),
                      ),
                    ))
              ],
            ),
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(restaurant.title,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: TColors.dark)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Delivery under',
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(color: TColors.darkGrey)),
                    Text(restaurant.time,
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(color: TColors.darkGrey)),
                  ],
                ),
                Row(
                  children: [
                    RatingBarIndicator(
                      rating: restaurant.rating / 1.0,
                      itemBuilder: (_, index) => const Icon(
                        Icons.star,
                        color: kPrimary,
                      ),
                      itemCount: 5,
                      itemSize: 15.w,
                    ),
                    const SizedBox(
                      width: WSizes.spaceBtwItems,
                    ),
                    Text(
                      '${restaurant.ratingCount} reviews and ratings',
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(color: TColors.darkGrey),
                    )
                  ],
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
