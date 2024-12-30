// import 'package:eventpass_app/infrastructure/config/api_config.dart';
// import 'package:eventpass_app/presentation/misc/colors.dart';
// import 'package:eventpass_app/presentation/misc/methods.dart';
// import 'package:eventpass_app/presentation/pages/event/list_of_event/methods/event_card.dart';
// import 'package:eventpass_app/presentation/providers/event_data/event_data_provider.dart';
// import 'package:eventpass_app/presentation/providers/router/router_provider.dart';
// import 'package:eventpass_app/presentation/widgets/custom_search_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:heroicons/heroicons.dart';

// class ListOfEventPage extends ConsumerWidget {
//   final TextEditingController searchController = TextEditingController();
//   final bool isAdmin;
//   ListOfEventPage({super.key, this.isAdmin = true});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final eventList = ref.watch(eventDataProvider);

//     return Scaffold(
//       floatingActionButton: isAdmin
//           ? Stack(
//               children: [
//                 Positioned(
//                   bottom: 100,
//                   right: 16,
//                   child: Container(
//                     width: 70,
//                     height: 70,
//                     child: FloatingActionButton(
//                       onPressed: () {
//                         ref
//                             .watch(routerProvider)
//                             .push('/event-organizer/events/add-event');
//                       },
//                       shape: CircleBorder(
//                         side: BorderSide(
//                           color: ghost.withOpacity(0.2),
//                         ),
//                       ),
//                       elevation: 0,
//                       backgroundColor: Colors.white,
//                       child: const HeroIcon(
//                         HeroIcons.plus,
//                         color: Color(0xFF0300A2),
//                         size: 35,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             )
//           : null,
//       backgroundColor: Colors.white,
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
//         child: SafeArea(
//           child: Column(
//             children: [
//               verticalSpace(90),
//               CustomSearchBar(
//                 onSearch: (String query) {},
//                 searchController: searchController,
//               ),
//               verticalSpace(15),
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.only(bottom: 80),
//                   child: eventList.when(
//                     data: (_) {
//                       final events =
//                           ref.read(eventDataProvider.notifier).listEvent;

//                       return ListView.builder(
//                         shrinkWrap: true,
//                         itemCount: events.length,
//                         itemBuilder: (context, index) {
//                           final event = events[index];

//                           return eventCard(
//                             title: event.title,
//                             date: event.startDate.toString(),
//                             imageUrl: '${AppConfig.assetBaseUrl}/${event.thumbnailPath}',
//                           );
//                         },
//                       );
//                     },
//                     error: (error, stackTrace) {
//                       return const Center(
//                         child: Text('Error'),
//                       );
//                     },
//                     loading: () {
//                       return const Center(
//                         child: CircularProgressIndicator(),
//                       );
//                     },
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
