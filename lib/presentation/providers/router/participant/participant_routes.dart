// // import 'package:eventpass_app/presentation/pages/participant/bookmark/bookmark_page.dart';
// // import 'package:eventpass_app/presentation/pages/participant/checkout/checkout_page.dart';
// // import 'package:eventpass_app/presentation/pages/profile/digital-tickets/digital_tickets_page.dart';
// // import 'package:eventpass_app/presentation/pages/participant/home/home_page.dart';
// // import 'package:eventpass_app/presentation/pages/participant/jadwal/detail_jadwal/detail_jadwal_event_page.dart';
// // import 'package:eventpass_app/presentation/pages/participant/jadwal/jadwal_home/jadwal_event_page.dart'
// //     as jadwal_event_page;
// // import 'package:eventpass_app/presentation/pages/participant/main_page.dart';
// // import 'package:flutter/material.dart';
// // import 'package:go_router/go_router.dart';
// import 'package:eventpass_app/presentation/pages/participant/checkout/checkout_page.dart';
// import 'package:eventpass_app/presentation/pages/participant/history/history_page.dart';
// import 'package:eventpass_app/presentation/pages/participant/home/home_page.dart';
// import 'package:eventpass_app/presentation/pages/participant/main_page.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// List<GoRoute> participantRoutes = [
//   GoRoute(
//     path: '/participant',
//     name: 'participant',
//     builder: (context, state) => const MainPage(),
//     routes: [
//       GoRoute(
//         path: 'home',
//         name: 'participant_home',
//         builder: (context, state) => HomePage(),
//       ),
//       GoRoute(
//         path: 'checkout',
//         name: 'participant_checkout',
//         builder: (context, state) => const CheckoutPage(),
//       ),
//       GoRoute(
//         path: 'history',
//         name: 'profile_history',
//         builder: (context, state) => HistoryPage(),
//       ),
//       GoRoute(
//         path: 'top-up',
//         name: 'participant_top-up',
//         builder: (context, state) => Scaffold(
//           appBar: AppBar(
//             title: const Text('Top Up'),
//           ),
//           body: const Center(
//             child: Text('Top Up'),
//           ),
//         ),
//       ),
//       GoRoute(
//         path: 'digital-tickets',
//         name: 'participant_digital_tickets',
//         builder: (context, state) => DigitalTicketsPage(),
//       ),
//     ],
//   ),
// ];
