import 'package:eventpass_app/presentation/misc/colors.dart';
import 'package:eventpass_app/presentation/misc/methods.dart';
import 'package:eventpass_app/presentation/providers/usecases/register/notifier/register_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RoleSelection extends ConsumerWidget {
  const RoleSelection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final registerState = ref.watch(registerProvider);
    final selectedRole = registerState.selectedRole;
    final isRoleSelected = selectedRole != null && selectedRole.isNotEmpty;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Column(
            children: [
              Image(
                image: AssetImage('assets/welcome.png'),
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20), // Menambahkan ruang antar elemen
              Text(
                'Buat Akun',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          verticalSpace(20),
          const Text(
            "Daftar sebagai ",
            style: TextStyle(fontSize: 16),
          ),
          verticalSpace(10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shadowColor: Colors.transparent,
              minimumSize: const Size(double.infinity, 50),
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(
                  color: darkBlue,
                  width: 1,
                ),
              ),
            ),
            onPressed: () {
              ref.read(registerProvider.notifier).setRole("PARTICIPANT");
            },
            child: Row(
              children: [
                Icon(
                  selectedRole == "PARTICIPANT"
                      ? Icons.radio_button_on
                      : Icons.radio_button_off,
                  color: selectedRole == "PARTICIPANT" ? darkBlue : ghostBlack,
                ),
                horizontalSpace(8),
                Text(
                  "Pengunjung Event",
                  style: TextStyle(
                    color:
                        selectedRole == "PARTICIPANT" ? darkBlue : ghostBlack,
                  ),
                ),
              ],
            ),
          ),
          verticalSpace(10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(
                  color: darkBlue,
                  width: 1,
                ),
              ),
            ),
            onPressed: () {
              ref.read(registerProvider.notifier).setRole("EVENT_ORGANIZER");
            },
            child: Row(
              children: [
                Icon(
                  selectedRole == "EVENT_ORGANIZER"
                      ? Icons.radio_button_on
                      : Icons.radio_button_off,
                  color:
                      selectedRole == "EVENT_ORGANIZER" ? darkBlue : ghostBlack,
                ),
                horizontalSpace(8),
                Text(
                  "Penyelenggara Event",
                  style: TextStyle(
                    color: selectedRole == "EVENT_ORGANIZER"
                        ? darkBlue
                        : ghostBlack,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shadowColor: Colors.transparent,
              minimumSize: const Size(double.infinity, 50),
              disabledBackgroundColor: Colors.grey.shade200,
              backgroundColor: darkBlue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(
                  color: isRoleSelected ? darkBlue : Colors.grey,
                  width: 1,
                ),
              ),
            ),
            onPressed: () {
              ref.read(registerProvider.notifier).nextStep();
            },
            child: Text(
              "Selanjutnya",
              style:
                  TextStyle(color: isRoleSelected ? Colors.white : Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
