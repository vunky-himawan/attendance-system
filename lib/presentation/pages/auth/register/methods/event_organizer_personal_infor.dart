import 'package:eventpass_app/presentation/misc/colors.dart';
import 'package:eventpass_app/presentation/misc/methods.dart';
import 'package:eventpass_app/presentation/providers/usecases/register/notifier/register_notifier.dart';
import 'package:eventpass_app/presentation/widgets/input/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EventOrganizerInfo extends ConsumerStatefulWidget {
  const EventOrganizerInfo({
    super.key,
  });

  @override
  ConsumerState<EventOrganizerInfo> createState() => _EventOrganizerInfoState();
}

class _EventOrganizerInfoState extends ConsumerState<EventOrganizerInfo> {
  final TextEditingController _organizationNameController =
      TextEditingController();
  final TextEditingController _organizationEmailController =
      TextEditingController();
  final TextEditingController _organizationPhoneController =
      TextEditingController();
  final TextEditingController _organizationAddressController =
      TextEditingController();
  final TextEditingController _organizationDescriptionController =
      TextEditingController();

  void _onNext() {
    try {
      ref.read(registerProvider.notifier).setOrganizerInfo(
            organizationName: _organizationNameController.text,
            organizationDescription: _organizationDescriptionController.text,
            organizationAddress: _organizationAddressController.text,
            organizationEmail: _organizationEmailController.text,
            organizationPhone: _organizationPhoneController.text,
          );
      ref.read(registerProvider.notifier).nextStep();
    } catch (e) {
      print("ERROR DI REGISTER: ${e.toString()}");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const Column(
              children: [
                Image(
                  image: AssetImage('assets/welcome.png'),
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 20),
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
            CustomTextField(
              labelText: 'Nama Organisasi',
              controller: _organizationNameController,
              hintText: 'Nama Organisasi',
            ),
            verticalSpace(10),
            CustomTextField(
              labelText: 'Alamat Organisasi',
              controller: _organizationAddressController,
              hintText: 'Alamat Organisasi',
            ),
            verticalSpace(10),
            CustomTextField(
              labelText: 'Nomor Telepon Organisasi',
              controller: _organizationPhoneController,
              hintText: 'Nomor Telepon Organisasi',
              isNumber: true,
            ),
            verticalSpace(10),
            CustomTextField(
              labelText: 'Email Organisasi',
              controller: _organizationEmailController,
              hintText: 'Email Organisasi',
            ),
            verticalSpace(10),
            CustomTextField(
              labelText: 'Deskripsi Organisasi',
              controller: _organizationDescriptionController,
              hintText: 'Deskripsi Organisasi',
              maxLines: 5,
            ),
            verticalSpace(10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shadowColor: Colors.transparent,
                minimumSize: const Size(double.infinity, 50),
                disabledBackgroundColor: Colors.grey.shade200,
                backgroundColor: darkBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(
                    color: darkBlue,
                    width: 1,
                  ),
                ),
              ),
              onPressed: () {
                _onNext();
              },
              child: const Text(
                "Selanjutnya",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
