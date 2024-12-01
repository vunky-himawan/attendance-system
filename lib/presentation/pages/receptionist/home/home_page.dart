import 'package:eventpass_app/domain/entities/attendance/attendance.dart';
import 'package:eventpass_app/domain/entities/enum/status_enum.dart';
import 'package:eventpass_app/presentation/misc/colors.dart';
import 'package:eventpass_app/presentation/misc/methods.dart';
import 'package:eventpass_app/presentation/pages/receptionist/attendance_with_pin/main.dart';
import 'package:eventpass_app/presentation/pages/receptionist/face_recognition/face_recognition_page.dart';
import 'package:eventpass_app/presentation/pages/receptionist/home/methods/history_attendance_card.dart';
import 'package:eventpass_app/presentation/providers/receptionist/attendance/attendance_data_provider.dart';
import 'package:eventpass_app/presentation/widgets/text/title.dart';
import 'package:eventpass_app/presentation/widgets/user_info/user_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final attendanceData = ref.watch(attendanceDataProvider);

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
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const FaceRecognitionPage(),
                              ),
                            );
                          },
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
                    ],
                  ),
                  verticalSpace(20),
                  title(context, ref, 'Riwayat'),
                  verticalSpace(10),
                  if (attendanceData.isLoading)
                    const Center(child: CircularProgressIndicator())
                  else if (attendanceData.hasError)
                    Center(child: Text(attendanceData.error!.toString()))
                  else
                    attendanceData.when(
                      data: (_) {
                        final attendances = ref
                            .read(attendanceDataProvider.notifier)
                            .attendances;
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: attendances.length,
                          itemBuilder: (context, index) {
                            final attendance = attendances[index];

                            return historyAttendanceCard(
                              context,
                              attendance.attendedMethod.name,
                              attendance.participant!.participantName,
                              StatusEnum.values
                                  .firstWhere((status) =>
                                      status.name == attendance.status.name)
                                  .name,
                              attendance.participant!.gender,
                            );
                          },
                        );
                      },
                      error: (error, stack) =>
                          Center(child: Text(error.toString())),
                      loading: () => const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
