import 'package:flutter/material.dart';
import 'package:grocery/presentation/common/assets.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Good Morning!",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Text(
              "Caesar Rincon",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.black54),
            )
          ],
        ),
        const CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage(Assets.profilePicture),
        )
      ],
    );
  }
}
