import 'package:eventpass_app/domain/entities/user/user/user.dart';
import 'package:eventpass_app/infrastructure/config/app_config.dart';
import 'package:eventpass_app/presentation/misc/colors.dart';
import 'package:eventpass_app/presentation/misc/methods.dart';
import 'package:eventpass_app/presentation/pages/receptionist/attendance_with_pin/main.dart';
import 'package:eventpass_app/presentation/pages/receptionist/face_recognition/face_recognition_page.dart';
import 'package:eventpass_app/presentation/providers/attendance_data/attendance_provider_setup.dart';
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
  void _handleRetry(String? participantId) {
    final attendanceState = ref.watch(attendanceProvider);
    final notifier = ref.read(attendanceProvider.notifier);
    final currentRetryCount = attendanceState.retryCount;

    notifier.incrementRetryCount();

    if (currentRetryCount >= 3) {
      notifier.resetRetryCount();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const AttendanceWithPinPage()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const FaceRecognitionPage()),
      );
    }
  }

  String _formatTanggal(String? dateString) {
    if (dateString == null || dateString.isEmpty) return '-';
    try {
      initializeDateFormatting('id_ID');
      final date = DateTime.parse(dateString);
      return DateFormat('dd MMMM yyyy', 'id_ID').format(date);
    } catch (e) {
      return '-';
    }
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;

    print("received args ${args}");

    if (args is! User) {
      print("args ${args}");

      return const Scaffold(
        body: Center(
          child: Text('Data tidak valid: Argumen bukan tipe User'),
        ),
      );
    }

    final User userData = args;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            children: [
              Positioned.fill(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Foto Profil
                    CircleAvatar(
                      radius: 75,
                      backgroundImage: userData.photoUrl != null
                          ? NetworkImage(
                              '${AppConfig.assetBaseUrl}/${userData.photoUrl}')
                          : const AssetImage('assets/images/default_avatar.png')
                              as ImageProvider,
                      backgroundColor: Colors.grey[200],
                    ),
                    verticalSpace(20),
                    const Text(
                      'Verifikasi Data',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    verticalSpace(20),
                    _buildParticipantInfo(context, userData),
                  ],
                ),
              ),
              // Tombol Aksi
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    _buildRetryButton(context, userData),
                    verticalSpace(10),
                    _buildConfirmButton(context, userData),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildParticipantInfo(BuildContext context, User data) {
    final participantDetails = data.details is ParticipantDetails
        ? (data.details as ParticipantDetails).participant
        : null;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(10),
          _buildInfoRow(
              'Nama Lengkap', participantDetails?.participantName ?? '-'),
          verticalSpace(10),
          _buildInfoRow('Email', data.email ?? '-'),
          verticalSpace(10),
          _buildInfoRow(
            'Tanggal Lahir',
            _formatTanggal(participantDetails?.birthDate),
          ),
          verticalSpace(10),
          _buildInfoRow('Jenis Kelamin', participantDetails?.gender ?? '-'),
          verticalSpace(10),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 1,
          child: Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Flexible(
          flex: 2,
          child: Text(
            value,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }

  Widget _buildRetryButton(BuildContext context, User data) {
    final participantId = (data.details is ParticipantDetails)
        ? (data.details as ParticipantDetails).participant.participantId
        : null;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        side: const BorderSide(color: darkBlue),
      ),
      onPressed: () => _handleRetry(participantId),
      child: const Text(
        'Ulangi',
        style: TextStyle(color: darkBlue),
      ),
    );
  }

  Widget _buildConfirmButton(BuildContext context, User data) {
    final participantId = (data.details is ParticipantDetails)
        ? (data.details as ParticipantDetails).participant.participantId
        : null;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        backgroundColor: darkBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: () {
        ref.read(attendanceProvider.notifier).faceAttendanceConfirmation(
              ref: ref,
              context: context,
              isCorrect: true,
              participantId: participantId ?? '',
            );
      },
      child: const Text(
        'Konfirmasi',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
