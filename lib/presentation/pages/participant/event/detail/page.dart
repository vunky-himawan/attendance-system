import 'package:eventpass_app/domain/entities/event/event.dart';
import 'package:eventpass_app/domain/entities/event_organizer/event_organizer.dart';
import 'package:eventpass_app/domain/entities/speaker/speaker.dart';
import 'package:eventpass_app/domain/entities/ticket/ticket.dart';
import 'package:eventpass_app/infrastructure/config/app_config.dart';
import 'package:eventpass_app/presentation/misc/colors.dart';
import 'package:eventpass_app/presentation/misc/methods.dart';
import 'package:eventpass_app/presentation/pages/participant/event/detail/methods/app_bar.dart';
import 'package:eventpass_app/presentation/pages/participant/event/detail/methods/bottom_bar.dart';
import 'package:eventpass_app/presentation/pages/participant/event/detail/methods/speaker_card.dart';
import 'package:eventpass_app/presentation/providers/event_data/event_provider_setup.dart';
import 'package:eventpass_app/presentation/providers/ticket/ticket_provider.dart';
import 'package:eventpass_app/presentation/providers/ticket/ticket_provider_setup.dart';
import 'package:eventpass_app/utils/parsed_date.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heroicons/heroicons.dart';
import 'package:shimmer/shimmer.dart';

class DetailEventForUserPage extends ConsumerStatefulWidget {
  final String eventId;
  final int initialIndex;

  const DetailEventForUserPage(
      {super.key, required this.eventId, this.initialIndex = 0});

  @override
  ConsumerState<DetailEventForUserPage> createState() =>
      _DetailEventForUserPageState();
}

class _DetailEventForUserPageState
    extends ConsumerState<DetailEventForUserPage> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(initialPage: widget.initialIndex);

    _pageController.addListener(() {
      final newPage = _pageController.page?.round() ?? 0;

      if (_currentPage != newPage) {
        setState(() {
          _currentPage = newPage;
        });
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(eventProvider.notifier).getEvent(eventId: widget.eventId);
      ref.read(ticketProvider.notifier).checkTicket(eventId: widget.eventId);
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(eventProvider);
    final ticketState = ref.watch(ticketProvider);

    final event = state.events
        ?.firstWhere((element) => element.eventId == widget.eventId);

    if (state.isLoading || ticketState.isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (event == null) {
      return const Center(child: Text('Event not found'));
    }

    final List<Speaker> speakers = event.speakers!;
    final EventOrganizer eventOrganizer = event.eventOrganizer!;
    final dateTime = parseDateTime('${event.startDate}');

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  _buildEventImage(event.thumbnailPath),
                  _buildPageView(
                      event, speakers, eventOrganizer, dateTime, ticketState),
                  detailEventAppBar(context),
                  if (ticketState.isPurchased) _buildNavigationButtons(),
                ],
              ),
            ),
            if (!ticketState.isPurchased)
              detailEventBottomBar(
                context,
                event.ticketPrice.toString(),
                event.eventId,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildEventImage(String? imagePath) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Image.network(
        '${AppConfig.assetBaseUrl}/$imagePath',
        fit: BoxFit.cover,
        width: double.infinity,
        height: 250,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              width: double.infinity,
              height: 250,
              color: Colors.grey[300],
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          return const Center(
              child: Icon(Icons.broken_image, size: 80, color: Colors.grey));
        },
      ),
    );
  }

  Widget _buildPageView(
      Event event,
      List<Speaker> speakers,
      EventOrganizer eventOrganizer,
      Map<String, String> dateTime,
      TicketState ticketState) {
    return Positioned(
      top: ticketState.isPurchased ? 330 : 250,
      bottom: 0,
      left: 0,
      right: 0,
      child: PageView(
        controller: _pageController,
        children: [
          _buildEventDetailPage(event, speakers, eventOrganizer, dateTime),
          if (ticketState.isPurchased)
            _buildTicket(ticketState.ticket!, event, dateTime), // Placeholder
        ],
      ),
    );
  }

  Widget _buildNavigationButtons() {
    return Positioned(
      top: 270,
      left: 16,
      right: 16,
      child: ColoredBox(
        color: Colors.white,
        child: Row(
          children: [
            // Tombol Detail Event
            Expanded(
              child: OutlinedButton(
                onPressed: () => _pageController.animateToPage(
                  0,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                ),
                style: OutlinedButton.styleFrom(
                  backgroundColor:
                      _currentPage == 0 ? darkBlue : Colors.transparent,
                  foregroundColor: _currentPage == 0 ? Colors.white : darkBlue,
                  side: const BorderSide(color: darkBlue, width: 2),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Detail Event',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(width: 15),

            // Tombol Tiket
            Expanded(
              child: OutlinedButton(
                onPressed: () => _pageController.animateToPage(
                  1,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                ),
                style: OutlinedButton.styleFrom(
                  backgroundColor:
                      _currentPage == 1 ? darkBlue : Colors.transparent,
                  foregroundColor: _currentPage == 1 ? Colors.white : darkBlue,
                  side: const BorderSide(color: darkBlue, width: 2),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Tiket',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEventDetailPage(Event event, List<Speaker> speakers,
      EventOrganizer eventOrganizer, Map<String, String> dateTime) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ColoredBox(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 30,
                          spreadRadius: 3,
                          offset: const Offset(0, 0),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                '${dateTime['date']}',
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text('${dateTime['month']}'),
                            ],
                          ),
                          horizontalSpace(30),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${dateTime['weekday']}',
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text('${dateTime['time']}')
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  verticalSpace(20),
                  Text(
                    event.title,
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  verticalSpace(10),
                  Row(
                    children: [
                      const HeroIcon(
                        size: 20,
                        HeroIcons.mapPin,
                        color: Colors.black,
                      ),
                      horizontalSpace(10),
                      Text(event.address)
                    ],
                  ),
                  verticalSpace(20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Tentang',
                        style:
                            TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      horizontalSpace(14),
                      Text(
                        event.description,
                      )
                    ],
                  ),
                  verticalSpace(20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Pembicara',
                        style:
                            TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      verticalSpace(10),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: speakers.map((speaker) {
                            return speakerCard(
                                context, speaker.name, speaker.title);
                          }).toList(),
                        ),
                      )
                    ],
                  ),
                  verticalSpace(20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Diselenggarakan Oleh',
                        style:
                            TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      verticalSpace(10),
                      Container(
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: double.infinity,
                        child: Row(
                          children: [
                            ClipOval(
                              child: Image.asset(
                                'assets/male.png',
                                width: 70,
                                height: 70,
                                fit: BoxFit.cover,
                              ),
                            ),
                            horizontalSpace(20),
                            Text(
                              eventOrganizer.organizationName,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTicket(
      Ticket ticket, Event event, Map<String, String> dateTime) {
    final ticketDateTime = parseDateTime('${ticket.createdAt}');

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: darkBlue,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                event.title,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              verticalSpace(20),
              SizedBox(
                width: double.infinity,
                child: Text(
                  ticket.pin,
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              verticalSpace(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Transaksi ID',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    ticket.transactionId.substring(0, 8),
                  )
                ],
              ),
              verticalSpace(20),
              const Divider(
                thickness: 1,
                color: Colors.black,
              ),
              verticalSpace(20),
              const Text(
                'Tempat',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              verticalSpace(5),
              Text(
                event.address,
                style: const TextStyle(color: Colors.grey),
              ),
              verticalSpace(20),
              const Text(
                'Waktu',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              verticalSpace(5),
              Text(
                '${dateTime['weekday']}, ${dateTime['date']} ${dateTime['month']} ${dateTime['year']} |  ${dateTime['time']}',
                style: const TextStyle(color: Colors.grey),
              ),
              verticalSpace(20),
              const Text(
                'Harga Ticket',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              verticalSpace(5),
              Text(
                'Rp. ${event.ticketPrice.toString()}',
                style: const TextStyle(color: Colors.grey),
              ),
              verticalSpace(20),
              const Text(
                'Tanggal Pembelian',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              verticalSpace(5),
              Text(
                '${ticketDateTime['weekday']}, ${ticketDateTime['date']} ${ticketDateTime['month']} ${ticketDateTime['year']} |  ${ticketDateTime['time']}',
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
