import 'package:eventpass_app/presentation/misc/colors.dart';
import 'package:eventpass_app/presentation/misc/methods.dart';
import 'package:eventpass_app/presentation/providers/usecases/register/notifier/register_notifier.dart';
import 'package:eventpass_app/presentation/widgets/input/custom_drop_down.dart';
import 'package:eventpass_app/presentation/widgets/input/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PersonalInfoInput extends ConsumerStatefulWidget {
  const PersonalInfoInput({super.key});

  @override
  ConsumerState<PersonalInfoInput> createState() => _PersonalInfoInputState();
}

class _PersonalInfoInputState extends ConsumerState<PersonalInfoInput> {
  String? _selectedGender;
  final _fullNameController = TextEditingController();
  final _ageController = TextEditingController();
  final _birthDateController = TextEditingController();
  DateTime? selectedDate;

  // Add listeners to update button state when text changes
  @override
  void initState() {
    super.initState();
    _fullNameController.addListener(_updateButtonState);
    _ageController.addListener(_updateButtonState);
    _birthDateController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    _fullNameController.removeListener(_updateButtonState);
    _ageController.removeListener(_updateButtonState);
    _birthDateController.removeListener(_updateButtonState);
    _fullNameController.dispose();
    _ageController.dispose();
    _birthDateController.dispose();
    super.dispose();
  }

  // Check if all fields are filled
  bool get _isFormValid {
    return _fullNameController.text.isNotEmpty &&
        _ageController.text.isNotEmpty &&
        _birthDateController.text.isNotEmpty &&
        _selectedGender != null;
  }

  void _updateButtonState() {
    setState(() {}); // Trigger rebuild to update button state
  }

  Future<void> _selectDate(BuildContext context) async {
    try {
      final DateTime currentDate = DateTime.now();

      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(1900),
        lastDate: currentDate,
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: darkBlue,
              ),
            ),
            child: child!,
          );
        },
      );

      if (picked != null) {
        setState(() {
          selectedDate = picked;

          // Format tanggal menjadi YYYY-MM-DD
          final formattedDate =
              "${picked.year.toString().padLeft(4, '0')}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
          _birthDateController.text = formattedDate;
        });
      }
    } catch (e) {
      print("Error in _selectDate: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error selecting date: $e')),
      );
    }
  }

  void _onNext() {
    ref.read(registerProvider.notifier).setParticipantInfo(
          fullName: _fullNameController.text,
          age: _ageController.text,
          birthDate: _birthDateController.text,
          gender: _selectedGender!,
        );
    ref.read(registerProvider.notifier).nextStep();
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
              labelText: 'Nama Lengkap',
              controller: _fullNameController,
              hintText: 'Nama Lengkap',
            ),
            verticalSpace(10),
            CustomTextField(
              labelText: 'Umur',
              controller: _ageController,
              hintText: 'Umur',
              isNumber: true,
            ),
            verticalSpace(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Tanggal Lahir',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                InkWell(
                  onTap: () => _selectDate(context),
                  child: IgnorePointer(
                    child: TextFormField(
                      controller: _birthDateController,
                      decoration: InputDecoration(
                        hintText: 'Tanggal Lahir',
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w300,
                        ),
                        suffixIcon:
                            const Icon(Icons.calendar_today, color: darkBlue),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: ghost.withOpacity(0.5)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(color: darkBlue),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            verticalSpace(10),
            CustomDropDown(
              categories: const ["Laki-laki", "Perempuan"],
              labelText: "Jenis Kelamin",
              hintText: "Pilih Jenis Kelamin",
              onSelect: (value) => setState(() {
                _selectedGender = value;
                _updateButtonState(); // Update button state when gender is selected
              }),
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
              onPressed: _isFormValid ? _onNext : null,
              child: Text(
                "Selanjutnya",
                style: TextStyle(
                  color: _isFormValid ? Colors.white : Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
