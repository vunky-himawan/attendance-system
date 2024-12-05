import 'package:eventpass_app/presentation/pages/participant/bookmark/providers/bookmark_provider.dart';
import 'package:eventpass_app/presentation/pages/participant/bookmark/widget/bookmark_card.dart';
import 'package:eventpass_app/presentation/pages/participant/bookmark/widget/empty_state_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookmarkPage extends ConsumerWidget {
  const BookmarkPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Mengambil daftar bookmark dari provider
    final bookmarkList = ref.watch(bookmarkProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Bookmark Title
            const Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 110.0, 16.0, 12.0),
              child: Text(
                'Bookmark Anda',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            // Daftar Bookmark
            if (bookmarkList.isEmpty)
              const EmptyStateWidget(
                message: 'Belum ada acara yang di-bookmark.',
              )
            else
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 100.0),
                  itemCount: bookmarkList.length,
                  itemBuilder: (context, index) {
                    final event = bookmarkList[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: BookmarkCard(event: event),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
