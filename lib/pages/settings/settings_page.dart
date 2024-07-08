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
        title: const Text("Impostazioni"),
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
            child: const Text(
              "APP",
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ),
          AboutRow(
            icon: Icons.code,
            title: "Repository",
            callback: () {
              launchURL(
                  "https://github.com/polilluminato/finanza-personale-flutter");
            },
          ),
          AboutRow(
            icon: Icons.policy,
            title: "Privacy Policy",
            callback: () {
              launchURL(
                  "https://github.com/polilluminato/finanza-personale-flutter");
            },
          ),
          AboutRow(
            icon: Icons.favorite,
            title: "Sponsor",
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
            child: const Text(
              "SVILUPPATORE",
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ),
          AboutRow(
            icon: Icons.person,
            title: "Sito Web",
            callback: () {
              launchURL("https://www.albertobonacina.com/");
            },
          ),
          AboutRow(
            icon: Icons.domain,
            title: "Seguimi su GitHub",
            callback: () {
              launchURL("https://www.github.com/polilluminato");
            },
          ),
          AboutRow(
            icon: Icons.flutter_dash,
            title: "Seguimi su X/Twitter",
            callback: () {
              launchURL("https://www.twitter.com/polilluminato");
            },
          ),
          AboutRow(
            icon: Icons.campaign,
            title: "Seguimi su Mastodon",
            callback: () {
              launchURL("https://fluttercommunity.social/@polilluminato");
            },
          ),
          AboutRow(
            icon: Icons.business,
            title: "Connettiti su LinkedIn",
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
                  "Wassword ${snapshot.data!.version}\nMade with ☕ and 💙 by Alberto Bonacina",
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
