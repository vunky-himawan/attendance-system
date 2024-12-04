import 'package:eventpass_app/presentation/providers/router/router_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heroicons/heroicons.dart';

class HeaderImage extends ConsumerWidget {
  final String imageUrl;
  final String title;
  final VoidCallback onBackPress;

  const HeaderImage({
    required this.imageUrl,
    required this.title,
    required this.onBackPress,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      alignment: Alignment.center,

      fit: StackFit.passthrough,
      children: [
        Image.network(
          imageUrl,
          width: double.infinity,
          height: 365,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 16,
          left: 16,
          child: IconButton(
            onPressed: ref.watch(routerProvider).pop,
            icon: const HeroIcon(HeroIcons.arrowLeft, color: Colors.black, size: 20),
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Colors.white),
              shape: WidgetStateProperty.all(const CircleBorder()),
            ),
          ),
        ),
        Positioned(
          top: 20,
          // left: 0,
          // right: 0,
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
