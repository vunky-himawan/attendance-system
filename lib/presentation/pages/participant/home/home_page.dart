import 'package:eventpass_app/infrastructure/config/app_config.dart';
import 'package:eventpass_app/presentation/misc/methods.dart';
import 'package:eventpass_app/presentation/pages/participant/event/detail/page.dart';
import 'package:eventpass_app/presentation/pages/participant/home/methods/search_result.dart';
import 'package:eventpass_app/presentation/pages/participant/home/methods/your_event_card.dart';
import 'package:eventpass_app/presentation/pages/participant/home/methods/recommendation_card.dart';
import 'package:eventpass_app/presentation/providers/event_data/event_provider_setup.dart';
import 'package:eventpass_app/presentation/widgets/custom_search_bar.dart';
import 'package:eventpass_app/presentation/widgets/text/title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ParticipantHomePage extends ConsumerStatefulWidget {
  const ParticipantHomePage({super.key});

  @override
  ConsumerState<ParticipantHomePage> createState() =>
      _ParticipantHomePageState();
}

class _ParticipantHomePageState extends ConsumerState<ParticipantHomePage> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      final eventState = ref.read(eventProvider);

      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent &&
          !eventState.isLoadingMore &&
          eventState.hasMoreData) {
        final currentEvents = eventState.events ?? [];
        final nextPage = (currentEvents.length ~/ 10) + 1;

        ref
            .read(eventProvider.notifier)
            .getEvents(page: nextPage.toString(), size: '10', isLoadMore: true);
      }
    });
  }

  Future<void> _onRefresh() async {
    ref.read(eventProvider.notifier).getEvents(page: '1', size: '10');
  }

  @override
  Widget build(BuildContext context) {
    final eventState = ref.watch(eventProvider);

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _onRefresh, // Menambahkan fungsi refresh di sini
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 80.0),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(85),
                  CustomSearchBar(
                    onSearch: (String query) {},
                    searchController: _searchController,
                  ),
                  verticalSpace(8),
                  title(context, ref, 'Rekomendasi Acara'),
                  verticalSpace(8),
                  if (eventState.isLoading && eventState.events == null)
                    const Center(
                      child: CircularProgressIndicator(),
                    )
                  else
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: eventState.events?.length ?? 0,
                      itemBuilder: (context, index) {
                        final event = eventState.events![index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: recommendationEventCard(
                            imagePath:
                                '${AppConfig.assetBaseUrl}/${event.thumbnailPath}',
                            title: event.title,
                            location: event.address,
                            date: event.startDate.toString(),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailEventForUserPage(
                                      eventId: event.eventId),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  if (eventState.isLoadingMore)
                    const Center(
                      child: CircularProgressIndicator(),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }
}
