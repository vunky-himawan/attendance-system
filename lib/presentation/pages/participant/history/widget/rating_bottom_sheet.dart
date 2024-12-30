import 'package:eventpass_app/presentation/pages/participant/history/providers/event_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heroicons/heroicons.dart';

class RatingBottomSheet extends StatelessWidget {
  final WidgetRef ref;
  final int index;
  final VoidCallback onRatingUpdated;

  const RatingBottomSheet({
    super.key,
    required this.ref,
    required this.index,
    required this.onRatingUpdated,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
        top: 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Nilai Pengalaman Anda',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 3),
          const Text(
            'Nilai Pengalaman Anda',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.normal,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              5,
              (rating) => GestureDetector(
                onTap: () {
                  ref.read(eventProvider.notifier).updateRating(index, rating + 1);
                  onRatingUpdated();
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.1,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: rating < ref.watch(eventProvider)[index].rating
                          ? Colors.orange
                          : Colors.grey[300] ?? Colors.grey,
                    ),
                  ),
                  child: Column(
                    children: [
                      HeroIcon(
                        HeroIcons.star,
                        size: 36,
                        color: rating <
                                ref.watch(eventProvider)[index].rating
                            ? Colors.orange
                            : Colors.grey[300],
                      ),
                      Text(
                        '${rating + 1}',
                        style: TextStyle(
                          color: rating < ref.watch(eventProvider)[index].rating
                              ? Colors.orange
                              : Colors.grey[300],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Tulis ulasan Anda',
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: Colors.grey[300] ?? Colors.grey,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: Colors.grey[300] ?? Colors.grey,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0300A2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              minimumSize: const Size(double.infinity, 48),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Kirim',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
