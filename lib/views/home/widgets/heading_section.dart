import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:winter_food/utils/constants/colors.dart';
import 'package:winter_food/utils/constants/constants.dart';

class HeadingSection extends StatelessWidget {
  const HeadingSection({
    super.key,
    required this.title,
    this.isShowAllIcon = true,
    this.onTap,
  });

  final String title;
  final bool isShowAllIcon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: TColors.dark)),
          if (isShowAllIcon)
            InkWell(
              onTap: onTap,
              child: Icon(
                AntDesign.appstore1,
                color: kSecondary,
              ),
            )
        ],
      ),
    );
  }
}
