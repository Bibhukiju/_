// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'blog_cubit.dart';

@freezed
class BlogState extends Equatable {
  @override
  List<Object?> get props => [];
}

class BlogsInitialState extends BlogState {}

class AllBlogsLoaded extends BlogState {
  final List<BlogModel> blogs;
  AllBlogsLoaded(
    this.blogs,
  );
}

class FailureBlogState extends BlogState {
  final String? failureMessage;

  FailureBlogState([this.failureMessage]);
}
