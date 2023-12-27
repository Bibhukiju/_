import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:blog_app/core/constants/screen_const.dart';
import 'package:blog_app/modules/auth/presentations/bloc/auth_cubit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/images/bg.jpg",
                ),
                fit: BoxFit.fill)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .1,
            ),
            Hero(
                tag: "Title",
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Serenade",
                      style:
                          Theme.of(context).textTheme.displayMedium!.copyWith(
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
                  ],
                )),
            const SizedBox(
              height: 10,
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: FaIcon(
                            FontAwesomeIcons.google,
                            color: Colors.red,
                          ),
                        ),
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
            ),
          ],
        ),
      ),
    );
  }
}
