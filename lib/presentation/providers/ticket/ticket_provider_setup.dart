import 'package:eventpass_app/domain/repositories/ticket/ticket_repository.dart';
import 'package:eventpass_app/domain/usecases/check_ticket/check_ticket_usecase.dart';
import 'package:eventpass_app/infrastructure/implementation/ticket/ticket_repository_implementation.dart';
import 'package:eventpass_app/presentation/providers/ticket/ticket_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final ticketRepositoryProvider = Provider<TicketRepository>((ref) {
  return TicketRepositoryImplementation();
});

final checkTicketUsecaseProvider = Provider<CheckTicketUsecase>((ref) {
  final repository = ref.watch(ticketRepositoryProvider);
  return CheckTicketUsecase(
    ticketRepository: repository,
  );
});

final ticketProvider =
    StateNotifierProvider<TicketProviderNotifier, TicketState>((ref) {
  final checkTicketUsecase = ref.watch(checkTicketUsecaseProvider);

  return TicketProviderNotifier(
    checkTicketUsecase: checkTicketUsecase,
  );
});
