import 'package:flutter/material.dart';
import 'package:flutter_assignment/app/app_values.dart';
import 'package:flutter_assignment/app/colors.dart';
import 'package:flutter_assignment/app/text_styles.dart';
import 'package:flutter_assignment/data/models/github_project_response.dart';
import 'package:flutter_assignment/view/components/network_image_loader.dart';
import 'package:flutter_assignment/view/components/icon_text_widgets.dart';

class ItemProjectWidget extends StatelessWidget {
  final Repository repo;
  final VoidCallback? onTap;

  const ItemProjectWidget({
    super.key,
    required this.repo,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        color: AppColors.white,
        child: Padding(
          padding: const EdgeInsets.all(AppValues.padding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              NetworkImageLoader(
                imageUrl: repo.owner?.avatarUrl ?? "",
                width: AppValues.circularImageDefaultSize,
                height: AppValues.circularImageDefaultSize,
              ),
              const SizedBox(width: AppValues.margin_10),
              _getDetailsView(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getDetailsView() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            repo.name ?? "",
            style: AppTextStyles.cardTitleStyle,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          const SizedBox(height: AppValues.margin_4),
          Text(
            repo.owner?.login ?? "",
            style: AppTextStyles.cardSubtitleStyle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: AppValues.margin_4),
          _getForkStarWatcherView(),
        ],
      ),
    );
  }

  Widget _getForkStarWatcherView() {
    return Row(
      children: [
        IconTextWidget(
          fileName: "ic_fork.svg",
          value: repo.forks.toString(),
          height: AppValues.iconSize_18,
          width: AppValues.iconSize_18,
          color: AppColors.iconColor,
        ),
        IconTextWidget(
          icon: Icons.star_border,
          value: repo.stargazersCount.toString(),
          size: AppValues.iconSize_20,
          color: AppColors.iconColor,
        ),
        IconTextWidget(
          icon: Icons.visibility_outlined,
          value: repo.watchers.toString(),
          size: AppValues.iconSize_20,
          color: AppColors.iconColor,
        ),
      ],
    );
  }
}
