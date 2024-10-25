import 'package:eventpass_app/presentation/misc/methods.dart';
import 'package:eventpass_app/presentation/widgets/card/statistic_card/card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heroicons/heroicons.dart';

Widget statisticCard(BuildContext context, WidgetRef ref) => Container(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: card(
                    context, ref, 1000, 'Total Acara', CupertinoIcons.sparkles),
              ),
              horizontalSpace(10.0),
              Expanded(
                child:
                    card(context, ref, 1000, 'Pengunjung', HeroIcons.userGroup),
              ),
            ],
          ),
        ],
      ),
    );
