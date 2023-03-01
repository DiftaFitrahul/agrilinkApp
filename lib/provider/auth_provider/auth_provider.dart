import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gdsc_project/service/auth_service/authentication_service.dart';

final authProvider = Provider<AuthenticationService>(
  (ref) => AuthenticationService(),
);

final userStreamState = StreamProvider<User?>(
  (ref) => ref.read(authProvider).userState,
);
