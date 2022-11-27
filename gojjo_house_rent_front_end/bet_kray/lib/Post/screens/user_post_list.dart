import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/bloc.dart';

class UserPostList extends StatelessWidget {
  const UserPostList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List user of posts'),
        backgroundColor: Color.fromARGB(255, 112, 80, 67),
        foregroundColor: Colors.white,
      ),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (_, state) {
          if (state is FailedOperation) {
            return const Text('Could not do request operation');
          }

          if (state is CurrentUserPostOperationSuccess) {
            final posts = state.posts;
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (BuildContext context, int index) {
                final userPost = posts.elementAt(index);
                return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 35.0, vertical: 15.0),
                    child: Stack(
                      children: [
                        Container(
                          height: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: const Color.fromARGB(255, 7, 156, 255),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          left: 0,
                          child: Container(
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(20.0),
                                  bottomRight: Radius.circular(20.0)),
                              color: Colors.black.withOpacity(0.6),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Address: ${userPost.subcity}, ${userPost.city}, Ethiopia",
                                        style: const TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Price: ${userPost.price} Birr",
                                        style: const TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "description: ${userPost.description}",
                                        style: const TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  
                                      Row(
                                        children: [
                                          Expanded(
                                            child: RaisedButton(
                                              color: Colors.red,
                                              onPressed: () {
                                                  BlocProvider.of<PostBloc>(context)
                                                      .add(
                                                          PostDelete('${userPost.id}'));
                                                },
                                              child: const Padding(
                                                padding: EdgeInsets.all(10.0),
                                                child: Text("delete",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.white,
                                                        fontWeight: FontWeight.bold)),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: RaisedButton(
                                              color: Colors.blue,
                                              onPressed: () => context.go(
                                                  '/user_posts/post_update',
                                                  extra: userPost,),
                                              child: const Padding(
                                                padding: EdgeInsets.all(10.0),
                                                child: Text("edit",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.white,
                                                        fontWeight: FontWeight.bold)),
                                              ),
                                            ),
                                          ),
                                    ],
                                  ),
                                ],
                              ),
                    ),
                ),
                )
                ]
                )
                );
                
              },
            );
          } else {
            return Text("Could not load");}
          }
    )
    );
  }
}
