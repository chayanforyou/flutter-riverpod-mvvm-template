import 'package:flutter/material.dart';
import 'package:flutter_assignment/app/app_values.dart';
import 'package:flutter_assignment/app/colors.dart';
import 'package:flutter_assignment/app/text_styles.dart';
import 'package:flutter_assignment/data/models/github_project_response.dart';
import 'package:flutter_assignment/utils/date_util.dart';
import 'package:flutter_assignment/view/components/network_image_loader.dart';
import 'package:flutter_assignment/view/components/icon_text_widgets.dart';
import 'package:gap/gap.dart';

class ProjectDetailsScreen extends StatelessWidget {
  final Repository repo;

  const ProjectDetailsScreen({
    super.key,
    required this.repo,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text('Repository details'),
      ),
      body: Container(
        margin: const EdgeInsets.all(AppValues.margin_20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              repo.name ?? "",
              style: AppTextStyles.cardTitleStyle,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            Gap(AppValues.margin_6),
            _getAuthor(),
            Gap(AppValues.margin_4),
            _getForkStarWatcherView(),
            Gap(AppValues.margin_6),
            Text(
              "Last updated: ${DateUtil.formatDateTime(repo.updatedAt)}",
              style: AppTextStyles.cardSubtitleStyle,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            Gap(AppValues.margin_30),
            _getDescription()
          ],
        ),
      ),
    );
  }

  Widget _getAuthor() {
    return Row(
      children: [
        NetworkImageLoader(
          imageUrl: repo.owner?.avatarUrl ?? "",
          width: AppValues.circularImageSize_34,
          height: AppValues.circularImageSize_34,
        ),
        const Gap(AppValues.margin_6),
        Text(
          repo.owner?.login ?? "",
          style: AppTextStyles.cardSubtitleStyle,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _getForkStarWatcherView() {
    return Container(
      margin: const EdgeInsets.only(left: AppValues.margin_40),
      child: Row(
        children: [
          IconTextWidget(
            fileName: "ic_fork.svg",
            value: repo.forks.toString(),
            height: AppValues.iconSize_20,
            width: AppValues.iconSize_20,
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
      ),
    );
  }

  Widget _getDescription() {
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Text(
          repo.description ?? "",
          // style: descriptionTextStyle,
        ),
      ),
    );
  }
}
