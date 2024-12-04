import 'package:eventpass_app/presentation/pages/event_organizer/add_event/add_event_page.dart';
import 'package:eventpass_app/presentation/pages/event_organizer/list_of_event/list_of_event_page.dart';
import 'package:eventpass_app/presentation/pages/event_organizer/add_receptionist/add_receptionist_page.dart';
import 'package:eventpass_app/presentation/pages/event_organizer/detail/detail_page.dart';
import 'package:eventpass_app/presentation/pages/event_organizer/list_of_receptionist/list_of_receptionist_page.dart';
import 'package:eventpass_app/presentation/pages/event_organizer/main_page.dart';
import 'package:eventpass_app/presentation/pages/event_organizer/home/home_page.dart';
import 'package:eventpass_app/presentation/pages/event_organizer/add_speaker/add_speaker_page.dart';
import 'package:eventpass_app/presentation/pages/event_organizer/detail_event/detail_event_page.dart';
import 'package:go_router/go_router.dart';

List<GoRoute> eventOrganizerRoutes = [
  GoRoute(
    path: '/event-organizer',
    name: 'event_organizer',
    builder: (context, state) => const MainPage(),
    routes: [
      GoRoute(
        path: 'home',
        name: 'event_organizer_home',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: 'detail',
        name: 'event_organizer_detail',
        builder: (context, state) => const DetailPage(),
      ),
      GoRoute(
        path: 'add-speaker',
        name: 'event_organizer_add_speaker',
        builder: (context, state) => AddSpeakerPage(),
      ),
      GoRoute(
        path: 'add-receptionist',
        name: 'event_organizer_add_receptionist',
        builder: (context, state) => AddReceptionistPage(),
      ),
    ],
  ),
  GoRoute(
    path: '/event-organizer/receptionists',
    name: 'event_organizer_receptionists',
    builder: (context, state) => const ListOfReceptionistPage(),
  ),
  GoRoute(
    path: '/event-organizer/events',
    name: 'event_organizer_events',
    builder: (context, state) => ListOfEventPage(),
    routes: [
      GoRoute(
        path: 'add-event',
        name: 'event_organizer_add_event',
        builder: (context, state) => const AddEventPage(),
      ),
      GoRoute(
        path: 'detail-event',
        name: 'event_organizer_detail_event',
        builder: (context, state) => const DetailEventTabPage(),
      )
    ]
  ),
];
