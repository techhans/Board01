package com.springmvc.my.dao;

import java.util.List;

import com.springmvc.my.domain.CommentDto;

public interface CommentDao {
    int count(Integer bno) throws Exception;
    int deleteAll(Integer bno);
    int delete(Integer cno, String commenter) throws Exception;
    int insert(CommentDto dto) throws Exception;
    List<CommentDto> selectAll(Integer bno) throws Exception;
    CommentDto select(Integer cno) throws Exception;
    int update(CommentDto dto) throws Exception;
}
