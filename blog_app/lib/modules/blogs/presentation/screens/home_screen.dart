import 'package:blog_app/modules/blogs/data/models/blog_model.dart';
import 'package:blog_app/modules/blogs/presentation/cubit/blog_cubit.dart';
import 'package:blog_app/modules/blogs/presentation/widgets/trending_blog_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<BlogCubit>().getAllBlogsType();
    return BlocBuilder<BlogCubit, BlogState>(
      builder: (context, state) {
        if (state is AllBlogsLoaded) {
          return BlogsLoadedScreen(
            blogs: state.blogs,
          );
        } else if (state is BlogsInitialState) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else {
          return const Scaffold(
            body: Center(child: Text("error")),
          );
        }
      },
    );
  }
}

class BlogsLoadedScreen extends StatelessWidget {
  final List<BlogModel> blogs;
  const BlogsLoadedScreen({
    super.key,
    required this.blogs,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello!"),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const FaIcon(FontAwesomeIcons.magnifyingGlass))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Trending",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Flexible(
              flex: 1,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: blogs.length,
                itemBuilder: (BuildContext context, int index) {
                  return TrendingBlogCard(blog: blogs[index]);
                },
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(),
            )
          ],
        ),
      ),
    );
  }
}
