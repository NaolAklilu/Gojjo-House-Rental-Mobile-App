import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../Login/bloc/bloc.dart';
import '../../Post/bloc/bloc.dart';
import '../../Request/bloc/bloc.dart';
import '../bloc/bloc.dart';
import '../models/user.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your profile"),
        backgroundColor: Color.fromARGB(255, 112, 80, 67),
        foregroundColor: Colors.white,
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (_, state) {
          if (state is OperationFailed) {
            return const Text('Could load the requests.');
          }
          
          if (state is FetchcurrentUserSuccess) {
            final user = state.user;
            return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.blue,
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Name: ",
                            key: Key("fullname"),
                            style: TextStyle(),
                          ),
                          Text(
                              "  ${user.first_name} ${user.middle_name}"),
                        ],
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Username: ",
                            style: TextStyle(),
                          ),
                          Text(
                              "  ${user.username}"),
                        ],
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Email: ",
                            style: TextStyle(),
                          ),
                          Text("  ${user.email}"),
                        ],
                      ),
                      SizedBox(height: 10.0),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.edit,
              key: Key("icons")),
              title: Text("Edit profile"),
              onTap: () => context.push('/user_profile/edit_profile', extra: user),
            ),
            ListTile(
              leading: Icon(Icons.edit,
              key: Key("edit")),
              title: Text("Change password"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text("Your requests"),
              onTap: () {
                BlocProvider.of<RequestBloc>(context).add(CurrentUserRequests());
                context.push('/user_request_list');
              }
              ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text("Your posts"),
              onTap: () {
                BlocProvider.of<PostBloc>(context).add(CurrentUserPostList());
                context.push('/user_posts/current_user_posts');
              },
            ),
          ],
        ),
        
      );
          } else {
            return Scaffold(body: Center(child: Text("Current user data could not fetched."),),);
          }}
    ));
  }
}
