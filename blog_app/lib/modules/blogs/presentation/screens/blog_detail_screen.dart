import 'package:blog_app/modules/blogs/data/models/blog_model.dart';
import 'package:flutter/material.dart';

class BlogDetailScreen extends StatelessWidget {
  const BlogDetailScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final blog = ModalRoute.of(context)!.settings.arguments as BlogModel;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                blog.title!,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Image.network(blog.blogImage ?? ""),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage:
                        NetworkImage(blog.user?.imageAddress ?? ""),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Text(blog.user?.name ?? ""),
                      Text(blog.user?.name ?? ""),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
