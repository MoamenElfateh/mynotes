import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynotes/constants/routes.dart';
import 'package:mynotes/views/login_view.dart';
import 'package:mynotes/views/notes/create_update_note_view.dart';
import 'package:mynotes/views/notes/notes_view.dart';
import 'package:mynotes/views/register_view.dart';
import 'package:mynotes/views/verify_email_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
      routes: {
        loginRoute: (context) => const LoginView(),
        registerRoute: (context) => const RegisterView(),
        notesRoute: (context) => const NotesView(),
        verifyEmailRoute: (context) => const VerifyEmailView(),
        createOrUpdateNoteRoute: (context) => const CreateUpdateNoteView(),
      },
    ),
  );
}

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: AuthService.firebase().initialize(),
//       builder: (context, snapshot) {
//         switch (snapshot.connectionState) {
//           case ConnectionState.done:
//             final user = AuthService.firebase().currentUser;
//             if (user != null) {
//               if (user.isEmailVerified) {
//                 return const NotesView();
//               } else {
//                 return const VerifyEmailView();
//               }
//             } else {
//               return const LoginView();
//             }

//           default:
//             return const CircularProgressIndicator();
//         }
//       },
//     );
//   }
// }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final TextEditingController _controller;
  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Testing Bloc'),
          backgroundColor: Colors.blue,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 25),
        ),
        body: BlocConsumer<CounterBloc, CounterState>(
          builder: (context, state) {
            final invalidValue =
                (state is CounterInvalidNumber) ? state.invalidValue : '';
            return Column(
              children: [
                Text('Current value : ${state.value}'),
                Visibility(
                  visible: state is CounterInvalidNumber,
                  child: Text('Invalid input : $invalidValue'),
                ),
                TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    hintText: 'Enter a number here',
                  ),
                  keyboardType: TextInputType.number,
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        context
                            .read<CounterBloc>()
                            .add(DecreamentEvent(value: _controller.text));
                      },
                      child: const Text('-'),
                    ),
                    TextButton(
                      onPressed: () {
                        context
                            .read<CounterBloc>()
                            .add(IncreamentEvent(value: _controller.text));
                      },
                      child: const Text('+'),
                    )
                  ],
                )
              ],
            );
          },
          listener: (context, state) {
            _controller.clear();
          },
        ),
      ),
    );
  }
}

@immutable
abstract class CounterState {
  final int value;
  const CounterState(this.value);
}

// He write like this and this give me error  >>
// const CounterStateValid (int value): super(value);
class CounterStateValid extends CounterState {
  const CounterStateValid({
    required int value,
  }) : super(value);
}

class CounterInvalidNumber extends CounterState {
  final String invalidValue;
  const CounterInvalidNumber({
    required this.invalidValue,
    required int previousvalue,
  }) : super(previousvalue);
}

@immutable
abstract class CounterEvent {
  final String value;
  const CounterEvent(this.value);
}

// He write like this and this give me error  >>
// const IncreamentEvent (String value): super(value);
class IncreamentEvent extends CounterEvent {
  const IncreamentEvent({
    required String value,
  }) : super(value);
}

// He write like this and this give me error  >>
// const DecreamentEvent (String value): super(value);
class DecreamentEvent extends CounterEvent {
  const DecreamentEvent({
    required String value,
  }) : super(value);
}

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterStateValid(value: 0)) {
    on<IncreamentEvent>((event, emit) {
      final integer = int.tryParse(event.value);
      if (integer == null) {
        emit(CounterInvalidNumber(
          invalidValue: event.value,
          previousvalue: state.value,
        ));
      } else {
        emit(
          CounterStateValid(value: state.value + integer),
        );
      }
    });
    on<DecreamentEvent>((event, emit) {
      final integer = int.tryParse(event.value);
      if (integer == null) {
        emit(CounterInvalidNumber(
          invalidValue: event.value,
          previousvalue: state.value,
        ));
      } else {
        emit(
          CounterStateValid(value: state.value - integer),
        );
      }
    });
  }
}
