import 'package:flutter/material.dart';
import 'package:flutter_playground/cartoon/models/cartoon_episode_model.dart';

import '../models/cartoon_detail_model.dart';
import '../services/api_service.dart';
import '../widgets/episode_widget.dart';

class DetailScreen extends StatefulWidget {

  final String title, thumb, id;

  const DetailScreen({
    super.key,
    required this.title,
    required this.thumb,
    required this.id
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  late Future<CartoonDetailModel> cartoon;
  late Future<List<CartoonEpisodeModel>> episodeList;

  @override
  void initState() {
    super.initState();
    cartoon = ApiService.getCartoonById(widget.id);
    episodeList = ApiService.getLastEpisodeById(widget.id);
  }

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
        actions: [
          IconButton(
              onPressed: (){},
              icon: const Icon(Icons.favorite_outline_outlined),
          )
        ],
        title: Text(
          widget.title,
          style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: widget.id,
                    child: Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 15,
                                  offset: const Offset(10, 10),
                                  color: Colors.black.withOpacity(0.5)
                              )
                            ]
                        ),
                        width: 250,
                        child: Image.network(
                          widget.thumb,
                          headers: const {"User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",},
                        )
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              FutureBuilder(
                  future: cartoon,
                  builder: (context, snapshot) {
                    if(snapshot.hasData) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            snapshot.data!.about,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            '${snapshot.data!.genre} / ${snapshot.data!.age}',
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      );
                    }
                    return const Text("...");
                  }
              ),
              const SizedBox(
                height: 30,
              ),
              FutureBuilder(
                  future: episodeList,
                  builder: (context, snapshot) {
                    if(snapshot.hasData) {
                      return Column(
                        children: [
                          for (var episode in snapshot.data!)
                            Episode(episode: episode, webtoonId: widget.id),
                        ],
                      );
                    }
                    return Container();
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }
}