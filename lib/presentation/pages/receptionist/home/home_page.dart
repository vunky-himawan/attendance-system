import 'package:eventpass_app/presentation/misc/colors.dart';
import 'package:eventpass_app/presentation/misc/methods.dart';
import 'package:eventpass_app/presentation/pages/receptionist/face_recognition/face_recognition_page.dart';
import 'package:eventpass_app/presentation/pages/receptionist/home/methods/history_attendance_card.dart';
import 'package:eventpass_app/presentation/providers/attendance_data/attendance_provider_setup.dart';
import 'package:eventpass_app/presentation/providers/auth/auth_provider_setup.dart';
import 'package:eventpass_app/presentation/widgets/text/title.dart';
import 'package:eventpass_app/presentation/widgets/user_info/user_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReceptionistHomePage extends ConsumerStatefulWidget {
  const ReceptionistHomePage({super.key});

  @override
  ConsumerState<ReceptionistHomePage> createState() =>
      _ReceptionistHomePageState();
}

class _ReceptionistHomePageState extends ConsumerState<ReceptionistHomePage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref.read(authProvider.notifier).initializeUserFromToken();
      await ref
          .read(attendanceProvider.notifier)
          .getAttendanceHistoryByReceptionist(context: context, ref: ref);
    });
  }

  Future<void> _refreshData() async {
    await ref
        .read(attendanceProvider.notifier)
        .getAttendanceHistoryByReceptionist(context: context, ref: ref);
  }

  @override
  Widget build(BuildContext context) {
    final attendanceState = ref.watch(attendanceProvider);

    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _refreshData,
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
                    attendanceState.isLoading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : attendanceState.error != null
                            ? Center(
                                child: Text(
                                  attendanceState.error!,
                                  style: const TextStyle(color: Colors.red),
                                ),
                              )
                            : attendanceState.attendances != null &&
                                    attendanceState.attendances!.isNotEmpty
                                ? ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount:
                                        attendanceState.attendances!.length,
                                    itemBuilder: (context, index) {
                                      final attendance =
                                          attendanceState.attendances![index];
                                      return historyAttendanceCard(
                                        context,
                                        attendance.attendedMethod.name,
                                        attendance.participant!.participantName,
                                        attendance.status.name,
                                        attendance.participant!.gender,
                                      );
                                    },
                                  )
                                : const Center(
                                    child: Text(
                                      'Tidak ada data',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
