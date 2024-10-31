import 'package:eventpass_app/presentation/misc/colors.dart';
import 'package:eventpass_app/presentation/misc/methods.dart';
import 'package:eventpass_app/presentation/pages/receptionist/home/methods/history_attendance_card.dart';
import 'package:eventpass_app/presentation/widgets/text/title.dart';
import 'package:eventpass_app/presentation/widgets/user_info/user_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            userInfo(context, ref, withNotification: true, withLogout: false),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 50),
                            backgroundColor: blueWhite,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(color: darkBlue),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/qr-scan.svg',
                                colorFilter: const ColorFilter.mode(
                                    darkBlue, BlendMode.srcIn),
                              ),
                              horizontalSpace(8),
                              const Text(
                                'Absen Wajah',
                                style: TextStyle(color: darkBlue),
                              )
                            ],
                          ),
                        ),
                      ),
                      horizontalSpace(8),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 50),
                            backgroundColor: orangeWhite,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(color: primaryOrange),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/choose.svg',
                                colorFilter: const ColorFilter.mode(
                                    primaryOrange, BlendMode.srcIn),
                              ),
                              horizontalSpace(8),
                              const Text(
                                'Absen PIN',
                                style: TextStyle(color: primaryOrange),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(20),
                  title(context, ref, 'Riwayat'),
                  verticalSpace(20),
                  historyAttendanceCard(
                      context, 'Absensi - Wajah', 'John Doe', 'Berhasil'),
                  verticalSpace(8),
                  historyAttendanceCard(
                      context, 'Absensi - Wajah', 'John Doe', 'Gagal'),
                  verticalSpace(8),
                  historyAttendanceCard(
                      context, 'Absensi - PIN', 'John Doe', 'Berhasil'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
