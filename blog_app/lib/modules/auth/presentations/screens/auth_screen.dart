import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:blog_app/core/constants/screen_const.dart';
import 'package:blog_app/modules/auth/presentations/bloc/auth_cubit.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                  "https://wallpaperaccess.com/full/8323353.png",
                ),
                fit: BoxFit.fill)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .1,
            ),
            Text(
              "Serenade",
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    color: Colors.white,
                  ),
            ),
            Text(
              "Sphere",
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(color: Colors.white),
            ),
            Text(
              "Every Blog at Your Fingertips!",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const Spacer(),
            Center(
              child: BlocListener<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is LoggedInState) {
                    Navigator.popAndPushNamed(context, ScreenConst.homeScreen);
                  }
                  if (state is FailureState) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("error"),
                    ));
                  }
                },
                child: OutlinedButton(
                  onPressed: () {
                    context.read<AuthCubit>().signIn();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Continue with google",
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(color: Colors.white)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
