import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdd_starter/core/locator.dart';
import 'package:tdd_starter/core/widgets/event_status_layout.dart';
import 'package:tdd_starter/features/home/presentation/bloc/home_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  HomeBloc homeBloc = locator<HomeBloc>();
  int count = 80;
  int millisecondsDuration = 100;

  int? activeItem;
  int? lastActiveItem;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Counter App",
        ),
        foregroundColor: themeData.colorScheme.onPrimary,
        backgroundColor: themeData.colorScheme.primary,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Change count:"),
                Slider(
                  value: count.toDouble(),
                  onChanged: (value) {
                    setState(() {
                      count = value.toInt();
                    });
                  },
                  label: "Count: $count",
                  max: 200,
                  min: 10,
                  divisions: 200,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("duration(milliseconds):"),
                Slider(
                  value: millisecondsDuration.toDouble(),
                  onChanged: (value) {
                    setState(() {
                      millisecondsDuration = value.toInt();
                    });
                  },
                  label: "milliseconds: $millisecondsDuration",
                  max: 6000,
                  min: 10,
                  divisions: 600,
                ),
              ],
            ),
            const Spacer(),
            BlocBuilder<HomeBloc, HomeState>(
              buildWhen: (previous, current) =>
                  previous.counterStatus != current.counterStatus,
              builder: (context, state) {
                return StateStatusLayout(
                  status: state.counterStatus,
                  onCompletedStatus: (context, data) {
                    return Center(
                        child: Text(
                      data.toString(),
                    ));
                  },
                  onErrorStatus: (error) {
                    return Center(
                      child: Text(
                        error.message,
                      ),
                    );
                  },
                  onInitialStatus: const Center(
                    child: Text(
                      "press button to start Timer",
                    ),
                  ),
                  onLoadingStatus: const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            ),
            const Spacer(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text(
          "Start",
          style: themeData.textTheme.bodyMedium!.apply(
            color: themeData.colorScheme.primary,
          ),
        ),
        onPressed: () {
          homeBloc.add(
            ListenCounterEvent(
              count: count,
              duration: Duration(
                milliseconds: millisecondsDuration,
              ),
            ),
          );
        },
      ),
    );
  }
}
