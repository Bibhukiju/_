
import 'package:blog_app/core/constants/screen_const.dart';
import 'package:blog_app/modules/blogs/data/models/blog_model.dart';
import 'package:flutter/material.dart';

class TrendingBlogCard extends StatelessWidget {
  final BlogModel blog;
  const TrendingBlogCard({super.key, required this.blog});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ScreenConst.blogDetailScreen,
            arguments: blog);
      },
      child: Container(
        margin: const EdgeInsets.only(top: 5, right: 10),
        width: MediaQuery.of(context).size.width / 1.5,
        child: Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.red,
                      image: DecorationImage(
                          image: NetworkImage(blog.blogImage ?? ""),
                          fit: BoxFit.fitHeight),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          blog.title ?? "",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 12,
                              backgroundImage:
                                  NetworkImage(blog.user?.imageAddress ?? ""),
                            ),
                            const Flexible(
                                child: SizedBox(
                              width: 5,
                            )),
                            Text(blog.user?.name ?? "")
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
