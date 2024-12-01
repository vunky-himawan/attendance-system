import 'package:eventpass_app/domain/entities/user/user/user.dart';
import 'package:eventpass_app/infrastructure/config/api_config.dart';
import 'package:eventpass_app/presentation/misc/colors.dart';
import 'package:eventpass_app/presentation/misc/methods.dart';
import 'package:eventpass_app/presentation/pages/receptionist/attendance_with_pin/main.dart';
import 'package:eventpass_app/presentation/pages/receptionist/face_recognition/face_recognition_page.dart';
import 'package:eventpass_app/presentation/providers/receptionist/attendance/attendance_data_provider.dart';
import 'package:eventpass_app/presentation/widgets/divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class AttendanceConfirmationPage extends ConsumerStatefulWidget {
  const AttendanceConfirmationPage({super.key});

  @override
  ConsumerState<AttendanceConfirmationPage> createState() =>
      _AttendanceConfirmationPageState();
}

class _AttendanceConfirmationPageState
    extends ConsumerState<AttendanceConfirmationPage> {
  void _handleRetry(String participantId) {
    final currentRetryCount =
        ref.read(attendanceDataProvider.notifier).retryCount;

    ref.read(attendanceDataProvider.notifier).retryCount =
        currentRetryCount + 1;

    if (currentRetryCount >= 3) {
      ref.read(attendanceDataProvider.notifier).resetRetryCount();

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const AttendanceWithPinPage(),
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const FaceRecognitionPage();
          },
        ),
      );
    }
  }

  String _formatTanggal(String? dateString) {
    if (dateString == null || dateString.isEmpty) return '';
    try {
      initializeDateFormatting('id_ID');

      final date = DateTime.parse(dateString);

      String formattedDate = DateFormat('dd MMMM yyyy', 'id_ID').format(date);

      return formattedDate;
    } catch (e) {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final User data = ModalRoute.of(context)?.settings.arguments as User;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Positioned.fill(
                child: Container(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Column(
                            children: [
                              Container(
                                width: 150,
                                height: 150,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        '${ApiConfig.appUrl}/static/${data.photoUrl}'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              verticalSpace(15),
                              const Text(
                                'Verifikasi Data',
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        verticalSpace(15),
                        Container(
                          padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                          child: Column(
                            children: [
                              divider(context),
                              verticalSpace(10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Expanded(
                                    flex: 1,
                                    child: Text(
                                      "Nama Lengkap",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      data.details is ParticipantDetails
                                          ? (data.details as ParticipantDetails)
                                              .participant
                                              .participantName
                                          : '',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),
                                ],
                              ),
                              verticalSpace(15),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Expanded(
                                    flex: 1,
                                    child: Text(
                                      "Email",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      data.email ?? '',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),
                                ],
                              ),
                              verticalSpace(15),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Expanded(
                                    flex: 1,
                                    child: Text(
                                      "Tanggal Lahir",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      data.details is ParticipantDetails
                                          ? _formatTanggal((data.details
                                                  as ParticipantDetails)
                                              .participant
                                              .birthDate)
                                          : '',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),
                                ],
                              ),
                              verticalSpace(15),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Expanded(
                                    flex: 1,
                                    child: Text(
                                      "Jenis Kelamin",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      data.details is ParticipantDetails
                                          ? (data.details as ParticipantDetails)
                                              .participant
                                              .gender
                                          : '',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),
                                ],
                              ),
                              verticalSpace(10),
                              divider(context),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          side: const BorderSide(color: darkBlue),
                        ),
                        onPressed: () {
                          _handleRetry(data.details is ParticipantDetails
                              ? (data.details as ParticipantDetails)
                                  .participant
                                  .participantId!
                              : '');
                        },
                        child: const Text(
                          'Ulangi',
                          style: TextStyle(color: darkBlue),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                          backgroundColor: darkBlue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          ref
                              .read(attendanceDataProvider.notifier)
                              .faceAttendanceConfirmation(
                                  context,
                                  true,
                                  data.details is ParticipantDetails
                                      ? (data.details as ParticipantDetails)
                                          .participant
                                          .participantId!
                                      : '');
                        },
                        child: const Text(
                          'Konfirmasi',
                          style: TextStyle(color: Colors.white),
                        ),
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
