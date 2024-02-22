import 'package:flutter/material.dart';
import 'package:yama_motivate/l10n/app_localizations.dart';
import 'package:yama_motivate/presentation/theme.dart';
import 'package:yama_motivate/presentation/widgets/how_it_works_button.dart';
import 'package:yama_motivate/presentation/widgets/page_title_text.dart';
import 'package:yama_motivate/presentation/widgets/sixdays_logo.dart';
import 'package:yama_motivate/presentation/widgets/start_now_button.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mainImage = SizedBox(
        width: double.infinity,
        child: Image.asset('assets/images/start_page.png', fit: BoxFit.cover));

    return Scaffold(
        backgroundColor: primaryColor[900],
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(children: [
              Stack(alignment: Alignment.bottomLeft, children: [
                mainImage,
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text(AppLocalizations.of(context).startImageTitle,
                        style: const TextStyle(
                            color: Colors.white, fontSize: 16))),
              ]),
              const SizedBox(height: 10),
              Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(10),
                  child: const Column(children: [
                    SixDaysLogo(),
                    PageTitleText(
                        text:
                            "Empowering Growth, One Goal at a Time. In 6 Days.")
                  ])),
              const Divider(color: Colors.white),
              const SizedBox(height: 20),
              const StartNowButton(),
              const SizedBox(height: 10),
              const HowItworksButton(),
              const SizedBox(height: 20),
              const Divider(color: Colors.white),
              const SizedBox(height: 20),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text(AppLocalizations.of(context).godExplanation,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white))),
            ])));
  }
}
