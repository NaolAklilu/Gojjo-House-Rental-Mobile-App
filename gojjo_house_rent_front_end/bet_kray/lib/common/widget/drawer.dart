// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:bet_kray/User/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../Login/bloc/bloc.dart';
import '../../User/models/user.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(builder: (_, state) {
      if (state is AdminLoginSuccesState) {
        final username = state.name;
        final email = state.email;
        return BlocBuilder<UserBloc, UserState>(
        builder: (_, state) {
          if (state is OperationFailed) {
            return const Text('Could load the requests.');
          }
          
          if (state is FetchcurrentUserSuccess) {
            final user = state.user;
            return 
         Drawer(
          key: Key("drawer"),
              child: Column(
        children: [
          Container(
            key: Key("container"),
            color: Color.fromARGB(255, 112, 80, 67),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.account_circle_outlined,
                    size: 55,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    key: Key("ismi"),
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(

                            "username: ${user.username}",
                            style: TextStyle(
                                color: Colors.white, letterSpacing: 1.1),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "email: ${user.email}",
                            style: TextStyle(
                                color: Colors.white, letterSpacing: 1.1),
                          )
                        ],
                      ),
                      IconButton(
                        key: Key("icons"),
                        icon: const Icon(Icons.edit),
                        color: Colors.white,
                        onPressed: () {
                         context.go('/user_profile');
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              key: Key("colu"),
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  key: Key("listtile"),
                    title: Text("Add post"),
                    leading: Icon(Icons.add),
                    onTap: () => context.push('/user_posts/add_post')),
                ListTile(
                  title: Text("Add request"),
                  leading: Icon(Icons.add),
                  onTap: () => context.push('/request_list/add_request'),
                ),
                ListTile(
                      title: Text("Requestlist"),
                      leading: Icon(Icons.format_list_bulleted),
                      onTap: () => context.push('/admin_profile/requestlist')),
                  ListTile(
                      title: Text("Post List"),
                      leading: Icon(Icons.format_list_bulleted),
                      onTap: () => context.push('/admin_profile/postlist')),
                  ListTile(
                    title: Text("User List"),
                    leading: Icon(Icons.format_list_bulleted),
                    onTap: () => context.push('/admin_profile/userlist'),
                  ),              
              ],
            ),
          )]));     
      }else {
        return Text("User data not found");
      }
      }
        );
      }

      if (state is UserLoginSuccessState) {
        final username = state.name;
        final email = state.email;
        return BlocBuilder<UserBloc, UserState>(
        builder: (_, state) {
          if (state is OperationFailed) {
            return const Text('Could load the requests.');
          }
          
          if (state is FetchcurrentUserSuccess) {
            final user = state.user;
            return
        Drawer(child:ReusableDrawer(user: user));
      } else {
        return Text("User data not found");
      }
        }
        );
      }else {
        return Text("User data not found");
      }
    }
    
    );
    
  } 
}

class ReusableDrawer extends StatelessWidget {
  const ReusableDrawer({Key? key, required this.user})
      : super(key: key);
  final User user;
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Container(
            color: Color.fromARGB(255, 112, 80, 67),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.account_circle_outlined,
                    size: 55,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    key: Key("row"),
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "username: ${user.username}",
                            style: TextStyle(
                                color: Colors.white, letterSpacing: 1.1),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "email: ${user.email}",
                            style: TextStyle(
                                color: Colors.white, letterSpacing: 1.1),
                          )
                        ],
                      ),
                      IconButton(
                        key: Key("buttonicon"),
                        icon: const Icon(Icons.edit),
                        color: Colors.white,
                        onPressed: () {
                          BlocProvider.of<UserBloc>(context).add(LoadCurrentUser());
                         context.go('/user_profile');
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                    title: Text("Post List"),
                    leading: Icon(Icons.home),
                    onTap: () => context.push('/user_posts')),
                ListTile(
                    title: Text("Request list"),
                    leading: Icon(Icons.format_list_bulleted),
                    onTap: () => context.push('/request_list')),
                ListTile(
                    title: Text("Add post"),
                    leading: Icon(Icons.add),
                    onTap: () => context.push('/user_posts/add_post')),
                ListTile(
                  title: Text("Add request"),
                  leading: Icon(Icons.add),
                  onTap: () => context.push('/request_list/add_request'),
                ),
                
              ],
            ),
          ),
        ],
    );
  }
}
