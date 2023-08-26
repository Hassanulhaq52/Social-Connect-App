import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/bloc/login_bloc/login_bloc.dart';

import '../models/user.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    Key? key,
  }) : super(key: key);

  Widget _buildProfileInfo(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(value),
      ],
    );
  }

  String getAddressString(Address address) {
    return "${address.street}, ${address.suite}, ${address.city}";
  }

// ...

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    _buildProfileInfo("Name", state.user!.name),
                    Divider(color: Colors.black26),
                    _buildProfileInfo("Username", state.user!.username),
                    Divider(color: Colors.black26),
                    _buildProfileInfo(
                        "Address", getAddressString(state.user!.address)),
                    Divider(color: Colors.black26),
                    _buildProfileInfo("Zipcode", state.user!.address.zipcode),
                    Divider(color: Colors.black26),
                    // Add more profile information here with dividers
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
