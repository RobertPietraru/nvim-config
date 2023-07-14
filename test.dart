import 'package:bibro/core/blocs/cubit/auth_cubit.dart';
import 'package:bibro/core/blocs/observer/auth_observer.dart';
import 'package:bibro/core/injection.dart';
import 'package:bibro/core/router/app_router.dart';
import 'package:bibro/design/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  await inject();
  runApp(const BibRo());
}

class BibRo extends StatefulWidget {
  const BibRo({super.key});

  @override
  State<BibRo> createState() => _BibRoState();
}

class _BibRoState extends State<BibRo> {
  final lightTheme = LightAppThemeData();
  final darkTheme = DarkAppThemeData();
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return AppTheme(
      lightTheme: lightTheme,
      darkTheme: darkTheme,
      child: BlocProvider(
        create: (_) => AuthCubit(locator()),
        child: Builder(builder: (context) {
          Bloc.observer =
              AuthBlocObserver(authCubit: context.read<AuthCubit>());

          AppTheme.of(context);
          return MaterialApp.router(
            routerConfig: _appRouter.config(),
            title: 'BibRo',
            theme: darkTheme.materialThemeData(context),
            darkTheme: darkTheme.materialThemeData(context),
          );
        }),
      ),
    );
  }
}

@RoutePage(name: 'AuthenticationWrapperRoute')
class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return AutoRouter.declarative(
          routes: (_) {
            // Declaratively define your routes here

            if (state is AuthAuthenticatedState) {
              return [const ProfileFlowRoute()];
            } else if (state is AuthUnauthenticatedState) {
              return [const LoginRoute()];
            } else if (state is AuthFailureState) {
              return [ErrorRoute(message: state.failure.message)];
            }
            return [const LoadingRoute()];
          },
        );
      },
    );
  }
}

@RoutePage(name: 'ErrorRoute')
class ErrorScreen extends StatelessWidget {
  final String message;
  const ErrorScreen({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NameBloc, NameState>(builder: (context, state) {
      return Container(
          child: Potato(
              child: Container(
                  child: Scaffold(
        body: Center(
            child: Text(
          message,
          style:
              context.theme.mediumTextStyle.copyWith(color: context.theme.bad),
        )),
      ))));
    });
  }
}
