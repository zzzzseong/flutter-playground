import 'package:flutter/material.dart';
import 'package:flutter_playground/cartoon/models/cartoon_model.dart';
import 'package:flutter_playground/cartoon/widgets/cartoon_widget.dart';

import '../services/api_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<CartoonModel>> cartoons = ApiService.getTodayCartoons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 3,
        surfaceTintColor: Colors.white,
        shadowColor: Colors.black,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: const Text(
          "Today's cartoons",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600
          ),
        ),
      ),
      body: FutureBuilder(
          future: cartoons,
          builder: (context, snapshot) {
            if(snapshot.hasData) {
              return Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Expanded(
                      child: makeList(snapshot)
                  )
                ],
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<CartoonModel>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      itemBuilder: (context, index) {
        var cartoon = snapshot.data![index];
        return Cartoon(title: cartoon.title, thumb: cartoon.thumb, id: cartoon.id);
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          width: 40,
        );
      },
    );
  }
}
