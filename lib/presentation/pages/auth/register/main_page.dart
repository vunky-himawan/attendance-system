import 'package:eventpass_app/presentation/pages/auth/register/methods/account_info.dart';
import 'package:eventpass_app/presentation/pages/auth/register/methods/event_organizer_personal_infor.dart';
import 'package:eventpass_app/presentation/pages/auth/register/methods/participant_personal_info.dart';
import 'package:eventpass_app/presentation/pages/auth/register/methods/role_selection.dart';
import 'package:eventpass_app/presentation/pages/auth/register/methods/take_face_photo.dart';
import 'package:eventpass_app/presentation/providers/usecases/register/notifier/register_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterMainPage extends ConsumerStatefulWidget {
  const RegisterMainPage({super.key});

  @override
  ConsumerState<RegisterMainPage> createState() => _RegisterMainPageState();
}

class _RegisterMainPageState extends ConsumerState<RegisterMainPage> {
  @override
  Widget build(BuildContext context) {
    final registerState = ref.watch(registerProvider);

    Widget getStepContent() {
      if (registerState.currentStep == 0) {
        return const RoleSelection();
      }

      // After role selection
      if (registerState.selectedRole == 'PARTICIPANT') {
        switch (registerState.currentStep) {
          case 1:
            return const PersonalInfoInput();
          case 2:
            return const AccountInfo();
          case 3:
            return const TakeFacePhoto();
          default:
            return const RoleSelection();
        }
      } else {
        switch (registerState.currentStep) {
          case 1:
            return const EventOrganizerInfo();
          case 2:
            return const AccountInfo(
              isLastStep: true,
            );
          default:
            return const RoleSelection();
        }
      }
    }

    return Scaffold(
      body: SafeArea(
        child: getStepContent(),
      ),
    );
  }
}
