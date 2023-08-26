import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/bloc/login_bloc/login_bloc.dart';
import 'package:task/services/user_service.dart';

import '../models/post.dart';
import '../utils/contants.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Scaffold(
          body: FutureBuilder(
            future: UserService().getPost(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    Post post = snapshot.data![index];
                    bool isOwn = post.userId == state.user!.id;
                    return Column(
                      children: [
                        ListTile(
                          title: Padding(
                            padding:
                                const EdgeInsets.only(bottom: 8.0, top: 18),
                            child: Text(
                              post.title,
                              style: TextStyle(
                                color: isOwn
                                    ? Color(int.parse(Constants.primaryColor))
                                    : Colors.black,
                                fontWeight:
                                    isOwn ? FontWeight.w600 : FontWeight.w400,
                              ),
                            ),
                          ),
                          subtitle: Text(post.body),
                        ),
                        const Divider(color: Colors.black26),
                      ],
                    );
                  },
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            backgroundColor: Color(int.parse(Constants.primaryColor)),
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
