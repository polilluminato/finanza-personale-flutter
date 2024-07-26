import 'package:finanza_personale/l10n/localized_context.dart';
import 'package:finanza_personale/pages/settings/ui/about_row.dart';
import 'package:finanza_personale/styles/dimens.dart';
import 'package:finanza_personale/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  Future<PackageInfo> getPackageInfo() async {
    return await PackageInfo.fromPlatform();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.settingsPageTitle),
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.only(
              left: Dimens.mainPadding,
              bottom: Dimens.smallPadding,
              top: Dimens.hugePadding,
            ),
            alignment: Alignment.centerLeft,
            child: Text(
              context.loc.settingsPageSectionApp,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ),
          AboutRow(
            icon: Icons.code,
            title: context.loc.settingsPageRepositoryLabel,
            callback: () {
              launchURL(
                  "https://github.com/polilluminato/finanza-personale-flutter");
            },
          ),
          AboutRow(
            icon: Icons.policy,
            title: context.loc.settingsPagePrivacyPolicyLabel,
            callback: () {
              launchURL(
                  "https://github.com/polilluminato/finanza-personale-flutter");
            },
          ),
          AboutRow(
            icon: Icons.favorite,
            title: context.loc.settingsPageSponsorLabel,
            callback: () {
              launchURL("https://github.com/sponsors/polilluminato");
            },
          ),
          Container(
            padding: const EdgeInsets.only(
              left: Dimens.mainPadding,
              bottom: Dimens.smallPadding,
              top: Dimens.hugePadding,
            ),
            alignment: Alignment.centerLeft,
            child: Text(
              context.loc.settingsPageSectionDeveloper,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ),
          AboutRow(
            icon: Icons.person,
            title: context.loc.settingsPageWebsiteLabel,
            callback: () {
              launchURL("https://www.albertobonacina.com/");
            },
          ),
          AboutRow(
            icon: Icons.domain,
            title: context.loc.settingsPageFollowGithubLabel,
            callback: () {
              launchURL("https://www.github.com/polilluminato");
            },
          ),
          AboutRow(
            icon: Icons.flutter_dash,
            title: context.loc.settingsPageFollowTwitterLabel,
            callback: () {
              launchURL("https://www.twitter.com/polilluminato");
            },
          ),
          AboutRow(
            icon: Icons.campaign,
            title: context.loc.settingsPageFollowMastodonLabel,
            callback: () {
              launchURL("https://fluttercommunity.social/@polilluminato");
            },
          ),
          AboutRow(
            icon: Icons.business,
            title: context.loc.settingsPageFollowLinkedinLabel,
            callback: () {
              launchURL("https://www.linkedin.com/in/bonacinaalberto");
            },
          ),
          const SizedBox(
            height: Dimens.hugeSpace,
          ),
          FutureBuilder<PackageInfo>(
            future: getPackageInfo(),
            builder:
                (BuildContext context, AsyncSnapshot<PackageInfo> snapshot) {
              if (snapshot.hasData) {
                return Text(
                  context.loc.settingsPageFooterLabel(snapshot.data!.version),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
          const SizedBox(
            height: Dimens.hugeSpace,
          ),
        ],
      ),
    );
  }
}
