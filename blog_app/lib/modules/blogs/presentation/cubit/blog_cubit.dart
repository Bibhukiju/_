// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:blog_app/modules/blogs/data/models/blog_model.dart';
import 'package:blog_app/modules/blogs/domain/usecases/get_all_blogs_usecase.dart';

import '../../../../core/error/failure.dart';

part 'blog_state.dart';

class BlogCubit extends Cubit<BlogState> {
  GetAllBlogsUseCase getAllBlogsUseCase;
  BlogCubit({
    required this.getAllBlogsUseCase,
  }) : super(BlogsInitialState());

  Future<void> getAllBlogsType() async {
    final getAllBlogs = await getAllBlogsUseCase.call();
    getAllBlogs.fold(
      (l) {
        if (l is ServerFailure) {
          emit(FailureBlogState(l.failureMessage));
        } else if (l is GenericFailure) {
          emit(FailureBlogState(l.failureMessage));
        }
      },
      (r) => emit(AllBlogsLoaded(r)),
    );
  }
}
